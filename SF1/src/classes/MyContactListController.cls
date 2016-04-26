public with sharing class MyContactListController {

@AuraEnabled
public static list<contact> getcontacts()
{
	return [select id,name,email,title,phone from Contact];
}
}