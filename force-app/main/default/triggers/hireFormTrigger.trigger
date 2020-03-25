trigger hireFormTrigger on Hire_Form__c (before insert, after update)  {
    if(Trigger.isAfter){
        if(Trigger.isUpdate)
            hireFormhandler.OnUpdateOperation(Trigger.new);
    }
    if(Trigger.isbefore) {
        if(Trigger.isInsert)
            hireFormhandler.OnInsertOnperation(Trigger.new);   
    }
}