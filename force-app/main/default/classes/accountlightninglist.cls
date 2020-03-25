public class accountlightninglist {
@auraenabled
    public static list<account> getaccount(ID acc_id){
        list<account> acc_list =[Select id ,Phone, Name ,(Select lastname from contacts) from account where id  =:acc_id];
        return acc_list;
    }
   
}