@isTest
public class Warehousesyncscheduletest {
 
    public static testmethod void testmet1(){
        String CRON_EXP = '0 0 0 * * ? *';
        Test.startTest();
      
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new WarehouseSyncSchedule());  
        Test.stopTest();
    }
}