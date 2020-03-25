trigger subjectclasstrigger on subjectclass__c (before insert, before update,after delete){
    set<iD> class_id = new Set<ID>();
    set<iD> subject_id = new Set<ID>();
    if(Trigger.isInsert||Trigger.isundelete){
        for(subjectclass__c sc: Trigger.new){
            
            class_id.add(sc.class__c);
            
             subject_id.add(sc.subject__c);
        }
        subjectclasshandler.OnInsert(class_id,subject_id); 
    }
    if(Trigger.isbefore&&Trigger.isUpdate){
        for(subjectclass__c sc: Trigger.new){
           
               if(sc.class__c!=Trigger.oldmap.get(sc.Id).class__c){
             class_id.add(sc.class__c); 
            class_id.add(Trigger.oldmap.get(sc.Id).class__c);   
               }
        
               if(sc.subject__c!=Trigger.oldmap.get(sc.Id).subject__c){
              subject_id.add(sc.subject__c);
               subject_id.add(Trigger.oldmap.get(sc.Id).subject__c);  
            }
              
            }
        
            }
            
        
        
    subjectclasshandler.OnInsert(class_id,subject_id); 
    if(Trigger.isDelete){
     for(subjectclass__c sc: Trigger.old){
            class_id.add(sc.class__c);
             subject_id.add(sc.subject__c);
        }
        subjectclasshandler.OnInsert(class_id,subject_id); 
    }   
    }