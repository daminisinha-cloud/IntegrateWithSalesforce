@isTest
private class WarehouseCalloutServiceTest {
 @isTest static void testCallout() {
     Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
     Test.startTest();
        WarehouseCalloutService.runWarehouseEquipmentSync();
     Test.stopTest();
     
    }
}