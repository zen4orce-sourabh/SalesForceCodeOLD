public with sharing class ProjectWrappercls {
	
	public Boolean isSelected {get;set;}
     public Project__c cProject {get;set;}

     public ProjectWrappercls(Project__c cProject){
          this.cProject = cProject;
     }

}