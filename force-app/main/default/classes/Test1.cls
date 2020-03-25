public class Test1 
{
    public static void makeAccount()
    {
        Account acct = new Account(Name = 'Cloudcertitude');
        insert acct;
         Account acct1 = new Account(Name = ' childEmolyopee', Parentid=acct.id);
        insert acct1;
        List<opportunity> opplist = new List<opportunity>();
            List<contact> contactlist = new List<contact>();
            for(integer i=1;i<=5;i++)
        {
            contactlist.add(new contact(lastname='Test ' + i, accountid =acct1.id ));
            opplist.add(new opportunity(Name='Test' + i, AccountId=acct1.id, CloseDate=Date.valueOf('2008-04-28'), StageName='Prospecting') );
        } 
        
        insert contactlist;
        insert opplist;
    }}