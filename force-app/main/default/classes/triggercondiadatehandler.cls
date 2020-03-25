public class triggercondiadatehandler {
    public static void operation(List<Condidate__c> con) {
        /* account brok_acc = new account();
account manage_acc = new account();
for(Condidate__c c : con){
if(c.Brokerage__c != null) {
brok_acc = new account(name ='account_condiadate') ;
insert brok_acc; 
}
if(c.Manage_Brokerage__c != null) {
manage_acc = new account(name='account2' , parentid = brok_acc.id );
insert manage_acc;
} 
contact manage_con = new contact(lastname ='contact_condidate' , accountid = manage_acc.id ,Condidate__c= c.id);
insert manage_con;
task t = new task(whoid = manage_con.id , whatid =c.id , subject ='Portal Contact Setup');
insert t;
}*/
        map<ID, Account> brokerage_map = new map<ID, Account>();
        map<ID, Account> managebrokerage_map = new map<ID, Account>();
        map<ID, Contact> contact_map = new map<ID, Contact>();
        map<ID, task> task_map = new map<ID, task>();
        for(Condidate__c c : con)  {
            if(c.Brokerage__c != null)
                brokerage_map.put(c.id ,  new account(name ='account_condiadate') ); 
        }
        insert brokerage_map.values();
        for(Condidate__c c : con) {
            if(c.Manage_Brokerage__c != null)
                managebrokerage_map.put(c.id ,  new account(name ='account_managebrokerage',parentid =  brokerage_map.get(c.id).id) ); 
        }
        insert managebrokerage_map.values();
        for(Condidate__c c : con){
            contact_map.put(c.id , new contact (lastname ='contact_condidate' , accountid =  managebrokerage_map.get(c.id).id ,Condidate__c= c.id));
            task_map.put(c.id, new task(whoid =managebrokerage_map.get(c.id).id , whatid =c.id , subject ='Portal Contact Setup'));
            
        }insert contact_map.values();
        insert  task_map.values();
        
    }
}