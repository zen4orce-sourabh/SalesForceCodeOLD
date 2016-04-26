trigger leadTrigger on Lead (before insert ,after insert) {
	
	if(trigger.isBefore){
		if(Trigger.isinsert)
		{
			//updateLocationDetailsLeadTriggerHandler.beforeinsert(Trigger.new);
			leadAssigentTriggers.duplicatecheck(Trigger.new);
		}
		if(Trigger.isupdate)
		{
			updateLocationDetailsLeadTriggerHandler.beforeupdate(Trigger.new,Trigger.old);
		}
	}
	//if(trigger.isAfter)
	//{
		// if(CloneLeadController.isFirstTime){
        //CloneLeadController.isFirstTime = false;
        //CloneLeadController.clonelead(Trigger.new); 
		//List<Lead> CaLNewList = trigger.new.deepClone();
    	//insert  CaLNewList; 
		 //}
	//}
}