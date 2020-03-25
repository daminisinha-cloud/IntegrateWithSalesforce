public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(String lastname)
    {
      List<List< SObject>> search = [Find :lastname IN NAME Fields Returning contact(Name),Lead(firstName)];  
          System.debug(search);
        return search;
      
    }

}