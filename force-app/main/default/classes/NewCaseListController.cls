public class NewCaseListController {
    public list<case> getNewCases(){
        list<case> list_case = new list<case>();
        for(case c:[select id,CaseNumber from case where status = 'new'])
        {
            list_case.add(c);
        }
        return list_case;
    }
}