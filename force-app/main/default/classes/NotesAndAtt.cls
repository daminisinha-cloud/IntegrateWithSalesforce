public class NotesAndAtt{
    @auraenabled
    public static List<String> getName(String value){
        list<string> list_object = new list<string>();
        if(value == 'Note'){
            for(note n:[Select parent.type from note]){
                if(!list_object.contains(n.parent.type))
                    list_object.add(n.parent.type);  
            }
        }
        if(value == 'Attachment'){
            for(Attachment n:[Select parent.type from Attachment]){
                if(!list_object.contains(n.parent.type))
                    list_object.add(n.parent.type);
            }
        }
        return list_object;  
    }
    @auraenabled
    public static list<sobject> getlist(String text,string parentobj){
       
        //system.debug(parentobj);
        //system.debug(text);
      String keyword = text +'%'; 
       String squery = 'SELECT id, name FROM '+ parentobj+' where name like:keyword LIMIT 50';
      List<sobject> list_object =  Database.query(squery);
        system.debug(list_object);
        return list_object;  
    }
    @auraenabled
    public static list<sobject> finalrecords(string radiovalue, Id record){
        list<sobject> final_list = new list<sobject>();
        if(radiovalue=='Note'){
            for(Note n: [Select id,title,parent.type from note where parentid =:record]){
                final_list.add(n);
            }
            system.debug(final_list);
        }
        if(radiovalue=='Attachment'){
            for(Attachment n: [Select id,name,parent.type from Attachment where parentid =:record]){
                final_list.add(n);
            }
            system.debug(final_list);
        }
        
        return final_list;
    }
    @auraenabled
    public static list<sobject> recordsearch(string name,string parent,string radiovalue){
        list<sobject> record_list = new list<sobject>();
         String keyword = name;
         String squery = 'SELECT id FROM '+ parent+' where name like:keyword';
      List<sobject> list_object =  Database.query(squery);
        system.debug(list_object);
         if(radiovalue=='Note'){
            for(Note n: [Select id,title,parent.type from note where parentid =:list_object]){
                record_list.add(n);
            }}
              if(radiovalue=='Attachment'){
            for(Attachment n: [Select id,name,parent.type from Attachment where parentid =:list_object]){
                record_list.add(n);
            }
    }system.debug(record_list);
   return record_list;
    }}