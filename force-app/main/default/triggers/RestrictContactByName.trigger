trigger RestrictContactByName on Contact (before insert , before update) {
    for(contact c: Trigger.new){
        if(c.lastname =='INVALIDNAME')
            c.adderror('it cant be added');
    }
}