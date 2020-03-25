public class resumeBuilder {
@AuraEnabled
    public static List <sObject> fetchLookUpValues(String searchKeyWord) {
       
        String searchKey = searchKeyWord + '%';  
        String sQuery =  'select id, Name,Phone from account where Name LIKE: searchKey order by createdDate DESC limit 5';
        List <sObject> returnList = Database.query(sQuery);
        return returnList;
    }
    @AuraEnabled
    public static List<Contact> fetchrecord(sobject objname){system.debug(objname);
        ID recordid= objname.Id;
        system.debug(recordid);
      String sQuery = 'select id, (Select ID,Name from Contacts) from  account where ID =: recordid';    
        list<contact> con = Database.query(sQuery);System.debug(con);
        return con;
    }
}