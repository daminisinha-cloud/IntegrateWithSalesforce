trigger Emailtrigger on Account (after insert) {
    Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
message.toAddresses = new String[] { 'nidhikumari8826@gmail.com' , 'daminisinha.cloud@gmail.com' };
message.optOutPolicy = 'FILTER';
message.subject = 'Opt Out Test Message';
message.plainTextBody = 'This is the message body.';
    message.setReplyTo('support@acme.com');
Messaging.SingleEmailMessage[] messages = 
    new List<Messaging.SingleEmailMessage> {message};
         Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
if (results[0].success) {
    System.debug('The email was sent successfully.');
} else {
    System.debug('The email failed to send: '
          + results[0].errors[0].message);
}

}