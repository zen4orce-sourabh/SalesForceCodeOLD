public with sharing class GenerateCron {
	
	public String SelectedSec{get; set;}
	public String SelectedMin{get; set;}
	public String SelectedHour{get; set;}
	public String SelectedDOM{get; set;}
	public String SelectedMon{get; set;}
	public String SelectedDOW{get; set;}
	public String SelectedYear{get; set;}
	public String SelectedClass{get; set;}
	List<selectOption> lstSec = new List<selectOption>();
	List<selectOption> lstMin = new List<selectOption>();
	List<selectOption> lstHour = new List<selectOption>();
	List<selectOption> lstDOM = new List<selectOption>();
	List<selectOption> lstMon = new List<selectOption>();
	List<selectOption> lstDOW = new List<selectOption>();
	List<selectOption> lstYear = new List<selectOption>(); 
	List<selectOption> lstClass = new List<selectOption>(); 
	private ApexPages.StandardController stdController;
	
	public GenerateCron()
	{
		this.SelectedSec = '0';
		this.SelectedMin = '0';
		this.SelectedHour = '0';
		this.SelectedMon = 'Jan';
		this.SelectedDOM = '*';
		this.SelectedYear = '*';
		this.selectedDOW = 'SUN';
	}
    
    public List<selectOption> getSec()
	{	
		for(integer i=0;i<60;i++)
		{
			lstSec.add(new SelectOption(string.valueOf(i),string.valueOf(i)));
		}
		return lstSec;
	}
	
	public List<selectOption> getMin()
	{	
		for(integer i=0;i<60;i++)
		{
			lstMin.add(new SelectOption(string.valueOf(i),string.valueOf(i)));
		}
		return lstMin;
	}
	
	public List<selectOption> getHour()
	{
		for(integer i=0;i<23;i++)
		{
			lstHour.add(new SelectOption(string.valueOf(i),string.valueOf(i)));
		}
		return lstHour;
	}
	
	public List<selectOption> getDOM()
	{
		for(integer i=1;i<31;i++)
		{
			if(i==1)
			lstDOM.add(new SelectOption('*',string.valueOf(i)));
			else
			lstDOM.add(new SelectOption(string.valueOf(i),string.valueOf(i)));
		}
		return lstDOM;
	}
	
	/*public List<selectOption> get31DOM()
	{
		for(integer i=1;i<32;i++)
		{
			lstHour.add(new SelectOption(string.valueOf(i),string.valueOf(i)));
		}
		return lstHour;
	}*/
	
	public List<selectOption> getMon()
	{
		    lstMon.add(new SelectOption('*','Every Month'));
			lstMon.add(new SelectOption('1','January'));
			lstMon.add(new SelectOption('2','Feburary'));
			lstMon.add(new SelectOption('3','March'));
			lstMon.add(new SelectOption('4','April'));
			lstMon.add(new SelectOption('5','May'));
			lstMon.add(new SelectOption('6','June'));
			lstMon.add(new SelectOption('7','July'));
			lstMon.add(new SelectOption('8','August'));
			lstMon.add(new SelectOption('9','September'));
			lstMon.add(new SelectOption('10','Octomber'));
			lstMon.add(new SelectOption('11','Novmber'));
			lstMon.add(new SelectOption('12','December'));
			
		    return lstMon;
	}
	
	public List<selectOption> getYear()
	{
		Integer currentYear = System.Today().year();
		lstYear.add(new SelectOption('*','Yearly'));
		for(integer i=1970;i<currentYear;i++)
		{
			lstYear.add(new SelectOption(string.valueOf(i),string.valueOf(i)));
		}
		return lstYear;
	}
	
	public List<selectOption> getDOW()
	{
		lstDOW.add(new SelectOption('*','Daily'));
		lstDOW.add(new SelectOption('1','Sunday'));
		lstDOW.add(new SelectOption('2','Monday'));
		lstDOW.add(new SelectOption('3','Tueday'));
		lstDOW.add(new SelectOption('4','Wednesday'));
		lstDOW.add(new SelectOption('5','Thursday'));
		lstDOW.add(new SelectOption('6','Friday'));
		lstDOW.add(new SelectOption('7','Saturday'));
		
		return lstDOW;	
	}
	
	public List<selectOption> getschedulabeClass()
	{
		List<ApexClass> lstClasslist = new List<ApexClass>([select body,name from apexclass]);
		
		
		for(ApexClass ac : lstClasslist)
		{
			if(ac.body.contains('abc'))
			{
				lstClass.add(new SelectOption('7',ac.name));
			}
		}
		
		return lstClass;	
	}
	
	
	
	
	public void Preview()
	{
		system.debug('SelectedSec'+SelectedSec);
		system.debug('SelectedMin'+SelectedMin);
		system.debug('SelectedHour'+SelectedHour);
		
		string GeneratedCron = SelectedSec+' '+SelectedMin+' '+SelectedHour+' '+SelectedDOM+' '+SelectedMon+' '+SelectedDOW+' '+SelectedYear;
		ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'CRON EXPRESSION : ' + GeneratedCron);
      	ApexPages.addMessage(myMsg);
	}
	
	/*public pagerefernece Schedule()
	{
		
	}*/
	
	
	
	

}