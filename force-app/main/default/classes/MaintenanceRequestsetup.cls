public class MaintenanceRequestsetup {
    public static void insertcase(){
         List<Case> caseList = new List<Case>();
        for(Integer i=0;i<3;i++)
        {
            Case c=new Case(Subject='TestSubject '+i);
            caseList.add(c);
        }
       
        insert caseList;
 
    }
}