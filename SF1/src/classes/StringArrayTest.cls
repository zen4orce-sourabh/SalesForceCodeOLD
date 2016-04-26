public with sharing class StringArrayTest {

public static List<String> generateStringArray(integer i)
{
	Account acc = [select id,name from account limit 1 ];
	system.debug(acc);
	List<String> test = new List<string>();
	for(integer a=0;a<i;a++)
	 test.add('Test '+a);
	 
	return test;
}
}