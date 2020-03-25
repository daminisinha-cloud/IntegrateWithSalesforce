public class deletequote
{
    @invocablemethod
    public static void deletequotes(List<id> Opportunity_id)
    {
        list<quote> quotes=[select id from quote where opportunityid =: Opportunity_id and status != 'accepted'];
            delete quotes;
    }

}