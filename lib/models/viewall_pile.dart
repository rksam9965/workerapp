class PileData1 {
  final String pileDiameter;
  final String mainReinInstall;
  final String concreteGradeInstall;
  final String pileDimension;
  final String setMmInstall;
  final String status;
  final String pileLengthStatus;
  final String pileLength;
  final String secReinDesign;
  final String dcClassDesign;
  final String compression;
  final String unit;
  final String pileStatus;
  final String reinforcementStatus;
  final String projectId;
  final String pileLengthInstall;
  final String secReinInstall;
  final String dcClassInstall;
  final String tension;
  final String pileLenDesign;
  final String tensionReinDesign;
  final String shear;
  final String pileLoadDesign;
  final String pileLenInstall;
  final String foremanId;
  final String? noOfPiles;
  final String createdBy;
  String? plotStatus;
  final String plotId;
  final String cageType;
  final String tensionReinInstall;
  final String concreteTicketImg;
  final String pileLoadInstall;
  final String restrikeInstall;
  final String frontmanId;
  final String createdAt;
  final String plotName;
  final String debondLength;
  final String theoreticalVolumeDesign;
  final String cubeTakenInstall;
  final String? dropHeight;
  final String penetrationInstall;
  final String helperId;
  final String? updatedAt;
  final String? pileId;
  final String debondLengthInstall;
  final String theoreticalVolumeInstall;
  final String testPileInstall;
  final String setMmDesign;
  final String comments;
  final String externalWorkers;
  final String pileType;
  final String mainReinDesign;
  final String concreteGradeDesign;
  final String integrityTestInstall;
  final String pileCreatedFrom;
  final String programmerUpdatedBy;
  final String assiedWorker;
  final String startDate;
  final String endDate;
  final String? projectAddress;
  final String contractNo;
  final String tendorNo;
  final String projectName;

  PileData1({
    required this.pileDiameter,
    required this.mainReinInstall,
    required this.concreteGradeInstall,
    required this.pileDimension,
    required this.setMmInstall,
    required this.status,
    required this.pileLengthStatus,
    required this.pileLength,
    required this.secReinDesign,
    required this.dcClassDesign,
    required this.compression,
    required this.unit,
    this.noOfPiles,
    this.plotStatus,
    required this.pileStatus,
    required this.reinforcementStatus,
    required this.projectId,
    required this.pileLengthInstall,
    required this.secReinInstall,
    required this.dcClassInstall,
    required this.tension,
    required this.pileLenDesign,
    required this.tensionReinDesign,
    required this.shear,
    required this.pileLoadDesign,
    required this.pileLenInstall,
    required this.foremanId,
    required this.createdBy,
    required this.plotId,
    required this.cageType,
    required this.tensionReinInstall,
    required this.concreteTicketImg,
    required this.pileLoadInstall,
    required this.restrikeInstall,
    required this.frontmanId,
    required this.createdAt,
    required this.plotName,
    required this.debondLength,
    required this.theoreticalVolumeDesign,
    required this.cubeTakenInstall,
    required this.dropHeight,
    required this.penetrationInstall,
    required this.helperId,
    this.updatedAt,
    this.pileId,
    required this.debondLengthInstall,
    required this.theoreticalVolumeInstall,
    required this.testPileInstall,
    required this.setMmDesign,
    required this.comments,
    required this.externalWorkers,
    required this.pileType,
    required this.mainReinDesign,
    required this.concreteGradeDesign,
    required this.integrityTestInstall,
    required this.pileCreatedFrom,
    required this.programmerUpdatedBy,
    required this.assiedWorker,
    required this.startDate,
    required this.endDate,
    this.projectAddress,
    required this.contractNo,
    required this.tendorNo,
    required this.projectName,
  });

  factory PileData1.fromJson(Map<String, dynamic> json) {
    return PileData1(
      pileDiameter: json['pile_diameter'],
      mainReinInstall: json['main_rein_install'],
      concreteGradeInstall: json['concrete_grade_install'],
      pileDimension: json['pile_dimension'],
      setMmInstall: json['set_mm_install'],
      status: json['status'],
      pileLengthStatus: json['pile_length_status'],
      pileLength: json['pile_length'],
      secReinDesign: json['sec_rein_design'],
      dcClassDesign: json['dc_class_design'],
      compression: json['compression'],
      unit: json['unit'],
      noOfPiles:json['noOfPiles'],
      pileStatus: json['pile_status'],
      reinforcementStatus: json['reinforcement_status'],
      projectId: json['project_id'],
      pileLengthInstall: json['pile_length_install'],
      secReinInstall: json['sec_rein_install'],
      dcClassInstall: json['dc_class_install'],
      tension: json['tension'],
      pileLenDesign: json['pile_len_design'],
      tensionReinDesign: json['tension_rein_design'],
      shear: json['shear'],
      pileLoadDesign: json['pile_load_design'],
      pileLenInstall: json['pile_len_install'],
      foremanId: json['foreman_id'],
      createdBy: json['created_by'],
      plotId: json['plot_id'],
      cageType: json['cage_type'],
      tensionReinInstall: json['tension_rein_install'],
      concreteTicketImg: json['concrete_ticket_img'],
      pileLoadInstall: json['pile_load_install'],
      restrikeInstall: json['restrike_install'],
      frontmanId: json['frontman_id'],
      createdAt: json['created_at'],
      plotName: json['plot_name'],
      debondLength: json['debond_length'],
      theoreticalVolumeDesign: json['theoritical_volume_design'],
      cubeTakenInstall: json['cube_taken_install'],
      dropHeight: json['drop_height'],
      penetrationInstall: json['penetration_install'],
      helperId: json['helper_id'],
      updatedAt: json['updated_at'],
      pileId: json['pile_id'],
      debondLengthInstall: json['debond_length_install'],
      theoreticalVolumeInstall: json['theoritical_volume_install'],
      testPileInstall: json['test_pile_install'],
      setMmDesign: json['set_mm_design'],
      comments: json['comments'],
      externalWorkers: json['external_workers'],
      pileType: json['pile_type'],
      mainReinDesign: json['main_rein_design'],
      concreteGradeDesign: json['concrete_grade_design'],
      integrityTestInstall: json['integrity_test_install'],
      pileCreatedFrom: json['pile_created_from'],
      programmerUpdatedBy: json['programmer_updated_by'],
      assiedWorker: json['assiedworker'],
      startDate: json['startdate'],
      endDate: json['enddate'],
      projectAddress: json['project_address'],
      contractNo: json['contract_no'],
      tendorNo: json['tendor_no'],
      projectName: json['project_name'],
    );
  }
}

class PileData {
  final String status;
  final String error;
  final List<PileData1> data;

  PileData({
    required this.status,
    required this.error,
    required this.data,
  });

  factory PileData.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<PileData1> dataList =
    list.map((e) => PileData1.fromJson(e)).toList();

    return PileData(
      status: json['status'],
      error: json['error'],
      data: dataList,
    );
  }
}
