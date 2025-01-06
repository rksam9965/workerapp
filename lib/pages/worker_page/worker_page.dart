import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../blocs/worker_bloc/worker_bloc.dart';
import '../../models/worker_model.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/project_card.dart';
import '../../widgets/text_form_field.dart';
import '../plot_pages/plot.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WorkerBloc newsBloc = WorkerBloc();
  final TextEditingController searchController = TextEditingController();
  ProjectModel? projectList;

  @override
  void initState() {
    super.initState();
    newsBloc.add(GetProjectList());
  }

  @override
  void dispose() {
    newsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => newsBloc,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFFFF1F4),
          body: Stack(
            children: [
              AppBarTop(),
              Column(
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 30,
                          child: Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            'SITE DIARY',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      'assets/logo.svg',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Project List", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SearchTextFormField(controller: searchController),
                  SizedBox(height: 8),
                  Expanded(
                    child: BlocBuilder<WorkerBloc, WorkerState>(
                      bloc: newsBloc,
                      builder: (context, state) {
                        if (state is WorkerLoadingProjectDetails) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is WorkerLoaded) {
                          projectList = state.projectList;
                          return projectListView(context, projectList!);
                        } else if (state is WorkerError) {
                          return Center(child: Text(state.message ?? 'Error'));
                        } else {
                          return Center(child: Text(''));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget projectListView(BuildContext context, ProjectModel model) {
    if (model.data == null || model.data!.isEmpty) {
      return Center(
        child: Text('No Data Available', style: TextStyle(fontSize: 18, color: Colors.grey)),
      );
    }

    return ListView.builder(
      itemCount: model.data?.length ?? 0,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ProjectCard(
            navigatorToScreen: (id) => navigatorToScreen(model.data![index].projectId.toString()),
            projectId: model.data![index].projectId.toString(),
            tenderNumber: model.data![index].projectStatus.toString(),
            projectName: model.data![index].crewName.toString(),
            projectAddress: model.data![index].programmerStatus.toString(),
            assignedWorkers: model.data![index].assignedWorker.toString(),
          ),
        );
      },
    );
  }

  Future<void> navigatorToScreen(String Id) async {
    await Future.delayed(Duration(milliseconds: 300));
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlotScreen(
          projectId: Id,
        ),
      ),
    );
    newsBloc.add(GetProjectList());
  }

  Widget loading() => Center(child: CircularProgressIndicator());
}