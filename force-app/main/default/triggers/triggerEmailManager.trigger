trigger triggerEmailManager on Contact (after insert , after delete) {
    if(Trigger.isinsert)
        EmailManager.sendMail('daminisinha.cloud@gmail.com', 'contact created','contact has been created');
    if(Trigger.isdelete)
        EmailManager.sendMail('daminisinha.cloud@gmail.com', 'contact created','contact has been deleted');
    
}