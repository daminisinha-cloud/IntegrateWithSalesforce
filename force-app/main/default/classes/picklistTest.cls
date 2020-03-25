public class picklistTest{
    @AuraEnabled
    public static List<String> objectlist(){
        List<String> options = new List<String>(); 
      /*  for(Schema.SObjectType s : Schema.getGlobalDescribe().values()){
            options.add(s.getDescribe().getLabel());
          
        }*/
       list<String> list_pick = new list<String>();
        for(picklist__c p : picklist__c.getAll().values()){
           list_pick.add(p.name);  
        }
        return list_pick;
        
    }
    @AuraEnabled
    public static List<String>  childlist(String obj){
        List<String> options = new List<String>(); 
        Set<String> fields = new Set<string>();
        for(Schema.SObjectType s : Schema.getGlobalDescribe().values()){
            Map<String,Schema.SObjectField> obj_map = Schema.getGlobalDescribe().get(obj).getDescribe().fields.getMap();
            fields.addall(obj_map.keyset());
           
     }
        options.addall(fields);
        return options;
        
    }
   
    
}