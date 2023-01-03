public with sharing class ProjectStageCtrl {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getProjectDetails(string recId){
        List<Opportunity> projectDetails = new List<Opportunity>();
        projectDetails = [SELECT Id, Name, ContractId, StageName,(Select Id, Name From PPAs__r ORDER By CreatedDate DESC),
                        (Select Id, Name From DDAs__r ORDER By CreatedDate DESC),
                        (Select Id, Name From Construction__r ORDER By CreatedDate DESC)
                        /* (Select Id, Name From Completed_Projects__r ORDER By CreatedDate DESC) */ 
                        FROM Opportunity where Id = :recId];
        return projectDetails;
    }

    
}