({
    
    showToast : function(component, event, helper,state,message) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": state,
            "type": state,
            "message": message
        });
        toastEvent.fire();
    },
    
    navigateToRecord : function (component, event, helper,recordId) {
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": recordId,
            "slideDevName": "related"
        });
        navEvt.fire();
    }
})