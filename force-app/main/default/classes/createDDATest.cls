@isTest
private class createDDATest {
    @isTest static void createDDATestMethod() {
        
        Account acc = new Account(); 
        acc.Name='Accenture';
        
        insert acc;
        
        Opportunity opp = new Opportunity();
        opp.Name='Developer Program';
        opp.AccountId = acc.Id;
        opp.StageName='PPA';
        opp.CloseDate=Date.Today();
        
        insert opp;
        
        
        PPA__c ppaRecord = new PPA__c();
        ppaRecord.Name = 'Accenture';
        ppaRecord.Project__c = opp.Id;
        ppaRecord.PPA_Start_Date__c = Date.today();
        ppaRecord.Payment_Received__c = true;
        ppaRecord.PPA_Value__c = 5000;
        ppaRecord.Probability__c = 50;
        ppaRecord.Completed__c = true;
        ppaRecord.Projected_Project_Size_USD__c = 5000;
        ppaRecord.Expected_Project_Size_sqft__c = 789;
        ppaRecord.Percent_Complete_by_March_31__c = 25;
        ppaRecord.Percent_Complete_by_March_31_NY__c = 50;
        
        Test.startTest();
        insert ppaRecord;
        
        createDDA.createDDARecord(ppaRecord.Id);
        Test.stopTest();
    }
}