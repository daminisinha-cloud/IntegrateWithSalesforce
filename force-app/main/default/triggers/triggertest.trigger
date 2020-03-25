trigger triggertest on contact(before insert) 
{
  Set<String> values = new set<string>();
        for(contact con :[Select name, email from contact]){
            values.add(con.name);
            values.add(con.Email);
        
    }
    for(contact con: Trigger.new){
        if(values.contains(con.Name)||values.contains(con.email)){
            con.adderror('Cannot insert');
        }
        else{
            values.add(con.email);
            values.add(con.name);
        }
    }
}