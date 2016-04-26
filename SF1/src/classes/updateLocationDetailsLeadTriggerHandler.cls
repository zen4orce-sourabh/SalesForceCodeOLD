public with sharing class updateLocationDetailsLeadTriggerHandler {

	public static void beforeinsert(List<Lead> newList)
	{
	     Map<String, Lead> leadwithphoneno = new Map<String, Lead>();
	    	for(Integer i=0;i<newList.size();i++)
	    		{
	         		if(newList[i].phone!='') {
	            	leadwithphoneno.put(newList[i].phone,
	                                      newList[i]);
	         		}
	    		}
	       if(leadwithphoneno != null && !leadwithphoneno.isEmpty())
	       updatelead(leadwithphoneno, newList );
	}
	
	public static void beforeupdate(List<Lead> newList,List<Lead> oldList)
	{
		Map<String, Lead> leadwithphoneno = new Map<String, Lead>();
	 		for(Integer i=0;i<newList.size();i++)
	    		{
	         		if(newList[i].phone!='' && newList[i].Phone != oldList[i].Phone) {
	            	leadwithphoneno.put(newList[i].phone,
	                                      newList[i]);
	         		}
	    		}
	    updatelead(leadwithphoneno, newList );
	}
	
	public static void updateLead(Map<String,Lead> leadwithphoneno,List<Lead> newList)
	{
		 Map<String, LocationDetail__c> myMap = new Map<String, LocationDetail__c>();
		 	for(LocationDetail__c objLD : [Select l.area_code__C, l.State__c,l.Zone__c From LocationDetail__c l])
	        	myMap.put(objLD.area_code__C, objLD); 
	    
	    	for(Lead le: newList){      	
	        	 le.email='abc@gmail.com';
	             	if(le.Zone__c=='' && myMap.containskey(le.phone.substring(0,3)))
	             		{
	                		le.Zone__c=myMap.get(le.phone.substring(0,3)).Zone__c;
	             		}
	                }     	
	}
}