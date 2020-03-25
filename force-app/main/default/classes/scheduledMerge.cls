global class scheduledMerge implements Schedulable {
    global void execute(SchedulableContext SC) {
        batchclass b = new batchclass(); 
     // String sch = '20 30 8 10 2 ?';
        String jobID = system.scheduleBatch( b,'Merge Job', 1);
        CronTrigger ct = [SELECT Id, TimesTriggered, NextFireTime
                FROM CronTrigger WHERE Id = :jobID];
        system.debug('ct :'+ ct);
        //  database.executebatch(b);
        
    }
}