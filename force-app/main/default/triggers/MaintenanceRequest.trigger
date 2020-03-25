trigger MaintenanceRequest on Case (before update, after update) {
    if(trigger.isUpdate && trigger.isAfter){
         list<case> case_list = new list<case>();
        for(Case cs : trigger.new){
            if(cs.Type=='Repair'||cs.Type=='Routine Maintenance'){
                if(cs.Status == 'closed')
                 case_list.add(cs);    
            }
           
        }
        MaintenanceRequestHelper.updateWorkOrders(case_list);
    }
}