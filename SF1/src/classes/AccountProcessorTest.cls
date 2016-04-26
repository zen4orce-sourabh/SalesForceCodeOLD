@IsTest
public class AccountProcessorTest {
    public static testmethod void TestAccountProcessorTest() 
    {
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;

        Contact cont = New Contact();
        cont.FirstName ='Sourabh';
        cont.LastName ='Shrivastava';
        cont.AccountId = a.Id;
        Insert cont;
        
        set<Id> setAccId = new Set<ID>();
        setAccId.add(a.id);
 
        // For a single account 
        Test.startTest();
            AccountProcessor.countContacts(setAccId);
        Test.stopTest();
        
        Account ACC = [select Number_of_Contacts__c from Account where id = :a.id LIMIT 1];
        System.assertEquals ( Integer.valueOf(ACC.Number_of_Contacts__c) ,1);
  }
  
}