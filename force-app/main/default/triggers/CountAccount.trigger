trigger CountAccount on Account (after insert,after update,after delete) {
    Set<Id> accid = new Set<Id>();
    if(Trigger.IsAfter && Trigger.isInsert){
        for(Account acc : Trigger.New){
          accid.add(acc.parentid);  
        }
        CountAccountHandler.OnInsert(accid);
 
    }
     if(Trigger.IsAfter && Trigger.isUpdate){
        for(Account acc : Trigger.New){
            if(acc.ParentId != Trigger.oldmap.get(acc.Id).parentId){
                 accid.add(acc.parentid); 
                accid.add(Trigger.oldmap.get(acc.Id).parentId);
            }
          
        }
        CountAccountHandler.OnInsert(accid);
 
    }
     if(Trigger.IsAfter && Trigger.isdelete){
       for(Account acc : Trigger.old){
          accid.add(acc.parentid);  
        }
   
        CountAccountHandler.OnInsert(accid);
 
    }
   
}