public class ContactSearch {
    public static List<Contact> searchForContacts(String ln, String postal){
        List<Contact> cts = [Select LastName FROM Contact Where LastName= '' AND MailingPostalCode= :postal];
            return cts;
    }

}