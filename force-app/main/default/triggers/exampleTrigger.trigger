trigger exampleTrigger on Contact (after insert, after delete)
{
    if(Trigger.isinsert)
    {
        
        system.debug('new contact');
    }
    if(Trigger.isdelete)
    {
        System.debug('record deleted');
    }

}