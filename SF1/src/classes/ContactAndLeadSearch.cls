public with sharing class ContactAndLeadSearch {
	
	public static List<List<sObject>> searchContactsAndLeads(String searchValue)
	{
		List<List<sObject>> searchList = [FIND :searchValue IN Name FIELDS 
                   RETURNING Lead(FirstName,LastName),Contact(FirstName,LastName)];
		
		return searchList;
			}
			
			


}