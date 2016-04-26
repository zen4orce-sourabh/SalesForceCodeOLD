public with sharing class BIOVerifyingController {
	
	public blob picture { get; set; }
	public String errorMessage { get; set; }
	 private final Bio__c bio;
    private ApexPages.StandardController stdController;
        
    public BIOVerifyingController(ApexPages.StandardController stdController) {
        this.bio = (Bio__c)stdController.getRecord();
        this.stdController = stdController;
    }
    
    	public PageReference save() {
	   errorMessage = '';
	    String fileId = '';
	    try {
	    	 List<Attachment> attachedFiles = [select Id from Attachment where parentId =:bio.id order By LastModifiedDate DESC limit 1];
       			 if( attachedFiles != null && attachedFiles.size() > 0 ) {
           		 fileId = attachedFiles[0].Id;
	    	  		bio.Picture_Path__c = '/servlet/servlet.FileDownload?file='
	                                      + Fileid;
	        upsert bio;
                 }
	        return new ApexPages.StandardController(bio).view();
	    } catch(System.Exception ex) {
	        errorMessage = ex.getMessage();
	        return null;
	    }
}

}