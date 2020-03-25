global class schdeluler implements Schedulable{
    global void execute(SchedulableContext s){
        database.executeBatch(new batchexample(), 50);
    }

}