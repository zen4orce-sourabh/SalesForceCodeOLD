global class OppAmountAggregator implements Database.Batchable<sObject>, Database.Stateful{
	
	global Decimal totalamount;
	global Datetime startdatetime;
	global Datetime enddatetime;
	global integer totalopp;
	global final string query;
    
    global OppAmountAggregator()
    {
        totalopp=0;
        totalamount=0;
    }
	
	global Database.QueryLocator start(Database.BatchableContext bc) {
		startdatetime = Datetime.now(); 
        return Database.getQueryLocator([select name,isAggregated__c,amount from opportunity where stagename='closed won' and lastmodifieddate >= LAST_N_DAYS:100]); 
    } 
    
  global void execute(Database.BatchableContext bc, List<Opportunity> scope){
  	
  	for(Opportunity op : scope)
  	{
  		op.IsAggregated__c = true;
        // get the sum of amount here 
  		
  	} 
      update scope; 
      totalopp = scope.size();    
       
       
    } 
     
    
    global void finish(Database.BatchableContext bc){
    	enddatetime = Datetime.now();
    	OppAmountAggregator.sendmail(startdatetime,enddatetime,totalamount,totalopp);
    	
    	// send email method goes here with all params 
    	   }
    	   
    public static void sendmail(Datetime startdatetime,datetime enddatetime,Decimal totalamount,integer totalopp)
	{
    	Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
    	//string [] toaddress=new String[]{UserInfo.getUserId()};
        string [] toaddress=new String[]{'sourabh1504@hotmail.com'};
    	string[] ccAddresses=new String[]{'sourabh.shrivastava@zen4orce.com'};
    	email.setSubject('Mass Email');
    	email.setHtmlBody('Dear Sir /Madam,<br/><br/> Hello <br/><br/>Sincerely,<br><br/><br/>Date :'+string.valueof(system.today()));
    	
    	email.setHtmlBody('The batch job for Daily Opportunity Amount Aggregation has completed successfully.'+ 
    	'The details associated with the job are as follows. <br/><br/>'+
    	' Start date time '+string.valueof(startdatetime)+'<br/>'+
    	'End date Time'   +string.valueof(startdatetime)+'<br/>'+
    	'Total duration in hours ' + string.valueof(startdatetime)+'<br/>'+
    	'Total Opportunity Amount for today ' + string.valueof(totalamount)+'<br/>'+
    	'Number of Opportunities Closed Won Today ' + string.valueof(totalopp)+'<br/>'
    	);
    	email.setToAddresses(toaddress);
    	email.setCcAddresses(ccAddresses);
    	Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
    }   
   
   
   
    	   
    
}