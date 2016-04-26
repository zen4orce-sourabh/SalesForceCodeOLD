public with sharing class ContactExt {


    public Contact webContact{get;set;}
    public ContactExt(ApexPages.StandardController stdController){
    this.webContact = (Contact)stdController.getRecord();
    //attach = new Attachment();
    }
    
    public Attachment attach = new Attachment();
    public Blob bl {get; set;} 
    public String contentType {get; set;} 
    public String fileName {get; set;}
    
    public PageReference save(){
        attach.OwnerId = UserInfo.getUserId();
        attach.ParentId = webContact.Id;
        attach.Name = fileName;
        attach.Body = bl;
        attach.ContentType = contentType;
        
        insert attach;
        /*try {
            insert attach;
        } catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
        return null;
        } finally {
        attach = new Attachment(); 
        }*/
        
        PageReference p= new PageReference('/apex/VFpage');
        p.setRedirect(true);
        
        return p;
    }
}