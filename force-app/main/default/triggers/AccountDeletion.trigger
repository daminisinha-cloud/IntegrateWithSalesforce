trigger AccountDeletion on Account (before delete)
{
    for(account a : [Select ID from account where ID IN (select AccountId from opportunity) AND ID IN : Trigger.old])
    {
        trigger.oldmap.get(a.id).addError('Canot delete account with opportunity');
    }
    

}