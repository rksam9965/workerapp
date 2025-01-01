import '../models/project_details.dart';
import '../models/viewall_pile.dart';
import '../models/viewpilesbyplot.dart';
import '../models/worker_model.dart';
import 'api_provider.dart';



class ApiRepository {
  final ApiProvider _provider = ApiProvider();

  Future<ProjectModel> fetchProjectList({String? query}) {
    return _provider.fetchDataList(query: query);
  }

  Future<ProjectDetailsModel> viewPlot({int? projectId, String? userId}) {
    return _provider.fetchProjectDetails(projectId: projectId, userId: userId);
  }

  Future<PlotResponse> getPlotByView({int? projectId, String? userId, int? plotId}) {
    return _provider.viewPlot(projectId: projectId, userId: userId, plotId: plotId);
  }

  Future<PileData> getPileAllData({int? projectId, String? userId}) {
    return _provider.viewAllPiles(projectId: projectId, userId: userId);
  }
}

