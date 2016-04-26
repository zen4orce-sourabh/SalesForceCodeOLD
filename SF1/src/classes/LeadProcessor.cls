global class LeadProcessor implements Database.Batchable<sObject> {
	
	
global Database.QueryLocator start(Database.BatchableContext bc) { 
        return Database.getQueryLocator([select LeadSource,lastname from Lead where isconverted = false]); 
    } 
    
    
  global void execute(Database.BatchableContext bc, List<Lead> scope){ 
        // process each batch of records 
        List<Lead> leads = new List<Lead>(); 
        for (Lead lead : scope) { 
                lead.LeadSource = 'Dreamforce';
                // add Lead to list to be updated 
                 leads.add(lead);
        } 
        if(leads.size()>0)
        update leads; 
    } 
    
    global void finish(Database.BatchableContext bc){   }
	

}