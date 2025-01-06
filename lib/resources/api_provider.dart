import 'package:dio/dio.dart';
import '../models/project_details.dart';
import '../models/viewall_pile.dart';
import '../models/viewpilesbyplot.dart';
import '../models/worker_model.dart';
import 'network.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String baseUrl = 'http://153.92.222.134:8088/workerapp';

  Future<ProjectModel> fetchDataList({String? query}) async {
    try {
      final String url = query != null
          ? '$baseUrl/project_list?userid=$query'
          : '$baseUrl/project_list?userid=1';

      // Print the URL
      print("API Call: $url");

      Response response = await _dio.get(url);
      return ProjectModel.fromJson(response.data);
    } catch (error) {
      throw NetworkError();
    }
  }

  Future<ProjectDetailsModel> fetchProjectDetails({int? projectId, String? userId}) async {
    try {
      final String url = '$baseUrl/viewplot_details?userid=${userId ?? "1"}&project_id=$projectId';

      // Print the URL
      print("API Call: $url");

      Response response = await _dio.get(url);
      return ProjectDetailsModel.fromJson(response.data);
    } catch (error) {
      throw NetworkError();
    }
  }

  Future<PlotResponse> viewPlot({int? projectId, String? userId, int? plotId}) async {
    try {
      final String url = '$baseUrl/view_pile_by_plots?userid=${userId ?? "1"}&project_id=$projectId&plot_id=$plotId';

      // Print the URL
      print("API Call: $url");

      Response response = await _dio.get(url);
      print(response.data.toString());
      return PlotResponse.fromJson(response.data);
    } catch (error) {
      throw NetworkError();
    }
  }

  Future<PileData> viewAllPiles({int? projectId, String? userId}) async {
    try {
      final String url = '$baseUrl/view_allpile_by_project?userid=${userId ?? 1}&project_id=$projectId';

      // Print the URL
      print("API Call: $url");

      Response response = await _dio.get(url);

      // Log the response for debugging
      print("API Response: ${response.data}");

      if (response.data == null) {
        throw Exception("No data received from the API");
      }

      return PileData.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Error in viewAllPiles: $error");
      print("StackTrace: $stackTrace");

      if (error is DioError) {
        throw NetworkError(
          message: error.message.toString(),
          statusCode: error.response?.statusCode,
          url: error.requestOptions.path,
          originalException: error,
        );
      }

      throw NetworkError(
        message: "Unexpected error occurred",
        originalException: error,
      );
    }
  }
}
