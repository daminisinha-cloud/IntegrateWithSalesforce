trigger triggerContact on Contact (after insert ,after update , before delete){
    if(Trigger.isAfter && Trigger.isInsert ) {
        Set<id> acc_set = new set<id>();
        for(contact con : Trigger.new) {
            if(con.accountid != null)
                acc_set.add(con.accountid);
        }
        map<ID,account> acc =new map<ID,account> ([Select id, RollScore1__c,RollScore2__c from account where id IN :acc_set]);
        for( contact c : Trigger.new) {
            if(acc.get(c.accountid).RollScore1__c == null||acc.get(c.accountid).RollScore2__c == null){
                acc.get(c.accountid).RollScore1__c =0;
            acc.get(c.accountid).RollScore2__c =0;}
            acc.get(c.accountid).RollScore1__c += c.score1__c;
            acc.get(c.accountid).RollScore2__c += c.score2__c;
        }update acc.values();
    }
    if(Trigger.isBefore && Trigger.isDelete){
        Set<id> acc_set1 = new set<id>();
        for(contact con:Trigger.old) {
            if(con.accountid != null)
                acc_set1.add(con.accountid);
        }
        map<ID,account> acc =new map<ID,account> ([Select id, RollScore1__c,RollScore2__c from account where id IN :acc_set1]);
        for( contact c : Trigger.old) {
            acc.get(c.accountid).RollScore1__c -= c.score1__c;
            acc.get(c.accountid).RollScore2__c -= c.score2__c;
        }update acc.values();
    }
    
    if(Trigger.isAfter && Trigger.isupdate) {
        Set<id> acc_set1 = new set<id>();
        for(contact con:Trigger.old){
            if(con.accountid != null)
                acc_set1.add(con.accountid);
        } map<ID,account> acc =new map<ID,account> ([Select id, RollScore1__c,RollScore2__c from account where id IN :acc_set1]);
        
        for( contact c : Trigger.old) {
            acc.get(c.accountid).RollScore1__c -= c.score1__c;
            acc.get(c.accountid).RollScore2__c -= c.score2__c;
        }update acc.values();
        set<id> acc_set2  = new set<id>();
        for(contact con:Trigger.new) {
            acc_set2.add(con.accountid);
        }map<ID,account> acc2 =new map<ID,account> ([Select id, RollScore1__c,RollScore2__c from account where id IN :acc_set2]);
        
        for( contact c : Trigger.new) {
            if(acc.get(c.accountid).RollScore1__c == null)
                acc.get(c.accountid).RollScore1__c =0;
            
            acc2.get(c.accountid).RollScore1__c += c.score1__c;
            acc2.get(c.accountid).RollScore2__c += c.score2__c;
        }update acc2.values();
    }
}