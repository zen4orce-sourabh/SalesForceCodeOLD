trigger accountTrigger on Account (after update) {
	
	 if (Trigger.isAfter) {
             if( Trigger.isUpdate ){
             accountTriggerHandler.afterUpdate(Trigger.old,Trigger.new); 
             }    
    }
}