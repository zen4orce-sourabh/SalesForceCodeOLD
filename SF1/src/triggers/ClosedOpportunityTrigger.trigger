trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

List<Task> task = new List<Task>();
for(Opportunity o : Trigger.new)
{
	if(o.StageName=='Closed Won')
	{
		Task t = new Task();
		t.Subject = 'Follow Up Test Task';
		t.WhatId=o.Id;
		task.add(t);
	}
	
}
upsert task;
}