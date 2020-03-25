public class countmembers2 
{
public static void insertOperation(set<id> set_id)
{
    for(id acc :set_id )
    {
    List<contact> contactToUpdate = new list<contact>([Select id , accountid from contact where accountid IN: set_id]);
    system.debug(contactToUpdate.size());
    for( contact con : contactToUpdate)
    {
        con.CountFamilymembers__c = contactToUpdate.size();
    }
    update contactToUpdate;
    }}
}