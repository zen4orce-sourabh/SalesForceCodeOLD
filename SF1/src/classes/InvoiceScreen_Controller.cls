public class InvoiceScreen_Controller
{

  
    List<AccountWrapperCls> accountList = new List<AccountWrapperCls>();
    List<Account> selectedAccounts = new List<Account>();

    public List<AccountWrapperCls> getAccounts()
    {
        for(Account a : [select Id, Name, AccountNumber, Phone from Account limit 5])
        accountList.add(new AccountWrapperCls(a));
        return accountList;
    }

    public PageReference getSelected()
    {
        selectedAccounts.clear();
        for(AccountWrapperCls accwrapper : accountList)
        if(accwrapper.isSelected == true)
        selectedAccounts.add(accwrapper.cAccount);
        return null;
    }

    public List<Account> GetSelectedAccounts()
    {
        if(selectedAccounts.size()>0)
        return selectedAccounts;
        else
        return null;
    }    


}