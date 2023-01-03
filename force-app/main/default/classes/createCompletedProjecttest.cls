@istest 
private class createCompletedProjecttest {
    @isTest static void createCompletedProjecttestMethod() {
        
        Account acc = new Account(); 
        acc.Name='Accenture';
        
        insert acc;
        
        Opportunity opp = new Opportunity();
        opp.Name='Developer Program';
        opp.AccountId = acc.Id;
        opp.StageName='Construction';
        opp.CloseDate=Date.Today();
        
        insert opp;
        
        Construction__c constructionrecord = new construction__c();
        constructionrecord.name = 'accenture';
        constructionrecord.project__c = opp.Id;
        constructionrecord.Contract_Start_Date__c = Date.today();
        constructionrecord.projected_Contract_value__c = 5000;
        constructionrecord.completed__c = true ;
        constructionrecord.Actual_Bank_Used__c = acc.id;    
        
        Test.startTest();
        insert Constructionrecord;
        
        createCompletedProject.createCompletedProjectRecord(constructionrecord.Id);
        Test.stopTest();
    }
}