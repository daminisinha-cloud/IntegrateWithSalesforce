trigger triggercondiadate on Condidate__c (after insert){
       if(Trigger.isAfter && Trigger.isInsert){
            triggercondiadatehandler.operation(Trigger.new); 
        } 
}