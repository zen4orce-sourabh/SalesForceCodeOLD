public with sharing class TimeLineWrapperCls {
	
	public Boolean isSelected {get;set;}
     public Time_Entry__c cTimeLine {get;set;}

     public TimeLineWrapperCls(Time_Entry__c cTimeLine){
          this.cTimeLine = cTimeLine;
     }

}