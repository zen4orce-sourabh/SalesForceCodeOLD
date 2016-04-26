@isTest
public class TestDataForObjects {

    public static testMethod List<Account> accountData() {
     List<Account> lstAcc = new List<Account>();
     For(integer i=0;i<1;i++)
     {
     	Account acc = new Account();
     	acc.name= 'TestZen$orce';
     	lstAcc.add(acc);
     }
     	insert lstAcc;
     	return lstAcc;
    }
    
   public static testMethod List<Contact> contactData() {
     List<Contact> lstcon = new List<Contact>();
     For(integer i=0;i<10;i++)
     {
     	Contact con = new Contact();
     	con.lastname= 'TestZen$orce';
     	con.Email = 'Test@zen4orce.com';
     	lstcon.add(con);
     }
     	insert lstcon;
     	return lstcon;
    }
}