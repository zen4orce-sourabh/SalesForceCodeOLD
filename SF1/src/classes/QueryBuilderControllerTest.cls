@isTest
public class QueryBuilderControllerTest {

@isTest
static void testSoqlBuilder()
{
	QueryBuilderController querCtl = new QueryBuilderController();
	// Get object List 
	Map <String,Schema.SobjectType> schemaMap=Schema.getGlobalDescribe();
	System.assertEquals(querCtl.ListOfAllObjects.size(), schemaMap.size()+1); // Compare number of objects return by controller and schemap
	
	// Field count
	string objectName = 'Account';
	Map <String, Schema.SObjectField> fieldMap = schemaMap.get(objectName).getDescribe().fields.getMap();   // Std method 
	querCtl.selectedObj = objectName;
	querCtl.showFields();  // My controller method 
	System.assertEquals(querCtl.leftvalues.size(), fieldMap.size()); // Compare number of fields return by controller and schemamap for same object
	
	// Assign all fields 
	
	
	
} 

}