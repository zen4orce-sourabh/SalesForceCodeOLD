@isTest
private class DuplicateCheckHandlerTest {

    static testMethod void dulicateLeadTest() {
        // TO DO: implement unit test
        
        
        //Step 1 : Check whereter my mail is persent or not 
        List<Lead> checkEmail = new List<Lead>([select email from lead where email = 'zen@gmail.com']);
        system.assertEquals(0, checkEmail.size()); 
        
        // Step 2 : Insert a valid record   
       Lead l = new Lead();
	        l.LastName = 'test';
	        l.Company = 'data';
	        l.phone = '987654321';
	        l.Email = 'zen@gmail.com';
	        insert l;
	    System.assertEquals('zen@gmail.com', l.Email);
	    
	    // insert a new record with same mail id it should not be inserted.      
   		Lead l1 = new Lead(); 
	        l1.LastName = 'test';
	        l1.Company = 'data';
	        l1.phone = '987654321';
	        l1.Email = 'zen@gmail.com';
	        try{
	        insert l1;
	        } catch(DMLException e)
	        {
	        	system.assert(e.getDMLMessage(0).indexof('already Exist')>-1);
	        }
	       
	       // Now insert bulk leads with unique mail ids they should be inserted 
	       
	        Lead lead1 = new Lead(LastName='Test1', Company='Test1 Inc.', phone='9865327412',
                            Email='zen@gmail.com');
      		Lead lead2 = new Lead(LastName='Test2', Company='Test2 Inc.', phone='9865327412',
                            Email='zen@gmail.com');
     		Lead lead3 = new Lead(LastName='Test3', Company='Test3 Inc.', phone='9865327412',
                            Email='test5@duptest.com');
      Lead[] leads = new Lead[] {lead1, lead2, lead3};
      insert leads; 
	        
  
    }
}