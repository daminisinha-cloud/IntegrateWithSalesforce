trigger AccountTeamTrigger on AccountTeam__c (after insert,after update,after delete){
    Set<ID> accountid = new Set<ID>();
    if(Trigger.IsAfter && Trigger.IsInsert){
        for(AccountTeam__c acc: Trigger.new){
            if(acc.Account__c!=null)
            accountid.add(acc.Account__c);
            system.debug('1234');
        }
        AccountTeamTriggerHandler.OnOperation(accountid);
    }
    if(Trigger.IsAfter && Trigger.isupdate){
         Set<id> accIdSet = new Set<id>();    
        for(AccountTeam__c acc: Trigger.New){  
            if(acc.account__c != Trigger.oldMap.get(acc.Id).account__c)
            {                    
                accountid.add(acc.account__c);      
                accountid.add(Trigger.oldMap.get(acc.Id).account__c);    
            }  
            
             AccountTeamTriggerHandler.OnOperation(accountid);
        } 

    }if(Trigger.IsAfter && Trigger.Isdelete){
        for(AccountTeam__c acc: Trigger.old){
            accountid.add(acc.Account__c);
        }
        AccountTeamTriggerHandler.OnOperation(accountid);
    }

}