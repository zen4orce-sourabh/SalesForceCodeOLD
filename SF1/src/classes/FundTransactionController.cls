public with sharing class FundTransactionController {
private ApexPages.StandardController stdController;
    public UT_Transaction__c  UTTransaction;
    

    
   
    public FundTransactionController(ApexPages.StandardController stdController) {
        this.UTTransaction = (UT_Transaction__c)stdController.getRecord();
        this.stdController = stdController;        
		string Dealing_Terms = ApexPages.currentPage().getParameters().get('transType');
		system.debug('delaing terms value'+Dealing_Terms);
		this.UTTransaction.Transaction_Type__c = Dealing_Terms;   
		
    }
    
  

    
    
       public PageReference save() {
	    try {
	        insert UTTransaction;
	        String transType = UTTransaction.Transaction_Type__c;
	        System.debug('sdfsdfsdfsdfsdfsd'+transType);
	        PageReference newocp = null;
	        if(transType.equals('Purchase (switch In)'))
	        {
	         newocp = new PageReference('/apex/FundTransactions');
	         // newocp = new ApexPages.StandardController(UTTransaction).view();
	        newocp.setRedirect(true);
	        string trasnvalue = 'Redemption (Switch Out)';
	        string sample2 = 'param2';
	        newocp.getParameters().put('transType',trasnvalue);
	        newocp.getParameters().put('sampleparam',sample2);
	        System.debug('IF    ');
	        
	        }
	        else
	        {
	        	
	        	 newocp = new ApexPages.StandardController(UTTransaction).view();
	        System.debug('Else    ');	 
	        	 
	        }
	        
	        return newocp;
	    } catch (DMLException e) {
	        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Not working'));
	        return null;
	    }
    }
    
    
}