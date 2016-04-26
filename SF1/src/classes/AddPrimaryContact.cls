public class AddPrimaryContact implements Queueable {
	
	private string stateob;
	private Contact contact;
	
	public AddPrimaryContact(Contact c,string state)
	{
		this.stateob = state;
		this.contact = c;
	}

public void execute(QueueableContext context) { 
	
	List<Account> lstAccount = [select id from account where BillingState =:stateob limit 200];
	List<Contact> lstContact = new List<Contact>();
        for (Account account : lstAccount) { 
           Contact con = contact.clone(false,false,false,false);
           con.AccountId = account.Id;
           lstContact.add(con);
          // perform other processing or callout 
        } 
        insert lstcontact;
    } 
	

}