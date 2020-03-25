trigger Opportunitytrigger on Opportunity (After insert , after update) {
    if(Trigger.isAfter) {
        if(Trigger.isInsert)
            OpportunityTriggerHandler.OnAfterInsert(Trigger.new);  
        if(Trigger.isUpdate)
            OpportunityTriggerHandler.OnAfterUpdate(Trigger.new , Trigger.oldmap);    
    } 
}