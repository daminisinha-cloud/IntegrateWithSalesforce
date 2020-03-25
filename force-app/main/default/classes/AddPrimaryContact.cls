public class AddPrimaryContact implements Queueable {
    contact con;
    String state;
    public AddPrimaryContact(contact con , String state){
        this.con = con;
        this.state = state;
    }
    public void execute(QueueableContext context) {
        List<Account> ListAccount = [SELECT ID, Name ,(Select id,FirstName,LastName from contacts ) FROM ACCOUNT WHERE BillingState = :state LIMIT 200];
        List<Contact> lstContact = new List<Contact>();
         for (Account acc:ListAccount)
            {
             Contact cont = con.clone(false,false,false,false);
             cont.AccountId =  acc.id;
            lstContact.add( cont );
           }
        if(lstContact.size() >0 )
        {
           insert lstContact;
        }}}