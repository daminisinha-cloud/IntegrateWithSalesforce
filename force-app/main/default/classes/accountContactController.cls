public class accountContactController {
   
    public list<account> account_list{get;set;}
    public list<account> results{get;set;}

    public string searchString{get;set;}
    public PageReference search() {
    runSearch();
    return null;
  }
  private void runSearch() {
        results = accountname(searchString);               
  }
    public  list<Account> accountname(string searchString){
        account_list = [Select Id, name from account where name like:searchString+'%'];
        system.debug(account_list);
        return account_list;
    }
}