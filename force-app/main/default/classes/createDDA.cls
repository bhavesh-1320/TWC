public class createDDA {

//Cypress Learning Solutions 10-31-2019
//Script for Automating Creation of DDA from PPA Record Button
//Notes: Changes need to be added to the createDDATest, which creates a 'test' record for deployment to prod
    
    @AuraEnabled
    public static String createDDARecord(String recordId){

// This section Creates a variable called ppaRecord.  This is a query to the PPQ information called a SOQL (Salesforce Object Query Language)
// The first section starts with 'Select' is where the fields will be included
// The second section starts with 'from' and selects the object PPA__c
// The third section starts with 'where' and selects the condition (where Id=:recordId), which will be the record of the page our button is on
        
        PPA__c ppaRecord = [Select Id,Name,Project__c,PPA_Start_Date__c,Payment_Received__c,PPA_Value__c,
                            Probability__c,Completed__c,Potential_Lender__c,Projected_Project_Size_USD__c,
                            Expected_Project_Size_sqft__c,Projected_Total_OH_P__c,
                            Percent_Complete_by_March_31__c,
                            Percent_Complete_by_March_31_NY__c from PPA__c where Id=:recordId Limit 1];


// This section Create a new DDA Record.  This section includes Mapping New DDA fields are on the Left, Existing PPA Fields are on the right
// The top line 'DDA__c ddaRecord = new DDA__c()' is building an object
// The final bottom line is 'insert ddaRecord' this is takes this object we are creating in this section and creating a new record (insert) in Salesforce)
// Review the fields below and make changes.  NOTE: Changes to this mapping will need to be added to the createDDA Test Class in order to push changes into Production.
                  
        DDA__c ddaRecord = new DDA__c();
        ddaRecord.Name = ppaRecord.Name;
        ddaRecord.Project__c = ppaRecord.Project__c;
        ddaRecord.DDA_Start_Date__c = ppaRecord.PPA_Start_Date__c;
        ddaRecord.Payment_Received__c = ppaRecord.Payment_Received__c;
        ddaRecord.DDA_Value__c = ppaRecord.PPA_Value__c;
        ddaRecord.Probability__c = ppaRecord.Probability__c;
        //ddaRecord.Completed__c = ppaRecord.Completed__c;
        ddaRecord.Expected_Project_Size_USD__c = ppaRecord.Projected_Project_Size_USD__c;
        ddaRecord.Expected_Project_Size_sq_ft__c = ppaRecord.Expected_Project_Size_sqft__c;
        ddaRecord.Percent_Complete_by_March_31__c = ppaRecord.Percent_Complete_by_March_31__c;
        ddaRecord.Percent_Complete_by_March_31_NY__c = ppaRecord.Percent_Complete_by_March_31_NY__c;
        ddaRecord.Related_PPA__c =ppaRecord.Id;
        
        insert ddaRecord;
        
        return ddaRecord.Id;
    }
}