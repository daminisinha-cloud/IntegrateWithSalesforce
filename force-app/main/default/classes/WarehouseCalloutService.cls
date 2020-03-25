public with sharing class WarehouseCalloutService {
    
    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
     @future(callout=true)
    public static void runWarehouseEquipmentSync(){
        list<Product2> eqipment = new list<Product2>();
        http h = new http();
        Httprequest htreq = new Httprequest();
        htreq.setEndpoint(WAREHOUSE_URL);
        htreq.setMethod('GET');
        
        Httpresponse htresponse = h.send(htreq);
        String response = htresponse.getBody();
        if(htresponse.getStatusCode()==200){
            list<wrapperclass> res= (list<wrapperclass>)JSON.deserialize(htresponse.getBody(), list<wrapperclass>.class);
            system.debug('response'+res);
            
            for(wrapperclass pdt : res){
                
                eqipment.add(new Product2(id=pdt.x_id,Replacement_Part__c= true,Name = pdt.name, Current_Inventory__c =pdt.quantity,Maintenance_Cycle__c =pdt.maintenanceperiod,Lifespan_Months__c = pdt.lifespan ,	Cost__c = pdt.cost ,Warehouse_SKU__c = pdt.sku));
            }
            upsert eqipment;
            
            
        }
        
        
    }
    public class wrapperclass{
        String x_id; 
        Boolean replacement; 
        Integer quantity; 
        String name;
        Integer maintenanceperiod;
        Integer lifespan; 
        Integer cost; 
        String sku;  
        
    }
}