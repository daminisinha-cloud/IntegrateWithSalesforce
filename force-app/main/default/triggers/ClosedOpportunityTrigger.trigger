trigger ClosedOpportunityTrigger on Opportunity (after insert,after update){
    List<task> t = new List<task>();
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
            
            for(opportunity o:[select ID from opportunity where ID IN :Trigger.new and StageName='Closed Won']) {          
                t.add(new task(subject='Follow Up Test Task',WhatId=o.Id,status='Not Started'));    
            }}
    }
    if(!t.isempty())
        insert t;  
}