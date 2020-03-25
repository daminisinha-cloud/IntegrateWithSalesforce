public class rewardapex {
@AuraEnabled
    public static list<reward__c> fetchreward(sobject acc){
        list<reward__c> reward_list = [Select Id, name,Move_In_Date__c,Start_Date__c,Total__c,account__c, RecordType.Name, Approved__c, Reject__c,
                                       Payment_Date__c,Survey_Completed_Date__c,Survey_Completed__c
                                       from reward__c where account__c =: acc.id AND Approved__c =false AND Reject__c =false];
        return reward_list;
    }

@AuraEnabled
public static void updaterecord(list<reward__c> updatelist){
    update updatelist;
   
}
    @AuraEnabled
public static void createrecord(reward__c reward){
    system.debug(reward.RecordTypeId);
   insert reward;
   
}
}