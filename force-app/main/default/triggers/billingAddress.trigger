trigger billingAddress on Account (after insert, after update, after delete)
{
   
    if(Trigger.isinsert)
    {
 
        for( Account newAcc : [Select name,(select name from contacts) from account where ID IN : Trigger.new])
        {
            for( contact c: newAcc.contacts)
            {
             c.mailingstreet =  newAcc.billingstreet;
                c.mailingcity= newAcc.billingcity;
                c.mailingcountry = newAcc.billingcountry;
                c.mailingpostalcode = newAcc.billingpostalcode;
                c.mailingstate =newAcc.billingstate;
    }
        }}
    if(Trigger.isupdate)
    {
        for( Account newAcc : [Select name,(select name from contacts) from account where ID IN : Trigger.old])
        {
            for( contact c: newAcc.contacts)
            {
             c.mailingstreet =  newAcc.billingstreet;
                c.mailingcity= newAcc.billingcity;
                c.mailingcountry = newAcc.billingcountry;
                c.mailingpostalcode = newAcc.billingpostalcode;
                c.mailingstate =newAcc.billingstate;
    }
        }
    }
    if(Trigger.isdelete)
    {
         for( Account newAcc : [Select name,(select name from contacts) from account where ID IN : Trigger.old])
        {
            for( contact c: newAcc.contacts)
            {
             c.mailingstreet ='';
                c.mailingcity= '';
                c.mailingcountry = '';
                c.mailingpostalcode ='';
                c.mailingstate = '';
    }
        }}}