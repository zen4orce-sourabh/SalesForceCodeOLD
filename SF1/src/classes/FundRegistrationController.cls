public with sharing class FundRegistrationController {
	private ApexPages.StandardController stdController;
    private final UT_Fund__c  UTFund;
    public FundRegistrationController(ApexPages.StandardController stdController) {
        this.UTFund = (UT_Fund__c)stdController.getRecord();
        this.stdController = stdController;
    }
    
    public PageReference save() {
    try {
        insert UTFund;
        String m = '200';
        PageReference newocp = new PageReference('/apex/FundTransactions');
        newocp.setRedirect(false);
        newocp.getParameters().put('Dealing_Terms__c',m);
        return newocp;
    } catch (DMLException e) {
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 'Not working'));
        return null;
    }
    }

}