public with sharing class StudentRegistrationController {

public string lang {get;set;}
public string selecteddata{get;set;}
public string keyLang{get;set;}
List<selectOption> lstLang = new List<selectOption>(); 
private ApexPages.StandardController stdController;
public String SelectedLanguage{get; set;}  

  public StudentRegistrationController(ApexPages.StandardController stdController) {
        this.stdController = stdController;
        this.keyLang='en_US';
        
    }


public List<selectOption> getLanguageList()
{
	
	lstLang.add(new SelectOption('Eng','English'));
	lstLang.add(new SelectOption('SPA','Spanish'));
	lstLang.add(new SelectOption('fr','French'));
	
	return lstLang;
}

public void change()
{
	  keyLang = SelectedLanguage;
	 
}



}