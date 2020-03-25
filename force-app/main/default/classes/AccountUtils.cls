public class AccountUtils {
    public static list<account> accountsByState (String state){
      list<account>  acc = new list<account> (); 
        for(account a : [Select Id, name, billingstate from account where billingstate =:state])
           acc.add(a);
        return acc;
    }

}