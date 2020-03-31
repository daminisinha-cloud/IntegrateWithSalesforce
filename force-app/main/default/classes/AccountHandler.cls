public class AccountHandler {
public static Account insertNewAccount(String name)
{
    try{
        Account acct=new Account (Name=name);
        system.debuf('tesr');
        insert acct;
        return acct;
    }
    catch(DmlException e){
    System.debug(e.getMessage());
        return null;
      }
}
}
