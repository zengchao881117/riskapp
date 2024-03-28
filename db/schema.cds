namespace sap.ui.riskmanagement;
using { managed } from '@sap/cds/common';

  entity Risks : managed {
    key ID      : UUID  @(Core.Computed : true);
    title       : String(100);
    prio        : String(5);
    descr       : String;
    miti        : Association to Mitigations;
    impact      : Integer;
   //注解指定js事件中可访问此字段
  //virtual 指定为虚拟元素不会持久化到数据库
    virtual    criticality : Integer @Core.Computed: false;
  }

  entity Mitigations : managed {
    key ID       : UUID  @(Core.Computed : true);
    description  : String;
    owner        : String;
    timeline     : String;
    risks        : Association to many Risks on risks.miti = $self;
  }
