public with sharing class InvoiceScreenController {

public Project__c project{get;set;}
public List<Project__c>  projectList{get;set;}
public List<Time_Entry__c>  timeentryList{get;set;}
public List<ProjectWrappercls> acctList {get;set;}
public Set<Id> selProjectNames {get;set;}
public Boolean hasSelProject {get;set;}
public Boolean isSelected {get;set;}
public boolean hideshow{get;set;}
public boolean genInv {get;set;}
private ApexPages.StandardController stdController;

	public InvoiceScreenController(ApexPages.StandardController stdController) {
        this.project = (Project__c)stdController.getRecord();  
        this.stdController = stdController;
        hideshow = false;
        genInv = false;
    }
     
  	public void filterRecords(){
  		acctList = new List<ProjectWrappercls>();
  		hideshow = true;
  		selProjectNames = new Set<Id>();
    	projectList = new List<Project__c>();
    	projectList = [SELECT Id,Name,Account__c,Start_Date__c,Total_Project_Hrs__c  FROM Project__c WHERE Account__c=:project.Account__c and Start_Date__c<=:project.Start_Date__c and End_Date__c >=:project.End_Date__c];
    
    		for(Project__c p:projectList)
    			{
    	 			acctList.add(new ProjectWrappercls(p));
    			} 
    			
  	}
  
	public void generateInvoice(){  	  
    	selProjectNames.clear();
        hasSelProject = false;
        genInv = true;
        	for(ProjectWrappercls cWrapper : acctList){ 
            	if(cWrapper.isSelected){
                	hasSelProject = true;
                    selProjectNames.add(cWrapper.cProject.Id);           
                }
          	}           
        List<Invoice__c> inv = new List<Invoice__c>();	
	 	projectList = new List<Project__c>();
		projectList = [SELECT Id,Name,Account__c,Start_Date__c,Total_Project_Hrs__c  FROM Project__c WHERE Id IN :selProjectNames];	    
			for(Project__c p : projectList)
			    {
			    	Invoice__c i = new Invoice__c();
			    	i.Name=p.Name;
			    	i.Account__c=p.Account__c;
			    	i.Project__c=p.Id;
			    	inv.add(i);
			    }
			 		If(inv.size()>0)
			    		{
			    			insert inv;
			    		}
			    
		List<Invoice_Line_Item__c> invlineitem = new List<Invoice_Line_Item__c>();	
		timeentryList = new List<Time_Entry__c>();
		timeentryList = [SELECT Id,Name,Project__c,Billable_Amount__c,Invoiced__c,Duration__c FROM Time_Entry__c WHERE Project__c IN :selProjectNames and Invoiced__c=false];
    		for(Invoice__c iv : inv)
			    {    	
			    	for(Time_Entry__c tE : timeentryList)
			    		{
			    			te.Invoiced__c=true;
			    			Invoice_Line_Item__c iL = new Invoice_Line_Item__c();
			    			iL.Invoice_Hours__c=tE.Duration__c;
			    			iL.Invoice_Amount__c=tE.Billable_Amount__c;
			    			iL.Invoice__c=iv.ID;
			    			iL.Time_Entry__c=te.Id; 
			    			invlineitem.add(iL);
			    			update te;
			    		}
			    } 
					If(invlineitem.size()>0)
			    		{
			    			insert invlineitem;
			    		}
} // Function generate invoice ends
}// class ends