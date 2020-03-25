trigger hireform_caseTrigger on Case (before update){
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            hireFormhandler.update_case(Trigger.new);
        }
    }
}