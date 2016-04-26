public with sharing class TimeEntryWrapper {
	
	public Boolean isSelected {get;set;}
     public Time_Entry__c cTimeEntry {get;set;}

     public TimeEntryWrapper(Time_Entry__c cTimeEntry){
          this.cTimeEntry = cTimeEntry;
     }

}