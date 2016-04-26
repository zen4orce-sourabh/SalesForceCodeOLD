global with sharing class HotelRemoter {

    @RemoteAction
    global static List<Hotel__c> findAll() {
        return [SELECT Id, Name, Locatoin__Latitude__s , Locatoin__Longitude__s
                    FROM Hotel__c];
    }
    
    

}