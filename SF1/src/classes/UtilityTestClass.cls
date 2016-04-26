@isTest
	
private class UtilityTestClass {
	
	static testmethod void testaccount()
	{
		list<Account> flist = new list<Account>();
		for(integer i=1;i<=200 ;i++){
		 flist.add(new Account(name='Test Acc'+i));
		}
		insert flist;
		
		list<Account> Llist = new list<Account>();
		for(integer i=201;i<=20000 ;i++){
		 Llist.add(new Account(name='Test Acc'+i));
		}
		insert Llist ;
	}
}