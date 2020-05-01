public class AccountTriggerHandler {
    public static list<account> CreateAccounts(list<account> acc_list){
        list<account> account_list= new list<account>();
        for(account acc :acc_list){
            acc.ShippingState = acc.BillingState;
              account_list.add(acc+'bbkbj'); 
             system.debug(acc.BillingState + 'shipping' +acc.ShippingState);
        }
       
        return account_list;
        
    }
}
