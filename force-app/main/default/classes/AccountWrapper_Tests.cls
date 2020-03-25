@isTest
private class AccountWrapper_Tests {
  @testSetup
  static void loadTestData(){
    List<Account> accounts = (List<Account>) Test.loadData(Account.SObjectType, 'accountData');
    List<Opportunity> opps = new List<Opportunity>();
    for(Account a : accounts){
      opps.addAll(TestFactory.generateOppsForAccount(a.id, 1000.00, 5));
    }
    insert opps;
  }
    @istest
    static void ishighprioritytest(){
         List<AccountWrapper> accounts = new List<AccountWrapper>();
    for(Account a : [SELECT ID, Name FROM ACCOUNT]){
      accounts.add(new AccountWrapper(a));
    }
        Test.startTest();
   for(AccountWrapper a : accounts){
      System.assertEquals(a.isHighPriority(), false );
   }
    Test.stopTest(); 
    }
    
  @isTest 
static void testPositiveRoundedAveragePrice() {
    List<AccountWrapper> accounts = new List<AccountWrapper>();
    for(Account a : [SELECT ID, Name FROM ACCOUNT]){
      accounts.add(new AccountWrapper(a));
    }
    // sanity check asserting that we have opportunities before executing our tested method.
    List<Opportunity> sanityCheckListOfOpps = [SELECT ID FROM Opportunity];
    System.assert(sanityCheckListOfOpps.size() > 0, 'You need an opportunity to continue');
    Test.startTest();
    for(AccountWrapper a : accounts){
      System.assertEquals(a.getRoundedAvgPriceOfOpps(), 1000.00, 'Expected to get 1000.00');
    }
    Test.stopTest();
  }
}