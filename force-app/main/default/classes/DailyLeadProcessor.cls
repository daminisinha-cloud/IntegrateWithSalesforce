global class DailyLeadProcessor implements Schedulable  {
    global void execute(SchedulableContext ctx){
        list<lead> lead_list = new list<lead>();
        for(lead leads :[Select id, leadsource from lead where leadsource ='' LIMIT 200]){
            leads.leadsource ='Dreamforce';
            lead_list.add(leads);
        }
        update lead_list;
    }

}