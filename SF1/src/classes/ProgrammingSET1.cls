public with sharing class ProgrammingSET1 {
	
	public void findOddEven(integer num)
	{
		integer y;
		integer x;
		y=num/2;
		x=y*2;
		if(x==num)
		{
			system.debug('Given number is Even');
		}
		else
		{
			system.debug('Given number is ODD');
		}
	}

    public void buildarray(integer num)
    {
    	Integer[] a = new List<Integer>();
    	for (integer i=0;i<num;i++)
    	{
    		a.add(i);
    	}
    	system.debug(a);
    }
    
     public void arrayascendingorder(integer[] arr)
     {
    	// sort array in ascending array 
    	//List<Integer> integerList = new List<integer>{4,5,5,443,3,2} ;

			for(Integer i = 0 ; i < arr.size() ; i ++) {
			for(integer j = i+1 ; j <= arr.size() -1 ; j ++ ){
			  integer x = 0 ;
			  if(arr[i] <  arr[j]){
			   x = arr[i]  ;
			   arr[i] = arr[j]  ;
			   arr[j]  = x;
			   system.debug(arr) ;
			  }
			}
			}
			
     } 
     
     public List<Account> getallaccounts()
     {
     	List<Account> lstaccount = new List<Account>([select name from account where createddate = Today]);
     	System.debug('accounts crated today'+lstaccount);
     	return lstaccount;
     	
     }
     
       public List<Contact> getparentdatafromchild()
     	{
	     	List<Contact> lstContact = new List<Contact>([select name,account.name from contact]);
	     	System.debug('contact with there parent account'+lstContact);
	     	return lstContact;
	     	
     	}
     	
      public List<Lead> updateLead()
   		{
	     	List<Lead> lstlead = new List<Lead>([select name,Industry,leadsource from Lead where leadsource = 'WEB']);
	     	List<Lead> updatelead = new List<Lead>();
	     	For(Lead l : lstLead)
	     	{
	     		
	     		if (l.LeadSource=='Web')
	     		{
	     		  l.Industry='Retail';	
	     		}
	     		updatelead.add(l);
	     		
	     	}
	     	
	     	update updatelead;
	     	System.debug(updatelead);
	     	return updatelead;
	     	
     	}
     	
     	public void insertChildCountInAccount()
     	{
     		List<Contact> lstCon = new List<Contact>([select Id,Account.Name,Account.Id from contact where account.Name='zen4orce']);
     		Integer childCount  = lstCon.size();
     		Account acc ;
     		
     		for(Contact c : lstCon)
     		{
     			acc = new Account(Id = c.Account.ID);
     			acc.Child_Count__c = string.valueOf(childCount);
     			
     		}
     		
     		update acc;		 
     	}
     	
     	public void lsttoset()
     	{
     		//List<Lead> lstLead = new List<Lead>([select id from lead]);
     		//Map<ID,Lead> lstLead = new Map<ID,Lead>([select id,name from lead]);
     		Set<Id> ids = (new Map<Id, Lead>([SELECT Id ,name FROM Lead])).keySet();
     		system.debug('all leads records'+ids);
     		
     	}
    
    
}