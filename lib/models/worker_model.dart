class ProjectModel {
  String? status;
  String? message;
  List<ProjectData>? data;

  ProjectModel({this.status, this.message, this.data});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(ProjectData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectData {
  String? pileDesignedLength;
  String? helperId;
  String? projectStatus;
  int? projectId;
  String? rigDetails;
  String? externalId;
  String? startDate;
  String? rigLength;
  String? rigId;
  String? status;
  String? endDate;
  String? installRate;
  String? agree;
  String? createdBy;
  String? projectDuration;
  String? programmerStatus;
  String? foremanVerified;
  String? createdAt;
  String? pileType;
  String? crewName;
  String? frontmanVerified;
  String? updatedAt;
  int? id;
  String? noOfPile;
  String? foremanId;
  String? helperVerified;
  String? noOfDaysPile;
  String? frontmanId;
  String? externalWorkersVerified;
  SiteInfo? siteInfo;
  String? startDateStr;
  String? endDateStr;
  String? assignedWorker;

  ProjectData({
    this.pileDesignedLength,
    this.helperId,
    this.projectStatus,
    this.projectId,
    this.rigDetails,
    this.externalId,
    this.startDate,
    this.rigLength,
    this.rigId,
    this.status,
    this.endDate,
    this.installRate,
    this.agree,
    this.createdBy,
    this.projectDuration,
    this.programmerStatus,
    this.foremanVerified,
    this.createdAt,
    this.pileType,
    this.crewName,
    this.frontmanVerified,
    this.updatedAt,
    this.id,
    this.noOfPile,
    this.foremanId,
    this.helperVerified,
    this.noOfDaysPile,
    this.frontmanId,
    this.externalWorkersVerified,
    this.siteInfo,
    this.startDateStr,
    this.endDateStr,
    this.assignedWorker,
  });

  ProjectData.fromJson(Map<String, dynamic> json) {
    pileDesignedLength = json['pile_designed_length'];
    helperId = json['helper_id'];
    projectStatus = json['project_status'];
    projectId = json['project_id'];
    rigDetails = json['rig_details'];
    externalId = json['external_id'];
    startDate = json['start_date'];
    rigLength = json['rig_length'];
    rigId = json['rig_id'];
    status = json['status'];
    endDate = json['end_date'];
    installRate = json['install_rate'];
    agree = json['agree'];
    createdBy = json['created_by'];
    projectDuration = json['project_duration'];
    programmerStatus = json['programmer_status'];
    foremanVerified = json['foreman_verified'];
    createdAt = json['created_at'];
    pileType = json['pile_type'];
    crewName = json['crew_name'];
    frontmanVerified = json['frontman_verified'];
    updatedAt = json['updated_at'];
    id = json['id'];
    noOfPile = json['no_of_pile'];
    foremanId = json['foreman_id'];
    helperVerified = json['helper_verified'];
    noOfDaysPile = json['no_of_days_pile'];
    frontmanId = json['frontman_id'];
    externalWorkersVerified = json['external_workers_verified'];
    siteInfo = json['siteinfo'] != null ? SiteInfo.fromJson(json['siteinfo']) : null;
    startDateStr = json['start_date_str'];
    endDateStr = json['end_date_str'];
    assignedWorker = json['assigned_worker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['pile_designed_length'] = this.pileDesignedLength;
    data['helper_id'] = this.helperId;
    data['project_status'] = this.projectStatus;
    data['project_id'] = this.projectId;
    data['rig_details'] = this.rigDetails;
    data['external_id'] = this.externalId;
    data['start_date'] = this.startDate;
    data['rig_length'] = this.rigLength;
    data['rig_id'] = this.rigId;
    data['status'] = this.status;
    data['end_date'] = this.endDate;
    data['install_rate'] = this.installRate;
    data['agree'] = this.agree;
    data['created_by'] = this.createdBy;
    data['project_duration'] = this.projectDuration;
    data['programmer_status'] = this.programmerStatus;
    data['foreman_verified'] = this.foremanVerified;
    data['created_at'] = this.createdAt;
    data['pile_type'] = this.pileType;
    data['crew_name'] = this.crewName;
    data['frontman_verified'] = this.frontmanVerified;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    data['no_of_pile'] = this.noOfPile;
    data['foreman_id'] = this.foremanId;
    data['helper_verified'] = this.helperVerified;
    data['no_of_days_pile'] = this.noOfDaysPile;
    data['frontman_id'] = this.frontmanId;
    data['external_workers_verified'] = this.externalWorkersVerified;
    if (this.siteInfo != null) {
      data['siteinfo'] = this.siteInfo!.toJson();
    }
    data['start_date_str'] = this.startDateStr;
    data['end_date_str'] = this.endDateStr;
    data['assigned_worker'] = this.assignedWorker;
    return data;
  }
}

class SiteInfo {
  String? clientName;
  String? pileDesignedLength;
  String? engineerNumber;
  String? forwardProc;
  String? contractNo;
  String? pileTypes;
  String? plannedPersonType;
  String? problemStatement;
  String? status;
  int? id;
  String? noOfPiles;
  String? plannedBy;
  String? createdBy;
  String? createdAt;
  String? tendorNo;
  String? expectedPileInstalled;
  String? plannedDate;
  String? projectStatus;
  String? projectName;
  String? restrike;
  String? startDate;
  String? siteDrawingVerifiedStatus;
  String? projectAddress;
  String? penetrationRecord;
  String? endDate;
  String? siteDrawing;
  String? projectDescription;
  String? pileLoad;
  String? drawingNo;
  String? projectNotification;
  String? projectStatusUpdateBy;
  String? pileDepth;
  String? revisionNo;
  String? forwardProgram;

  SiteInfo({
    this.clientName,
    this.pileDesignedLength,
    this.engineerNumber,
    this.forwardProc,
    this.contractNo,
    this.pileTypes,
    this.plannedPersonType,
    this.problemStatement,
    this.status,
    this.id,
    this.noOfPiles,
    this.plannedBy,
    this.createdBy,
    this.createdAt,
    this.tendorNo,
    this.expectedPileInstalled,
    this.plannedDate,
    this.projectStatus,
    this.projectName,
    this.restrike,
    this.startDate,
    this.siteDrawingVerifiedStatus,
    this.projectAddress,
    this.penetrationRecord,
    this.endDate,
    this.siteDrawing,
    this.projectDescription,
    this.pileLoad,
    this.drawingNo,
    this.projectNotification,
    this.projectStatusUpdateBy,
    this.pileDepth,
    this.revisionNo,
    this.forwardProgram,
  });

  SiteInfo.fromJson(Map<String, dynamic> json) {
    clientName = json['client_name'];
    pileDesignedLength = json['pile_designed_length'];
    engineerNumber = json['engineer_number'];
    forwardProc = json['forward_procu'];
    contractNo = json['contract_no'];
    pileTypes = json['pile_types'];
    plannedPersonType = json['planned_person_type'];
    problemStatement = json['problem_statement'];
    status = json['status'];
    id = json['id'];
    noOfPiles = json['no_of_piles'];
    plannedBy = json['planned_by'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    tendorNo = json['tendor_no'];
    expectedPileInstalled = json['expected_pile_installed'];
    plannedDate = json['planned_date'];
    projectStatus = json['project_status'];
    projectName = json['project_name'];
    restrike = json['restrike'];
    startDate = json['start_date'];
    siteDrawingVerifiedStatus = json['site_drawing_verified_status'];
    projectAddress = json['project_address'];
    penetrationRecord = json['penetration_record'];
    endDate = json['end_date'];
    siteDrawing = json['site_drawing'];
    projectDescription = json['project_description'];
    pileLoad = json['pile_load'];
    drawingNo = json['drawing_no'];
    projectNotification = json['project_notification'];
    projectStatusUpdateBy = json['project_status_update_by'];
    pileDepth = json['pile_depth'];
    revisionNo = json['revision_no'];
    forwardProgram = json['forward_program'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['client_name'] = this.clientName;
    data['pile_designed_length'] = this.pileDesignedLength;
    data['engineer_number'] = this.engineerNumber;
    data['forward_procu'] = this.forwardProc;
    data['contract_no'] = this.contractNo;
    data['pile_types'] = this.pileTypes;
    data['planned_person_type'] = this.plannedPersonType;
    data['problem_statement'] = this.problemStatement;
    data['status'] = this.status;
    data['id'] = this.id;
    data['no_of_piles'] = this.noOfPiles;
    data['planned_by'] = this.plannedBy;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['tendor_no'] = this.tendorNo;
    data['expected_pile_installed'] = this.expectedPileInstalled;
    data['planned_date'] = this.plannedDate;
    data['project_status'] = this.projectStatus;
    data['project_name'] = this.projectName;
    data['restrike'] = this.restrike;
    data['start_date'] = this.startDate;
    data['site_drawing_verified_status'] = this.siteDrawingVerifiedStatus;
    data['project_address'] = this.projectAddress;
    data['penetration_record'] = this.penetrationRecord;
    data['end_date'] = this.endDate;
    data['site_drawing'] = this.siteDrawing;
    data['project_description'] = this.projectDescription;
    data['pile_load'] = this.pileLoad;
    data['drawing_no'] = this.drawingNo;
    data['project_notification'] = this.projectNotification;
    data['project_status_update_by'] = this.projectStatusUpdateBy;
    data['pile_depth'] = this.pileDepth;
    data['revision_no'] = this.revisionNo;
    data['forward_program'] = this.forwardProgram;
    return data;
  }
}