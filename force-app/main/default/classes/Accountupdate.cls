public class Accountupdate 
{
  @invocablemethod
    public static void oppupdate(list<id> opp_list)
    {
        list<opportunity> op = [select id from opportunity where accountid =:opp_list];
               for( opportunity op_l : op)
        {
            op_l.stagename = 'prospecting';
             update op_l; 
        }
        
    }

}