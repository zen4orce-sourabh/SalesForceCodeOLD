public with sharing class OppTriggerHandler {


    //This method is to check the logic for update event
    public static void afterUpdate(List<Opportunity> oldList, List<Opportunity> newList){
        List<Opportunity> opplistforChatter = new List<Opportunity>();
        for(Integer i=0; i < newList.size(); i++){
            if (oldList[i] != newList[i] && newList[i].isWon == true){
                opplistforChatter.add(newList[i]);
            }
        }
         insertChatterFeed(opplistforChatter);
    }

    //This method is to check the logic for insert event
    public static void afterInsert(List<Opportunity> newList){
        List<Opportunity> opplistforChatter = new List<Opportunity>();
        for(Opportunity opp: newList){
            if(opp.isWon == true){
                opplistforChatter.add(opp);
            }
        }
        insertChatterFeed(opplistforChatter);
    }

    // This method will post to Chatter feed of the logged in user
    public static void insertChatterFeed(List<Opportunity> oppList){
        List<FeedItem> feedItemList = new List<FeedItem>();
        for(Opportunity opp: oppList){
            FeedItem feedItempost = new FeedItem();
              String status = 'Hi ' + UserInfo.getName()+'. The Opportunity ' + opp.Name+ ' is ClosedWon.';
              feedItempost.ParentId =UserInfo.getUserId() ;
              feedItempost.Title = UserInfo.getName();
//              feedItempost.RelatedRecordId = opp.Id;
              feedItempost.Body = status;
              feedItemList.add(feedItempost);
        }
        if(feedItemList.size() >0){
            insert feedItemList;
        }

    }

}