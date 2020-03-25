public class accountApex {
    @AuraEnabled
    public static List <sObject> fetchLookUpValues(String searchKeyWord) {
        
        String searchKey = searchKeyWord + '%';  
        String sQuery =  'select Id, Name,Phone from account where Name LIKE: searchKey order by createdDate DESC limit 50';
        List <sObject> returnList = Database.query(sQuery);
        return returnList;
    }
    @AuraEnabled
    public static List<Contact> fetchrecord(sobject objname){
        ID recordid= objname.Id;
        Account acc= [select id, (Select ID, FirstName, LastName, Phone, Email from Contacts) from  account where ID =: recordid];    
        list<contact> con =acc.Contacts;System.debug(con);
        return con;
    }
    @AuraEnabled
    public static Contact deleteContact(Contact contact) {
        delete contact;
<<<<<<< HEAD
        
=======
>>>>>>> 658351f... commit
        return contact;
    }
    @AuraEnabled
    public static list<contact> insertData(String strfromlex , Id accountid)
    {
        String returnresponse ='';
        List<Contact> contactList = new List<Contact>();
        List<fieldWrapper> datalist = (List<fieldWrapper>) JSON.deserialize(strfromlex, List<fieldWrapper>.class);
        system.debug('@@@ datalistSize = ' + datalist.size());
        for(fieldWrapper wrapper: datalist)
        {
            Contact acc =new  Contact();
            acc.FirstName = wrapper.FirstName;
            acc.LastName = wrapper.LastName;
            acc.Phone = wrapper.phone;
            acc.Email = wrapper.Email;
            acc.accountId = accountid;
            contactList.add(acc);
        }
        if(contactList.size() > 0)
        {
            try {
                insert contactList;
                returnresponse = 'SUCCESS';
            }
            catch(Exception ex)
            {
                returnresponse = 'ERROR';
            }
        }
        return contactList;
    }
  
    public class fieldWrapper {

    public String FirstName;
        
    public String LastName;
   public String Email;
    public String phone;

  } 
}