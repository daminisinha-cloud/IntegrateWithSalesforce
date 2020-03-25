public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer no_of_contacts,String last_name){
        List<contact> con_list = new list<contact>();
        for(Integer i =0; i<no_of_contacts ;i++){
            contact c = new contact(firstname ='test'+i);
            con_list.add(c);
        }
        return con_list;
        
    }
}