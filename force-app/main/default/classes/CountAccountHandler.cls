public class CountAccountHandler {
    public static void OnInsert(Set<Id> accid){
        map<ID,List<account>> accmap = new map<ID,List<account>>();
        list<account> acclist = new list<account>();
        for(Account acc :[Select Id,(Select Id , Name from ChildAccounts) from account where id IN : accid]){
            accmap.put(acc.Id,acc.ChildAccounts);
            
        }
        for(Account acc :[Select Id ,NoOfAccounts__c from account where id IN:accid]){
            if(acc.NoOfAccounts__c==null){
                acc.NoOfAccounts__c=0;
            }
            acclist.add(new account(id= acc.Id , NoOfAccounts__c = accmap.get(acc.Id).size()));
        }
        update acclist;
        
    }

}