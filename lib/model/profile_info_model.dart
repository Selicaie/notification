class Profile_info_model {
  int? _employeeNo;
  String? _empAname;
  int? _managerId;
  String? _manager;
  String? _empOrg;
  String? _org2;
  String? _org3;

  Profile_info_model(
      {int? employeeNo,
        String? empAname,
        int? managerId,
        String? manager,
        String? empOrg,
        String? org2,
        String? org3}) {
    if (employeeNo != null) {
      this._employeeNo = employeeNo;
    }
    if (empAname != null) {
      this._empAname = empAname;
    }
    if (managerId != null) {
      this._managerId = managerId;
    }
    if (manager != null) {
      this._manager = manager;
    }
    if (empOrg != null) {
      this._empOrg = empOrg;
    }
    if (org2 != null) {
      this._org2 = org2;
    }
    if (org3 != null) {
      this._org3 = org3;
    }
  }

  int? get employeeNo => _employeeNo;
  set employeeNo(int? employeeNo) => _employeeNo = employeeNo;
  String? get empAname => _empAname;
  set empAname(String? empAname) => _empAname = empAname;
  int? get managerId => _managerId;
  set managerId(int? managerId) => _managerId = managerId;
  String? get manager => _manager;
  set manager(String? manager) => _manager = manager;
  String? get empOrg => _empOrg;
  set empOrg(String? empOrg) => _empOrg = empOrg;
  String? get org2 => _org2;
  set org2(String? org2) => _org2 = org2;
  String? get org3 => _org3;
  set org3(String? org3) => _org3 = org3;

  Profile_info_model.fromJson(Map<String, dynamic> json) {
    _employeeNo = json['Employee_no'];
    _empAname = json['emp_aname'];
    _managerId = json['manager_id'];
    _manager = json['manager'];
    _empOrg = json['emp_org'];
    _org2 = json['org_2'];
    _org3 = json['org_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Employee_no'] = this._employeeNo;
    data['emp_aname'] = this._empAname;
    data['manager_id'] = this._managerId;
    data['manager'] = this._manager;
    data['emp_org'] = this._empOrg;
    data['org_2'] = this._org2;
    data['org_3'] = this._org3;
    return data;
  }
}
