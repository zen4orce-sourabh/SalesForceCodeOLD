public with sharing class accountTriggerHandler {
	public static void afterUpdate(List<Account> oldAccount,List<Account> newAccout){
	    
    Map<Id, Account> acctsWithNewAddresses = new Map<Id, Account>();
    List<Contact> updatedContacts =new List<Contact>();
    List<Contact> Contacts =new List<Contact>();
     
    for (Integer i = 0; i < newAccout.size(); i++){
        if(oldAccount[i].Name != newAccout[i].Name) {
            acctsWithNewAddresses.put(newAccout[i].id,
                                      newAccout[i]);
        }
    }
	 
   contacts= [SELECT id, accountId FROM contact WHERE accountId in :acctsWithNewAddresses.keySet()];

    for (Contact c : contacts ){
        Account parentAccount = acctsWithNewAddresses.get(c.accountId);
        
        //c.ownerID = acctsWithNewAddresses.get(c.accountId).ownerId;
        c.Email= 'cde@gmail.com';
        
        updatedContacts.add(c);
    }
    update updatedContacts;
}
	
}