global class CreateLeadfromeamail implements Messaging.InboundEmailHandler {
 
  global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, 
                                                       Messaging.InboundEnvelope env){
    Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
  
    String myPlainText= '';
    myPlainText = email.plainTextBody;
    Lead[] newLead = new Lead[0];
      newLead.add(new Lead(Description =  myPlainText,
           leadsource = 'web',
           email = email.fromAddress,
           lastname = email.fromName,
           company = email.subject
           ));
     insert newLead;    
     
     System.debug('New Lead Object: ' + newLead );   
    
   result.success = true;
   
   // Return the result for the Apex Email Service
   return result;
  }
}