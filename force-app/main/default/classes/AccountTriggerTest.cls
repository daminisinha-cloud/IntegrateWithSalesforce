@isTest
public class AccountTriggerTest {
    @istest
    public static void insertacc(){
        list<account> acc = new list<account>();
        for(Integer i= 0;i<200;i++){
            acc.add(new account(name='acc'+i , BillingState ='CA'));
        }
        test.startTest();
      list<account> acc_list =  AccountTriggerHandler.CreateAccounts(acc);
        for(account acc1: acc_list){
             System.assertEquals('CA', acc1.ShippingState);  
        }
     
        test.stopTest();
    }
}