public with sharing class leadAssigentTriggers {

public static void duplicatecheck(List<Lead> lstLead)
{
	Map<String,String> mapLead = new Map<string,string>();
	List<Lead> allList = new List<Lead>([select Email,Phone from lead where Email != null and phone != null]);
	List<Lead> filteredLeads = new List<Lead>();
	Map<String,String> mapLeadErr = new Map<string,string>();
	
		for(Lead l : lstLead)
			{	
				if(!mapLead.containsKey(l.phone)){
					mapLead.put(l.phone,l.Email);
					filteredLeads.add(l);
				}
				else {
					l.addError('REcord already exist');
				}
				
			}	
		
        for (Lead l : allList) 
	        {
	        	if(l.Email == maplead.get(l.phone))
	        	{
	        		mapLeadErr.put(l.Email,l.Id);
	        	}
	        }	
	
	    for(Lead l : filteredLeads)
	    {
	    	if(mapLeadErr.ContainsKey(l.Email))
	    	{
	    		l.addError('already Exist');
	    	}
	    	
	    }
	        
}

}