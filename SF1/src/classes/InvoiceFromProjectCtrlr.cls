public with sharing class InvoiceFromProjectCtrlr {


public Time_Entry__c timeEntry{get;set;}
public Project__c projects{get;set;}
public List<TimeEntryWrapper> teList {get;set;}
public string projectName {get;set;}
public List<Time_Entry__c>  timeEntryList{get;set;}
public Set<Id> selProjectNames {get;set;}
public Boolean hasSelProject {get;set;}
public Boolean isSelected {get;set;}
public Boolean showdetail {get;set;}
public String pId ;
private ApexPages.StandardController stdController;

    public InvoiceFromProjectCtrlr(ApexPages.StandardController stdController) {
        this.projects= (Project__c)stdController.getRecord();
        pId = ApexPages.currentPage().getParameters().get('Id');
      //  projectName = ApexPages.currentPage().getParameters().get('name');
        this.stdController = stdController;
        showdetail = false;
    }
    
    public void filterRecordsforProject(){
  		teList = new List<TimeEntryWrapper>();
  		showdetail = true;
  		selProjectNames = new Set<Id>();
    	timeEntryList = new List<Time_Entry__c>();
    	system.debug('ProjectID1'+pId);
    	system.debug('ProjectID2'+projects.ID);
    	timeEntryList=  [SELECT Id,Name,Billable_Amount__c,Contact__c,Duration__c,Project__c FROM Time_Entry__c where Project__c =:pId and Invoiced__c = false]; 
    
    		for(Time_Entry__c tE:timeEntryList)
    			{
    	 			teList.add(new TimeEntryWrapper(tE));
    			} 
    			
    			
    
    	
  	
  	}
}