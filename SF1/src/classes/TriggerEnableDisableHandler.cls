public class TriggerEnableDisableHandler {
	
	public void getAlltriggers()
	{
		TriggerSetting__c CS = TriggerSetting__c.getInstance();
		
		
		List<TriggerSetting__c> lstTriggersetting = new List<TriggerSetting__c>([select DisableTrigger__c,TriggerName__c from TriggerSetting__c]);
		List<apextrigger> lstTrigger = new List<apextrigger>([select name,status,TableEnumOrId from apextrigger]);
		
		List<TriggerSetting__c> lstTriggerForUpdate = new List<TriggerSetting__c>();
		
		if(cs.DisableTrigger__c==false)
		{
			for(TriggerSetting__c at : lstTriggersetting)
			{
				at.DisableTrigger__c= false;
				lstTriggerForUpdate.add(at); 
			}
			update lstTriggerForUpdate;
		}
		
		
		/*for(apextrigger at : lstTrigger)
		{
			if(cs.DisableTrigger__c==false)
			at.status= 'active';
			else
			at.status= 'active';
		}
		update lstTrigger;
		*/
	}
	
	

}