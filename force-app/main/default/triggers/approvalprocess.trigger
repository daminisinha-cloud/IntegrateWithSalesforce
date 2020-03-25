trigger approvalprocess on Opportunity (before update) {
    if(trigger.isupdate && trigger.isbefore){
        system.debug(trigger.oldmap);
        system.debug(trigger.newmap);
        for(opportunity opp : trigger.new ){
          
              system.debug('opp.new name'+opp.StageName);
            system.debug('opp.temp stage'+opp.Temporary_stage__c);
            System.debug('trigger.oldmap.get(opp.id).stagename'+trigger.oldmap.get(opp.id).stagename);
            if(opp.stagename != trigger.oldmap.get(opp.id).stagename && opp.StageName!=opp.Temporary_stage__c){
             Approval.ProcessSubmitRequest approvalRequest = new Approval.ProcessSubmitRequest();
            approvalRequest.setComments('Offer Submitted for approval');
            approvalRequest.setObjectId(opp.Id);
            Approval.ProcessResult approvalResult = Approval.process(approvalRequest);
            System.debug('offer submitted for approval successfully: '+approvalResult .isSuccess());
                if(approvalResult .isSuccess()){
                     opp.Temporary_stage__c = opp.StageName;
                    opp.StageName = trigger.oldmap.get(opp.id).stagename;
                    opp.Approval_Status__c = 'pending';
                       
                                   }
                
        }
              if(opp.Approval_Status__c == 'approved'){
                  opp.StageName  =   opp.Temporary_stage__c;
            }
        } 
    }

}