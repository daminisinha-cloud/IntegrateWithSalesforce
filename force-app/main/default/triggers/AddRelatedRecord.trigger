trigger AddRelatedRecord on Account (after insert, after update)
{
    list<opportunity> opplist = new list<opportunity>();
    
    map<ID,account> accwithopp = new map<ID,account>([Select ID from account where ID IN : Trigger.new]);
    for( account a: Trigger.new)
    {
        
    }
   
}