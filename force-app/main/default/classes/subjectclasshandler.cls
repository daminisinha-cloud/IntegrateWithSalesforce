public class subjectclasshandler {
    public static void OnInsert(set<id> class_id,set<id> subject_id){
       
        map<ID,class__c> classmap = new map<ID,class__c>();
          map<ID,subject__c> subjectmap = new map<ID,subject__c>();
        for(AggregateResult agr:[Select class__c , COUNT(ID) count_class from subjectclass__c where class__c In :class_id GROUP BY class__c]){
            classmap.put((ID)agr.get('class__c'), new class__c(id=(ID)agr.get('class__c'), no_of_sub__c =(Integer)agr.get('count_class')));
          

        }  for(class__c cls:[Select id, no_of_sub__c from class__c where ID IN:class_id]) {
            if(!classmap.containskey(cls.id)) 
            classmap.put(cls.id, new class__c(id=cls.id, no_of_sub__c =0));    
                
            
        }     
        
        for(AggregateResult agr:[Select subject__c , COUNT(ID) count_sub from subjectclass__c where subject__c In :subject_id GROUP BY subject__c]){
              subjectmap.put((ID)agr.get('subject__c'), new subject__c(id=(ID)agr.get('subject__c'), no_of_class__c =(Integer)agr.get('count_sub')));
        } 
        
        for(subject__c s:[Select id, no_of_class__c from subject__c where ID IN:subject_id]) {
            if(!subjectmap.containskey(s.id)) 
            subjectmap.put(s.id, new subject__c(id=s.id, no_of_class__c =0));    
                
            
        }            
        
       update classmap.values();
         update subjectmap.values();
      
    }
}