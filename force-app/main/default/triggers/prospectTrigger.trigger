trigger prospectTrigger on prospect__c (before update) {
    Set<Id> prospectid = new Set<Id>();
    if(Trigger.isUpdate && Trigger.isbefore){
        for(prospect__c pros : trigger.new){
           if(pros.type__c != Trigger.oldMap.get(pros.Id).type__c)
          prospectid.add(pros.id);   
        }
       ProspecttriggerHandler.Onupdateoperation(prospectid);
    }

}