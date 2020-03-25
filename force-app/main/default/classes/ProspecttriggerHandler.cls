public class ProspecttriggerHandler {
    public static void Onupdateoperation(Set<Id> prospect_id){
        Map<string,list<prospect__c>> type_prospect= new map<string,list<prospect__c>>();
        for(prospect__c pros : [Select Id, type__c,(Select Id, type__c from prospects__r) from prospect__c]){
            if(!type_prospect.containskey(pros.Type__c))
           type_prospect.put(pros.Type__c,pros.prospects__r);
            else
                type_prospect.get(pros.Type__c).add(pros.prospects__r);
        }
        
    }
    public static void type_update(){
        
    }

}