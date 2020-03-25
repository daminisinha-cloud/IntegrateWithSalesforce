trigger countmembers on Contact (after insert, after update, after delete){
    if(Trigger.isAfter){
        if(Trigger.isinsert ) {
            set<id> acc_set = new set<id>();
            for(contact con: Trigger.new){
                if(con.AccountId!= null)
                    acc_set.add(con.accountid);
            }
            countmembershandler.insertOperation(acc_set);
        }
        if(Trigger.isdelete){
            set<id> acc_set = new set<id>();
            for(contact con: Trigger.old) {
                if(con.AccountId!= null)
                    acc_set.add(con.accountid);
            }
            countmembershandler.insertOperation(acc_set);
        }
        if(Trigger.isupdate ) {
            Set<id> accIdSet = new Set<id>();    
            for(Contact con : Trigger.New){  
                if(con.AccountId != Trigger.oldMap.get(con.Id).accountId) {                    
                    accIdSet.add(con.AccountId);      
                    accIdSet.add(Trigger.oldMap.get(con.Id).accountId);     }  
                countmembershandler.insertOperation(accIdSet);
            } 
        }   
    }}