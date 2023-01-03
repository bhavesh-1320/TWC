@isTest
private class createConstructionTest {
    @isTest static void createConstructionTestMethod() {
        
        Account acc = new Account(); 
        acc.Name='Accenture';
        
        insert acc;
        
        Opportunity opp = new Opportunity();
        opp.Name='Developer Program';
        opp.AccountId = acc.Id;
        opp.StageName='PPA';
        opp.CloseDate=Date.Today();
        
        insert opp;
        
        

        DDA__c ddaRecord = new DDA__c();
        ddaRecord.Name = 'Accenture';
        ddaRecord.Project__c = opp.Id;
        ddaRecord.DDA_Start_Date__c = Date.today();
        ddaRecord.Payment_Received__c = true;
        ddaRecord.DDA_Value__c = 5000;
        ddaRecord.Probability__c = 50;
        ddaRecord.Completed__c = true;
        ddaRecord.Expected_Project_Size_USD__c = 5000;
        ddaRecord.Percent_Complete_by_March_31__c = 25;
        ddaRecord.Percent_Complete_by_March_31_NY__c = 50;
        
        Test.startTest();
        insert ddaRecord;
        
        CreateConstruction.CreateConstructionRecord(ddaRecord.Id);
        Test.stopTest();
    }
}