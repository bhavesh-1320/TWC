({
    handleRecordCreate : function(component, event, helper) {
        component.set("v.isTrue", true);
        
        var action = component.get("c.createDDARecord");
        action.setParams({
            "recordId" : component.get("v.recordId")
        });
        action.setCallback(this, function(response){
            console.log('response',response);
            var state = response.getState(); // get the response state
            if(state == 'SUCCESS') {
                var message= "The DDA Record has been created successfully."
                var processState="Success";
                helper.showToast(component, event, helper,state,message);
                helper.navigateToRecord(component, event, helper,response.getReturnValue());
                
            }
            if(state== 'ERROR')
            {
                var smessage = response.getError()[0];
                console.log('smessage',smessage);
                var message= "There is an Error. Please contact your Adminstrator"
                var processState="Error";
                helper.showToast(component, event, helper,state,smessage.message);
                $A.get("e.force:closeQuickAction").fire() 
                
            }
        });
        $A.enqueueAction(action);
    },
    
    handleClose : function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire() 
    }
})