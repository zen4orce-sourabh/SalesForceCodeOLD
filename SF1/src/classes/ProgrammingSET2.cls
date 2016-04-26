public with sharing class ProgrammingSET2 {
	
	Public void getopp()
	{
		List<Opportunity> lstOpp = new List<Opportunity>([select Id,name from opportunity where AccountId != null and StageName ='Closed Won' ]);
		system.debug('Opp with ids'+lstOpp);
		set<Id> oppId = new Set<ID>();
		for(Opportunity o : lstOpp)
		{
			oppId.add(o.ID);
		}
		System.debug('Opp ids in SET'+oppId);
	}
	
	public void StringManipulations(string Data){
        Data = Data.replace('@', 'A');
        Integer indexOfString =  Data.indexOf('Apex Programming');
        System.debug('After replacing @ with A, result is - ' + Data);        
        System.debug('In Upper Case - ' + Data.toUpperCase());
        System.debug('In Lower Case - ' + Data.toLowerCase());
        string[] someChar = Data.split('');
        
        Map<String,Integer> lstcount = new Map<String,Integer>();
       System.debug(someChar.size());
         for(Integer i = 0; i< someChar.size();i++){
             Integer count = 0;
             
          //   if (lstCount.containsKey(someChar[i]))
           //  continue;
           //  lstcount.put(someChar[i], count);
             
             
            for(Integer j = 0; j< someChar.size();j++)
            {
                    string temp1 =  someChar[i];
                    string temp2 =  someChar[j];
                    
                    if(temp1.equals(temp2)){ 
                       
                        lstCount.put(temp1,++count );
                                      	                                              
                    }   
            }
           
        }
         System.debug('map'+lstcount);
    }
	
	
	
	

}