
const cds = require('@sap/cds')

/**
 * Implementation for Risk Management service defined in ./risk-service.cds
 */
module.exports = cds.service.impl(async function() {
    this.after('READ', 'Risks', risksData => {
        const risks = Array.isArray(risksData) ? risksData : [risksData];
        risks.forEach(risk => {
            if (risk.impact >= 100000) {
                risk.criticality = 1;
            } else {
                risk.criticality = 2;
            }
        });
    });

    this.on('setRisks', 'Risks', async req => { 
        //criticality,prio
        await cds.update(cds.entities.Risks, req.params[0].ID).set({ prio:33,criticality:3}); 
    }); 
});