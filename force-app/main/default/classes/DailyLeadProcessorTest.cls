@istest
public class DailyLeadProcessorTest {
@istest
    static void testlead(){
        list<lead> lead_list = new list<lead>();
        for(Integer i = 0; i<200; i++){
             lead_list.add(new lead(lastname='lead'+i, status='open-not contacted',company ='ABC'));
        }
        insert  lead_list;
        Test.startTest();
        DailyLeadProcessor dlp = new DailyLeadProcessor();
        String sch = '20 30 8 10 2 ?';
         String jobID = System.schedule('Remind Opp Owners', sch, dlp);
        Test.stopTest();
    }
}