part of 'worker_bloc.dart';

/// Base class for all Worker events.
abstract class WorkerEvent extends Equatable {
  const WorkerEvent();

  @override
  List<Object?> get props => [];
}

/// Event to fetch the project list, with an optional query parameter.
class GetProjectList extends WorkerEvent {
  final String? query;

  const GetProjectList({this.query});

  @override
  List<Object?> get props => [query];
}

/// Event to fetch details of a specific project by its ID.
class GetProjectDetails extends WorkerEvent {
  final int projectId;

  const GetProjectDetails(this.projectId);

  @override
  List<Object?> get props => [projectId];
}

/// Event to fetch details by plot within a specific project.
class GetByPlot extends WorkerEvent {
  final int projectId;
  final int plotId;

  const GetByPlot(this.projectId, this.plotId);

  @override
  List<Object?> get props => [projectId, plotId];
}

/// Event to fetch all pills associated with a specific project.
class GetAllPill extends WorkerEvent {
  int? projectId;

   GetAllPill(this.projectId);

  @override
  List<Object?> get props => [projectId];
}
