public with sharing class ContactSearch {
	
	public static List<Contact> searchForContacts(String lastName,String mailingPostalCode)
	{
		List<Contact> lstContacts = new List<Contact>();
		
		lstContacts = [select id,Name from contact where lastName = :lastname and MailingPostalCode=:mailingPostalCode];
		
		return lstContacts;
		
	}

}