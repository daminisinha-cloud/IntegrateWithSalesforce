trigger UserTrigger on User (after insert) {
    
    if(Trigger.isInsert && Trigger.isAfter){
        for(user u : Trigger.New){
            
        }
    }

}