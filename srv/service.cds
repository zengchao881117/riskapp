using { sap.ui.riskmanagement as my } from '../db/schema';
@path: 'service/risk'
service RiskService {
  entity Risks @(restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'RiskViewer' ]
            },
            {
                grant : [ '*' ],
                to : [ 'RiskManager' ]
            }
        ]) as projection on my.Risks
        actions {     
            @( cds.odata.bindingparameter.name : 'Risks',   
            Common.SideEffects : {TargetProperties : ['Risks/prio','Risks/criticality']} 
            )   
            action setRisks(); 
        };
    annotate Risks with @odata.draft.enabled;
  entity Mitigations @(restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'RiskViewer' ]
            },
            {
                grant : [ '*' ],
                to : [ 'RiskManager' ]
            }
        ]) as projection on my.Mitigations;
    annotate Mitigations with @odata.draft.enabled;

            //定义自定义事件
    
}
