public class QueryBuilderController {
	
	public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
	public List<Schema.SObjectType> lstAllObjects = Schema.getGlobalDescribe().Values();
	public string selectedObj {get;set;}
	public string selectedField {get;set;}
	public string GeneratedQuery {get;set;}
    
	public List<selectOption> ListOfAllFields {get;set;}
	public List<selectOption> ListOfAllObjects {get;set;}
	public List<sObject> resultSet {get;set;}
	
	// For custom multiselct
	
	public List<string> leftselected{get;set;}
    public List<string> rightselected{get;set;}
    public Set<string> leftvalues =new Set<string>(); 
    public Set<string> rightvalues = new Set<string>(); 
    public List<String> selectedFields {get;set;}
	
	public QueryBuilderController()
	{
		this.selectedField = null;
		this.selectedObj = null;
		this.GeneratedQuery =null;
		this.ListOfAllFields = null;
		this.selectedFields = null;
		//leftvalues = new Set<string>();
		//rightvalues=new Set<string>();
		this.ListOfAllObjects = null;
		ListOfAllObjects = new List<SelectOption>();
		ListOfAllObjects.add(new SelectOption('Select','Select'));
		
		for(Schema.SObjectType objLst : lstAllObjects)
    		{
       			ListOfAllObjects.add(new SelectOption(objLst.getDescribe().getName(),objLst.getDescribe().getName()));
    		}
	}
	
    public void createQuery(set<String> query)
    {
        List<string> lquery = new LIST<String>();
        String objFields;
        lQuery.addAll(query);
        objFields = string.join(lQuery, ',');
        GeneratedQuery = 'select '+objFields+' from '+selectedObj;
        
       
       // selectedFields = query;
      
    }
	
	 public PageReference selectclick(){
        rightselected.clear();
        for(String s : leftselected){
            leftvalues.remove(s);
            rightvalues.add(s);
        }
        selectedFields = leftselected;
         createQuery(rightvalues);
        return null;
    }
     
    public PageReference unselectclick(){
        leftselected.clear();
        for(String s : rightselected){
            rightvalues.remove(s);
            leftvalues.add(s);
        }
        createQuery(rightvalues);
        return null;
    }
	
	
	
	 public List<SelectOption> getunSelectedValues(){
        List<SelectOption> options = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(leftvalues);
        tempList.sort();
        for(string s : tempList)
            options.add(new SelectOption(s,s));
        return options;
    }
 
    public List<SelectOption> getSelectedValues(){
        List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightvalues);
        
        tempList.sort();
         
        for(String s : tempList)
        {
        	
            options1.add(new SelectOption(s,s));
        }
       
        return options1;
    }
	
   	public void showFields() {
   		system.debug('get fields for '+selectedObj);
   		leftvalues.clear();
   		rightvalues.clear(); 
		ListOfAllFields = new List<SelectOption>();
		try{
		Map <String, Schema.SObjectField> fieldMap = schemaMap.get(selectedObj).getDescribe().fields.getMap();
			for(Schema.SObjectField sfield : fieldMap.Values())
			{
				schema.describefieldresult dfield = sfield.getDescribe();
				leftvalues.add(dfield.getname());
				
				ListOfAllFields.add(new SelectOption(dfield.getname(),dfield.getname()));			
			}
		system.debug('left values are  '+leftvalues);
		}
		 catch(Exception e){
        	ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured while getting object list '+e.getMessage());
            ApexPages.addMessage(errormsg);
        }
       
	}

  public void showResult()
  {
  	
  		

	
     //  selectedFields.addAll(rightvalues);
  	System.debug('resut left selected'+leftselected);
  	System.debug('resut right selected'+rightselected);
  	System.debug('resut left values'+leftvalues);
  	System.debug('resut right values'+rightvalues);
  	System.debug('resut selected fields'+selectedFields);
  	
  	resultSet = Database.query(GeneratedQuery);
  	
  	System.debug(resultSet);
  	
  }


   	
}