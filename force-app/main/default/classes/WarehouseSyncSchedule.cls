public class WarehouseSyncSchedule  implements Schedulable{
    public void execute(SchedulableContext SC){
        WarehouseCalloutService.runWarehouseEquipmentSync();
    }
}