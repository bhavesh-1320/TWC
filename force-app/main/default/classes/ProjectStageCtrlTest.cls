@isTest
public class ProjectStageCtrlTest {
    @isTest
    static void unitTest1(){
        Opportunity opp = new Opportunity();
        opp.Name = 'Test opp';
        opp.StageName = 'Closed Won';
        opp.CloseDate = Date.Today();
        INSERT opp;
        Test.startTest();
        List<Opportunity> opps = ProjectStageCtrl.getProjectDetails(opp.Id);
        Test.stopTest();
        System.assertEquals(opps.size(), 1);
    } 
}