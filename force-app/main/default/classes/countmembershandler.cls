public class countmembershandler {
    public static void insertOperation(set<id> set_id) {
        /*map<ID, List<contact>> contactmap= new map<ID, List<contact>>();
        List<contact> con_list = new list<contact>();
         List<contact> con1_list = new list<contact>();
        for(ID acc_id: set_id){
            con_list.add([Select ID from contact where accountid =:acc_id]);
            contactmap.put(acc_id,con_list);
        }con_list = new list<contact>(); 
        for(contact con : [Select id, accountid, CountFamilymembers__c from contact where accountid IN : set_id  ]){
            con1_list = contactmap.get(con.accountid);
            system.debug(con1_list.size());
            con_list.add( new contact(id= con.id , accountid = con.AccountId , CountFamilymembers__c = con1_list.size()));
        con1_list = new list<contact>();}
        
    update con_list;
    }}

        map<ID, Integer> countmap =new map<ID,Integer>();
        List<contact> contactToUpdate = new list<contact>();
        for( AggregateResult agg : [Select accountid , count(id) count_contact  from contact where accountid IN : set_id Group By accountid])  
            countmap.put((ID)agg.get('accountid'),(Integer)agg.get('count_contact'));
        for(contact con : [Select id, accountid, CountFamilymembers__c from contact where accountid IN : set_id  ])
            contactToUpdate.add( new contact(id= con.id , accountid = con.AccountId , CountFamilymembers__c = countmap.get(con.AccountId)));
        if(contactToUpdate != null && contactToUpdate.size() > 0)
            update contactToUpdate;}}
         map<ID, Integer> countmap = new map<ID, Integer>();
for( contact c: [Select id, accountid from contact where accountid IN :set_id ])
{
if(!countmap.containskey(c.accountid))
{
countmap.put(c.accountid,0);
}
integer value = countmap.get(c.accountid);
countmap.put(c.accountid, value+1);
}*/
      map<Id,list<contact>> con_map= new map<ID,list<contact>>(); 
        list<contact> con_list = new list<contact>();
        
        for(account acc:[Select Id,(Select Id,CountFamilymembers__c from contacts) from account where Id IN :set_id]){
    con_map.put(acc.id,acc.contacts);
        }for(contact con :[Select Id, accountid,CountFamilymembers__c from contact where accountid IN :set_id]){
            con_list.add(new contact(id =con.id, AccountId= con.AccountId,CountFamilymembers__c = con_map.get(con.AccountId).size()));
            
        }update con_list;}}