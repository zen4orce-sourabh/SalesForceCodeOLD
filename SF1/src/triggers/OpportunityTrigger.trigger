trigger OpportunityTrigger on Opportunity (after update,after insert) {

    if (Trigger.isafter) {
            if( Trigger.isUpdate ){
             OppTriggerHandler.afterUpdate(Trigger.old,Trigger.new);
             }
             if( Trigger.isInsert ){
             OppTriggerHandler.afterInsert(Trigger.new);
             }
             
    }

}