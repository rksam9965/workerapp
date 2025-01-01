
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/project_details.dart';
import '../../models/viewall_pile.dart';
import '../../models/viewpilesbyplot.dart';
import '../../models/worker_model.dart';
import '../../resources/api_repository.dart';
import '../../resources/network.dart';

part 'worker_event.dart';
part 'worker_state.dart';

class WorkerBloc extends Bloc<WorkerEvent, WorkerState> {
  final ApiRepository _apiRepository = ApiRepository();




  WorkerBloc() : super(WorkerInitial()) {
    // Event to get the list of projects
    on<GetProjectList>((event, emit) async {
      try {
        emit(WorkerLoadingProjectDetails());
        final projectList = await _apiRepository.fetchProjectList(query: event.query);  // Fetch the list of projects
        emit(WorkerLoaded(projectList));
      } catch (error, stackTrace) {
        // Print detailed error and stack trace for debugging
        print("Error: $error");
        print("StackTrace: $stackTrace");
        if (error is NetworkError) {
          emit(WorkerError("Network error occurred: ${error.toString()}"));
        } else {
          emit(WorkerError("Failed to fetch pile data: ${error.toString()}"));
        }
      }
    });

    // Event to get the details of a specific project
    on<GetAllPill>((event, emit) async {
      try {
        emit(WorkerLoadingAllPills());
        final getAllData = await _apiRepository.getPileAllData(projectId: event.projectId);

        emit(GetAllView(getAllData));
      } catch (error, stackTrace) {
        // Print detailed error and stack trace for debugging
        print("Error: $error");
        print("StackTrace: $stackTrace");

        if (error is NetworkError) {
          emit(WorkerError("Network error occurred: ${error.toString()}"));
        } else {
          emit(WorkerError("Failed to fetch pile data: ${error.toString()}"));
        }
      }

    });

    on<GetProjectDetails>((event, emit) async {
      try {
        emit(WorkerLoadingProjectDetails());
        final projectDetails = await _apiRepository.viewPlot(projectId: event.projectId);
        emit(WorkerDetailLoaded(projectDetails));
      } catch (error) {
        emit(WorkerError("Failed to fetch project details"));
      }
    });


    on<GetByPlot>((event, emit) async {
      try {
        emit(WorkerLoadingProjectDetails());
        final plotByView = await _apiRepository.getPlotByView(projectId: event.projectId,plotId: event.plotId);  // Fetch project details
        emit(WorkerDetailPlotLoaded(plotByView));
      } catch (error) {
        emit(WorkerError("Failed to fetch project details. Is your device online?"));
      }
    });

  }




}
