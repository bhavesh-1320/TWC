public class createCompletedProject { 
 
//Cypress Learning Solutions 10-31-2019
//Script for Automating Creation of DDA from PPA Record Button
//Notes: Changes need to be added to the createDDATest, which creates a 'test' record for deployment to prod
    
    @AuraEnabled
    public static String createCompletedProjectRecord(String recordId){

// This section Creates a variable called ppaRecord.  This is a query to the PPQ information called a SOQL (Salesforce Object Query Language)
// The first section starts with 'Select' is where the fields will be included
// The second section starts with 'from' and selects the object PPA__c
// The third section starts with 'where' and selects the condition (where Id=:recordId), which will be the record of the page our button is on
        
        Construction__c ConstructionRecord = [Select Id,Name,Project__c,Construction_Start_Date__c, Projected_Contract_Value__c,
                            Completed__c,Actual_Bank_Used__c,
                            Project_Size_sqft__c
                             from Construction__c where Id=:recordId Limit 1];

       // Construction__c updateconstructionrecord = new Construction__c();
      // updateconstructionrecord.Completed__c = true;
      //  updateconstructionrecord.Id = ConstructionRecord.Id;
      //  update updateconstructionrecord;

// This section Create a new DDA Record.  This section includes Mapping New DDA fields are on the Left, Existing PPA Fields are on the right
// The top line 'DDA__c ddaRecord = new DDA__c()' is building an object
// The final bottom line is 'insert ddaRecord' this is takes this object we are creating in this section and creating a new record (insert) in Salesforce)
// Review the fields below and make changes.  NOTE: Changes to this mapping will need to be added to the createDDA Test Class in order to push changes into Production.
                  
        Completed_Project__c completedprojectRecord = new Completed_Project__c();
        completedprojectRecord.Name = ConstructionRecord.Name;
        completedprojectRecord.BankUsed__c	= ConstructionRecord.Actual_Bank_Used__c;
        completedprojectRecord.Project__c = ConstructionRecord.Project__c;
        completedprojectRecord.Completed__c=false;
        completedprojectRecord.Final_Contract_Value__c = ConstructionRecord.Projected_Contract_Value__c;
        completedprojectRecord.Associated_Construction__c =ConstructionRecord.Id;
        completedprojectRecord.BankUsed__c = ConstructionRecord.Actual_Bank_Used__c;
        insert completedprojectRecord;
        
        return completedprojectRecord.Id;
    }
}