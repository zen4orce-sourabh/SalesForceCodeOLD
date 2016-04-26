trigger AccountAddressTrigger on Account (before insert, before update) {
	
	   
    // Prevent the deletion of accounts if they have related opportunities.
    for (Account a : Trigger.new) {
        if(a.Match_Billing_Address__c == True)
        {
        	a.ShippingPostalCode = a.BillingPostalCode;
        
        }
        
    }
    

}