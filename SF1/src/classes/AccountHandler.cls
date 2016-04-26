public with sharing class AccountHandler {

	public static account insertNewAccount(String s)
	{
		Account a = new Account();
		a.Name = s;
	
		try{ 
		    	insert a; 
			} catch (DMLException e){ 
		          a.addError('There was a problem inserting accounts');  
		          a=null;
		    						 } 	
			return a;
	}







}