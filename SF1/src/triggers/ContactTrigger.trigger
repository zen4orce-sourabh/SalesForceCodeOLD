trigger ContactTrigger on Contact (before insert,before update) {
UpdateContactTriggerHandler.beforeInsertupdate(Trigger.new);
}