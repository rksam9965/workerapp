class PlotResponse {
  final String? status;
  final String? error;
  final List<PlotData>? data;

  PlotResponse({
    this.status,
    this.error,
    this.data,
  });

  factory PlotResponse.fromJson(Map<String, dynamic> json) {
    return PlotResponse(
      status: json['status'],
      error: json['error'],
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => PlotData.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'error': error,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class PlotData {
  final int? id;
  final String? pileId;

  final String? plotDrawingVerifiedStatus;
  final String? plotNotification;
  final String? noOfPiles;
  final String? plotStatus;
  final String? createdBy;
  final String? plotImg;
  final String? projectId;
  final String? problemStatement;
  final String? plotName;
  final String? pileTally;
  final String? status;
  final String? createdAt;
  final String? sitename;

  PlotData({
    this.id,
    this.plotDrawingVerifiedStatus,
    this.plotNotification,
    this.noOfPiles,
    this.plotStatus,
    this.createdBy,
    this.pileId,
    this.plotImg,
    this.projectId,
    this.problemStatement,
    this.plotName,
    this.pileTally,
    this.status,
    this.createdAt,
    this.sitename,
  });

  factory PlotData.fromJson(Map<String, dynamic> json) {
    return PlotData(
      id: json['id'],
      pileId:json['pile_id'],
      plotDrawingVerifiedStatus: json['plot_drawing_verified_status'],
      plotNotification: json['plot_notification'],
      noOfPiles: json['no_of_piles'],
      plotStatus: json['plot_status'],
      createdBy: json['created_by'],
      plotImg: json['plot_img'],
      projectId: json['project_id'],
      problemStatement: json['problem_statement'],
      plotName: json['plot_name'],
      pileTally: json['pile_tally'],
      status: json['status'],
      createdAt: json['created_at'],
      sitename: json['sitename'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'plot_drawing_verified_status': plotDrawingVerifiedStatus,
      'plot_notification': plotNotification,
      'no_of_piles': noOfPiles,
      'plot_status': plotStatus,
      'created_by': createdBy,
      'plot_img': plotImg,
      'project_id': projectId,
      'problem_statement': problemStatement,
      'plot_name': plotName,
      'pile_tally': pileTally,
      'status': status,
      'created_at': createdAt,
      'sitename': sitename,
    };
  }
}
