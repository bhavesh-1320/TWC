({
    handleRecordCreate : function(component, event, helper) {
        component.set("v.isTrue", true);
        
        var action = component.get("c.createCompletedProjectRecord");
        action.setParams({
            "recordId" : component.get("v.recordId")
        });
        action.setCallback(this, function(response){
            var state = response.getState(); // get the response state
            if(state == 'SUCCESS') {
                var message= "The Completed Project Record has been created successfully."
                var processState="Success";
                helper.showToast(component, event, helper,state,message);
                helper.navigateToRecord(component, event, helper,response.getReturnValue());
                
            }
            if(state== 'ERROR')
            {
                var message= "There is an Error. Please contact your Adminstrator"
                var processState="Error";
                helper.showToast(component, event, helper,state,message);
                $A.get("e.force:closeQuickAction").fire() 
                
            }
        });
        $A.enqueueAction(action);
    },
    
    handleClose : function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire() 
    }
})