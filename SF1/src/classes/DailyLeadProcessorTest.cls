@isTest
private class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
   
    static testmethod void testScheduledJob() {
    	 List<Lead> leads = new List<Lead>();
       for (Integer i = 0; i < 200; i++) {
            leads.add(new lead(
                lastname='Dreamforce'+i,company='abc'
            ));
        }
        insert leads;
         Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',CRON_EXP,new DailyLeadProcessor());
        Test.stopTest();  
    }        
}