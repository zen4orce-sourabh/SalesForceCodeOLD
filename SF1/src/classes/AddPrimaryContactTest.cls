@isTest
public class AddPrimaryContactTest 
{
     @isTest static void TestList()
     {
         List<Account> testAccount = new List <Account>();
         for(Integer i=0;i<50;i++)
         {
             testAccount.add(new Account(BillingState = 'Pune', name = 'Test'+i));
         }
         for(Integer j=0;j<50;j++)
         {
             testAccount.add(new Account(BillingState = 'Mumbai', name = 'Test'+j));
         }
         insert testAccount;

         Contact co = new Contact();
         co.FirstName='testcon';
         co.LastName ='sourabh';
         insert co;
         String state = 'pune';
      
          AddPrimaryContact apc = new AddPrimaryContact(co, state);
          Test.startTest();
            System.enqueueJob(apc);
          Test.stopTest();
      }
 }