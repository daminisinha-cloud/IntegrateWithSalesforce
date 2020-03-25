public class AccountProcessor {
@future
   public static void countContacts(list<ID> accountid){
        list<account> acc_list =([Select id , Number_of_Contacts__c, (Select id from contacts) from account where ID IN:accountid]);
        for(account acc: acc_list){
           list<contact> con_list =acc.contacts;

            acc.Number_of_Contacts__c = con_list.size();
        }
          
        
    }
}