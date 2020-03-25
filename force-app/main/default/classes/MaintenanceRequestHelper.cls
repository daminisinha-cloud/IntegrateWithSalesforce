public class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(list<case> case_list){
        list<case> new_case = new list<case>();
        for(Case cs : case_list ){
            System.debug(cs);
            Integer days = (Integer)cs.Equipment__r.Maintenance_Cycle__c;
            if(days==null)
                days=0;
            DateTime dT = System.now();
            Date myDate = date.newinstance(dT.year(), dT.month(), dT.day());

            case temp_case = new case(Vehicle__c = cs.Vehicle__c ,status ='New',Equipment__c = cs.Equipment__c , type ='Routine Maintenance' ,Subject ='Maintance Renewed',Date_Reported__c= System.today(),	Date_Due__c = myDate + days);
            new_case.add(temp_case); 
            
        }
         System.debug(new_case);
        database.insert(new_case,false) ;
        
    }        
    
}