@isTest
private  class testUpdateChild {

    public static testMethod void testAccOwnerChange() 
    {
    test.startTest();

        sObject testUser2 = [Select Id,name from User where IsActive = true limit 1];
        User testUser3 = [Select Id from User where IsActive = true limit 1];      
        
          
    Account acc = new Account();
    acc.Name = 'test01';
    acc.OwnerId = testUser3.id;
	insert acc;
    
    Contact co = new Contact();
    co.LastName='contact1';
    co.accountId = acc.id;
    co.OwnerId = testUser3.id;
    insert co;
  
    
    
    	User testUser1 = new User(alias = 'TstUsr1',Firstname='tst1', email='newuserDP@testorg.com', 
    	emailencodingkey='UTF-8', lastname='Tst11', languagelocalekey='en_US', localesidkey='en_US',
    	profileid = '00e28000001CFUJAA4',
         timezonesidkey='America/Los_Angeles', username='newuser11@testorg.com'
    	, ManagerId = testUser3.Id);
        insert testUser1;
        
       
    	
        acc.OwnerId = testUser1.Id;
        acc.name='sourabh';
        update acc;
        //acc.OwnerId = testUser2.Id;
        
        
        test.stopTest();
    }
}