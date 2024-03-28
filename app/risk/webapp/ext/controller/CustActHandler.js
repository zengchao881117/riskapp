sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        custAct: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
