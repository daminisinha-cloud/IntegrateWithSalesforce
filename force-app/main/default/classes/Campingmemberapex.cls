public class Campingmemberapex {
    @Auraenabled
    public static   map<String,list<sobject>> fetchvalues(String objname){
        String leadlist  = 'Select Id, name, email, phone, RecordTypeId,RecordType.Name from '+objname + ' WHERE recordTypeId != NULL limit 5';
        String contactlist  = 'Select Id, name, email, phone, RecordTypeId,RecordType.Name from '+objname + ' WHERE recordTypeId != NULL';
        String accountlist  = 'Select Id, name, phone, RecordTypeId, RecordType.Name  from '+objname + ' WHERE recordTypeId != NULL';
        list<lead> leadrecord_list = new list<lead>();
        list<account> accountrecord_list = new list<account>();
        list<contact> contactrecord_list = new list<contact>();
        map<String,list<sobject>> record_map = new map<String,list<sobject>>();
        if(objname =='lead'){
            leadrecord_list  = Database.query(leadlist);         
        }
        if(objname =='account'){
            accountrecord_list  = Database.query(accountlist);
        }
        if(objname =='contact'){
            contactrecord_list  = Database.query(contactlist);  
        }
        for(account obj : accountrecord_list){
            if(record_map.containsKey(obj.RecordType.Name)){
                record_map.get(obj.RecordType.Name).add(obj);
            }
            else{
                record_map.put(obj.RecordType.Name, new list<account>());  
                record_map.get(obj.RecordType.Name).add(obj);   
            }
            
            
        }
        for(contact obj : contactrecord_list){
            if(record_map.containsKey(obj.RecordType.Name)){
                record_map.get(obj.RecordType.Name).add(obj);
            }
            else{
                record_map.put(obj.RecordType.Name, new list<contact>());  
                record_map.get(obj.RecordType.Name).add(obj);   
            }
            
            
        }
        for(lead obj : leadrecord_list){
            if(record_map.containsKey(obj.RecordType.Name)){
                record_map.get(obj.RecordType.Name).add(obj);
            }
            else{
                record_map.put(obj.RecordType.Name, new list<lead>());  
                record_map.get(obj.RecordType.Name).add(obj);   
            }
            
            
        }
      
       return  record_map;
    }
    @Auraenabled
    public static void sendemailapex(){
        
    }
    
}