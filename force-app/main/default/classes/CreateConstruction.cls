public class CreateConstruction {

//Cypress Learning Solutions 10-31-2019
//Script for Automating Creation of DDA from PPA Record Button
//Notes: Changes need to be added to the createDDATest, which creates a 'test' record for deployment to prod
    
    @AuraEnabled
    public static String CreateConstructionRecord(String recordId){

// This section Creates a variable called ppaRecord.  This is a query to the PPQ information called a SOQL (Salesforce Object Query Language)
// The first section starts with 'Select' is where the fields will be included
// The second section starts with 'from' and selects the object PPA__c
// The third section starts with 'where' and selects the condition (where Id=:recordId), which will be the record of the page our button is on
        
        DDA__c ddaRecord = [Select Id,Name,Project__c,DDA_Start_Date__c,Payment_Received__c,DDA_Value__c,
                            Probability__c,Completed__c,Expected_Project_Size_USD__c,Percent_Complete_by_March_31__c,
                            Percent_Complete_by_March_31_NY__c from DDA__c where Id=:recordId Limit 1];

       // Construction__c updateconstructionrecord = new Construction__c();
      // updateconstructionrecord.Completed__c = true;
      //  updateconstructionrecord.Id = ConstructionRecord.Id;
      //  update updateconstructionrecord;

// This section Create a new DDA Record.  This section includes Mapping New DDA fields are on the Left, Existing PPA Fields are on the right
// The top line 'DDA__c ddaRecord = new DDA__c()' is building an object
// The final bottom line is 'insert ddaRecord' this is takes this object we are creating in this section and creating a new record (insert) in Salesforce)
// Review the fields below and make changes.  NOTE: Changes to this mapping will need to be added to the createDDA Test Class in order to push changes into Production.
                  
        Construction__c constructionRecord = new Construction__c();
        constructionRecord.Name = ddaRecord.Name;
        constructionRecord.Related_DDA__c = ddaRecord.Id;
        constructionRecord.Project__c = ddaRecord.Project__c;
        constructionRecord.Projected_Contract_Value__c = ddaRecord.Expected_Project_Size_USD__c;
        constructionRecord.Completed__c=false;
        constructionRecord.Construction_Start_Date__c = ddaRecord.DDA_Start_Date__c;
        //constructionRecord.Projected_Contract_Value__c = ddaRecord.DDA_Value__c;
        constructionRecord.Percent_Complete_March_31_This_Year__c = ddaRecord.Percent_Complete_by_March_31__c;
        constructionRecord.Percent_Complete_March_31_NY__c = ddaRecord.Percent_Complete_by_March_31_NY__c;
        
        insert constructionRecord;
        
        return constructionRecord.Id;
    }
}