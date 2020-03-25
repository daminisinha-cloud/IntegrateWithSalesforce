public class child_parent {
   public static void return_parent()
   {
      for(Account a: [Select name,(Select name from contacts) from account])
      {
          for(contact c: a.contacts)
              System.debug('Parent Account  ' + a.name + '  child account  ' +c.name);
      }

   }

}