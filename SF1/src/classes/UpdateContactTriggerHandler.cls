public with sharing class UpdateContactTriggerHandler {
	
	public static void beforeInsertupdate(List<Contact> newList)
	{	
    // Gather accounts
    List<String> accountList = new List<String>();
    for (Contact c : newList)
        accountList.add(c.AccountId);
    
    // Query Accounts
    Map<Id, Account> accountMap = new Map<id, Account>([SELECT OwnerId FROM Account WHERE id =: accountList]);
    
    // Set Owners
    for (Contact c : newList){
        Account a = accountMap.get(c.AccountId);
        if (a != null &&  c.OwnerId != a.OwnerId)
            c.OwnerId = a.OwnerId;
    }
	}
}