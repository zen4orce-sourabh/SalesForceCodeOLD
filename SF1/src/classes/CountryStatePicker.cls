public with sharing class CountryStatePicker {

 public string state {get;set;}
 public string country {get;set;}
 
 public List<SelectOption> getcountriesList()
 {
 	List<SelectOption>  options = new List<SelectOption>();
 	options.add(new SelectOption('', '-- Select One --')); 
 	map<string,country__c> countries = country__c.getAll();
 	
 	List<string> cnames = new List<string>();
 	cnames.addall(countries.keyset());
 	
 	for(String ctryname : cnames )
 	{
 		country__c country = countries.get(ctryname);
 		options.add(new SelectOption(country.Name, country.Name));
 		
 	}
 	return options;
 }
 
 
  public List<SelectOption> getcitiesList()
 {
 	List<SelectOption>  options = new List<SelectOption>();
 	map<string,city__c> allcities = city__c.getAll();
 	
 	map<string,city__c> cities = new Map<string,city__c>();
 	for(city__c city : allcities.values())
 	{
 		if(city.country__c == this.country)
 		{
 			cities.put(city.name,city);
 		}
 	}
 	
 	List<string> cnames = new List<string>();
 	cnames.addall(cities.keyset());
 	
 	for(String cityname : cnames )
 	{
 		city__c city = cities.get(cityname);
 		options.add(new SelectOption(city.country__c,city.Name ));
 		
 	}
 	
 	if (options.size() > 0) {
            options.add(0, new SelectOption('', '-- Select One --'));
        } else {
            options.add(new SelectOption('', 'Not Required'));
        }
 	
 	
 	return options;
 }
 
 
 
 
}