@istest
public class AccountProcessorTest {
    @istest
    static void testaccountorocessor(){
    account acc = new account(name='ABC');
    insert acc;
    contact con= new contact(accountid= acc.id , lastname='xyz');
    insert con;
        list<id> acc_id = new list<id>();
        acc_id.add(acc.id);
    test.startTest();
    AccountProcessor.countContacts(acc_id);
    test.stopTest();
     
    }}