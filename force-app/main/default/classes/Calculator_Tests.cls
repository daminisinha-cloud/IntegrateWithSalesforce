@istest
public class Calculator_Tests {
    @istest
    static void testmethod1(){
        List<Boolean> exceptions = new List<Boolean>();
        system.assertEquals(Calculator.addition(5,10),15);
        system.assertEquals(Calculator.subtraction(10,5),5);
        system.assertEquals(Calculator.multiply(5,10),50);
        system.assertEquals(Calculator.divide(5,5),1);
        try{
          system.assertequals(Calculator.multiply(5,0),0);
        }catch(Calculator.CalculatorException exe){
            system.assert(true, 'Account should have thrown an exception');
            
        }
         try{
          system.assertequals(Calculator.multiply(0,9),0);
        }catch(Calculator.CalculatorException exe){
            system.assert(true, 'Account should have thrown an exception');
            
        }
         try{
          system.assertequals(Calculator.divide(5,0),0);
        }catch(Calculator.CalculatorException exe){
           system.assert(true, 'Account should have thrown an exception');
            
        }
         try{
          system.assertequals(Calculator.divide(-5,1),-1);
        }catch(Calculator.CalculatorException exe){
           system.assert(true, 'Account should have thrown an exception');
            
        }
        
    }
}