@IsTest
public class InvoiceScreencontrollerTest {

@isTest
static void invoice()
{
	// create test data for this 
	
	Date date1 =  date.today();
	Date date90Days = date1.addDays(30);    
	
	
	List<Account> lstacc = new List<Account>();
	lstacc.addall(TestDataForObjects.accountData()); 
	
	List<Contact> lstcon = new List<Contact>();
	lstcon.addall(TestDataForObjects.contactData()); 
	
	Project__c  pro = new Project__c();
	pro.Account__c = lstAcc[0].id;
	pro.Name = 'Zen4orce';
	pro.Start_Date__c= date1;
	pro.End_Date__c = date90Days;
	insert pro;
	
	Time_Entry__c te = new Time_Entry__c();
	te.Name = 'FebTimeSheet';
	te.Project__c = pro.id;
	te.Contact__c = lstcon[0].id;
	te.Date__c = date1;
	insert te;
	
	ProjectWrappercls p = new ProjectWrappercls(pro);
	p.isSelected = true;
	p.cProject = pro;
	
	List<ProjectWrappercls> pw = new List<ProjectWrappercls>();
	pw.add(p);
	
	Test.startTest();
	 ApexPages.StandardController stdProject = new ApexPages.StandardController(pro);
     InvoiceScreencontroller objController = new InvoiceScreencontroller(stdProject);
     objController.filterRecords();
     set<Id> sId = new set<Id>();
     sId.add(pro.id);
          
     objController.acctList = pw;
     objController.selProjectNames = sID;
     objController.isSelected = true;
     
     objController.generateInvoice();
	
	  List<Invoice__c> lstInvoice = new List<Invoice__c>([select id,name from invoice__c]);
	  List<Invoice_Line_Item__c> lstInvitem = new List<Invoice_Line_Item__c>([select id,name from Invoice_Line_Item__c]);
	  system.debug('line item'+lstInvitem.size());
	  system.debug('line item date'+lstInvitem);
	  system.debug('Invoice'+lstInvoice);
	  system.assertEquals(string.valueOf(1),string.valueOf(lstInvoice.size()));
	  
	  Test.stopTest();
	 
}

}