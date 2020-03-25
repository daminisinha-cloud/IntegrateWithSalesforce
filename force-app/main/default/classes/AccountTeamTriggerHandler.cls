public class AccountTeamTriggerHandler {
    public static void OnOperation(Set<ID> accountid){
   
       map<Id,list<AccountTeam__c>> m = new map<Id,list<AccountTeam__c>>();
        list<account> acc_list = new list<account>();
        list<opportunity> opp_list = new list<opportunity>();
        for(account acc: [select Id, NoOfTeamMembers__c, (select ID from AccountTeams__r) from account where ID IN :accountid]){
            m.put((ID)acc.id,acc.AccountTeams__r);
           acc_list.add(new Account(id=acc.id, NoOfTeamMembers__c=m.get(acc.id).size()));
        }update acc_list;
        for(opportunity opp: [Select ID,accountid, StarAccount__c from opportunity where accountid IN :accountid]){
            if(m.get(opp.AccountId).size() >5){
                opp_list.add(new opportunity(id = opp.Id,StarAccount__c=true));
               
}else{
opp_list.add(new opportunity(id = opp.Id,StarAccount__c=false));
}
        }update opp_list;
    /*    map<ID,Integer> m = new map<ID,Integer>();
        map<ID,Account> acc_map = new map<ID,Account>();
        for(AccountTeam__c acc:[Select account__c from AccountTeam__c where account__c In:accountid]){
        
            if(!m.containskey(acc.account__c)){
                m.put((ID)acc.account__c,0);
            }
                Integer value = m.get(acc.account__c);
                m.put((ID)acc.account__c,value+1);
            }
           for(ID acc:accountid){
                acc_map.put((ID)acc,new account(id=acc, NoOfTeamMembers__c=m.get(acc)));
            
            
        } update acc_map.values();*/
    } 
}