@IsTest
public class BIOBriefingControllerTest {

    static testmethod void testbio()
    {
        Account a = new Account();
        a.name = 'testcompany';
        insert a;
		Bio__c b = new Bio__c();
        b.BioBriefingOwner__c = a.id;
        b.Email__c = 'abc@Gmail.com';
        insert b;
        
        Blob bl = Blob.valueOf('Test Data');  
    	Attachment attachment = new Attachment();  
    	attachment.ParentId = b.Id;  
    	attachment.Name = 'Test Attachment for Parent';  
    	attachment.Body = bl;  
        insert attachment;
        
        ApexPages.StandardController stdLead = new ApexPages.StandardController(b);
        
        BIOVerifyingController objMyLeadsController = new BIOVerifyingController(stdLead);
        objMyLeadsController.Save();

                    
    }
    
        static testmethod void testbio1()
    	{
        	Account a = new Account();
        	a.name = 'testcompany';
        	insert a;
            Bio__c b = new Bio__c();
            b.Email__c = 'abc@gmail.com';
            insert b;
		 
        	ApexPages.StandardController stdLead = new ApexPages.StandardController(b);
        	BIOVerifyingController objMyLeadsController = new BIOVerifyingController(stdLead);
        	objMyLeadsController.Save();

                    
    }
    
}