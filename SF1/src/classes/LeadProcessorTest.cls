@isTest
public class LeadProcessorTest {

static testMethod void testleadprocessor()
{
	List<Lead> lead = new List<Lead>();
	for(integer i=0;i<200;i++)
	{
		Lead l = new Lead();
		l.FirstName = 'sourabh'+i;
		l.LastName = 'Shri'+i;
		l.Company = 'Zen4orce'+i;
		//l.Phone = '987345434'+i;
		l.Email = 'sourabh'+i+'@gmail.com';
		
		lead.add(l);
	}
	
	insert lead;
	
	LeadProcessor lp = new LeadProcessor();
	//Test.startTest();
	Database.executeBatch(lp,200);
	//Test.stopTest();
	
	//System.assertEquals(200, [select count() from Lead where firstname = 'sourabh']);
	
}
}