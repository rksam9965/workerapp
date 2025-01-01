part of 'worker_bloc.dart';

abstract class WorkerState extends Equatable {
  const WorkerState();

  @override
  List<Object?> get props => [];
}

class WorkerInitial extends WorkerState {}
// class WorkerLoadingSlot extends WorkerState {}  // Loading state for GetAllPill

class WorkerLoadingAllPills extends WorkerState {}

// Loading state for GetAllPill
class WorkerLoadingProjectDetails extends WorkerState {}  // Loading state for GetProjectDetails

class WorkerLoaded extends WorkerState {
  final ProjectModel projectList;
  const WorkerLoaded(this.projectList);

  @override
  List<Object?> get props => [projectList];
}

class WorkerDetailLoaded extends WorkerState {
  final ProjectDetailsModel projectDetails;
  const WorkerDetailLoaded(this.projectDetails);

  @override
  List<Object?> get props => [projectDetails];
}

class WorkerDetailPlotLoaded extends WorkerState {
  final PlotResponse plotView;
  const WorkerDetailPlotLoaded(this.plotView);

  @override
  List<Object?> get props => [plotView];
}

class GetAllView extends WorkerState {
  final PileData pileData;
  const GetAllView(this.pileData);

  @override
  List<Object?> get props => [pileData];
}

class WorkerError extends WorkerState {
  final String message;
  const WorkerError(this.message);

  @override
  List<Object?> get props => [message];
}
