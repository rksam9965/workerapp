class ProjectDetailsModel {
  final String status;
  final String error;
  final List<ProjectDetail> data;

  ProjectDetailsModel({
    required this.status,
    required this.error,
    required this.data,
  });

  // Factory constructor to create an instance from a JSON map
  factory ProjectDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProjectDetailsModel(
      status: json['status'] as String,
      error: json['error'] as String,
      data: (json['data'] as List)
          .map((item) => ProjectDetail.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ProjectDetail {
  final int id;
  final String? plotDrawingVerifiedStatus;
  final String? plotNotification;
  final String noOfPiles;
  final String? plotStatus;
  final String createdBy;
  final String plotImg;
  final String projectId;
  final String? problemStatement;
  final String plotName;
  final String pileTally;
  final String status;
  final String createdAt;
  final String siteName;

  ProjectDetail({
    required this.id,
    this.plotDrawingVerifiedStatus,
    this.plotNotification,
    required this.noOfPiles,
    this.plotStatus,
    required this.createdBy,
    required this.plotImg,
    required this.projectId,
    this.problemStatement,
    required this.plotName,
    required this.pileTally,
    required this.status,
    required this.createdAt,
    required this.siteName,
  });

  // Factory constructor to create an instance from a JSON map
  factory ProjectDetail.fromJson(Map<String, dynamic> json) {
    return ProjectDetail(
      id: json['id'] as int,
      plotDrawingVerifiedStatus: json['plot_drawing_verified_status'] as String?,
      plotNotification: json['plot_notification'] as String?,
      noOfPiles: json['no_of_piles'] as String,
      plotStatus: json['plot_status'] as String?,
      createdBy: json['created_by'] as String,
      plotImg: json['plot_img'] as String,
      projectId: json['project_id'] as String,
      problemStatement: json['problem_statement'] as String?,
      plotName: json['plot_name'] as String,
      pileTally: json['pile_tally'] as String,
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      siteName: json['sitename'] as String,
    );
  }
}
