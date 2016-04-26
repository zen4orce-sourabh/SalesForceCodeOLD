public with sharing class CloneLeadController {

 public static Boolean isFirstTime = true;
public static void cloneLead(List<Lead> newList)
{
	
	
	
	List<Lead> newLead = new List<Lead>();
	Lead newl;
	for(Lead l : newList)
	{
	  newL=l.clone();
newL.Status = 'Working Cont';
	   newLead.add(newL);
	}
	insert newLead;
}

public static void clonelead1(List<Lead> newList)
{
	List<Lead> toUpdate = new List<Lead>();
List<Lead> templateProjects = [Select 
          Lastname, company 
         from lead order by lastmodifieddate desc limit 1 ];
if(templateProjects.size() == 1) {
    Lead templateProject = templateProjects[0];
    // The default opt_preserve_id param in clone won't clone the Id.
    Lead opportunityProject = templateProject.clone();
  //  opportunityProject.OpportunitySpecificCustomField__c = opp.Name;

    toUpdate.add(opportunityProject);
} else {
     // What should you do if there isn't a template record available?
}
insert toUpdate;
}

}