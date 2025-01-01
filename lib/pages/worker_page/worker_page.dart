import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../blocs/worker_bloc/worker_bloc.dart';
import '../../models/worker_model.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/project_card.dart';
import '../../widgets/text_form_field.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WorkerBloc _newsBloc = WorkerBloc();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0), () {
      _newsBloc.add(GetProjectList()); // Initial fetch when the page loads
    });
  }

  @override
  void dispose() {
    _newsBloc.close(); // Close the bloc when the page is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _newsBloc,
      child: Scaffold(
        backgroundColor: Color(0xFFFFF1F4), // Light pink background
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
                    'assets/logo.svg', // Replace with your SVG asset path
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
                // The ListView will be wrapped in an Expanded widget to prevent overflow
                Expanded(
                  child: BlocListener<WorkerBloc, WorkerState>(
                    listener: (context, state) {
                      if (state is WorkerError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message!)),
                        );
                      }
                    },
                    child: BlocBuilder<WorkerBloc, WorkerState>(
                      builder: (context, state) {
                        if (state is WorkerLoadingProjectDetails) {
                          return loading();
                        } else if (state is WorkerLoaded) {
                          return projectListView(context, state.projectList);
                        } else if (state is WorkerError) {
                          return Center(child: Text(state.message ?? 'Error'));
                        } else {
                          return Center(child: Text(''));
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget projectListView(BuildContext context, ProjectModel model) {
    // Check if the model's data is null or empty
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

  Widget loading() => Center(child: CircularProgressIndicator());
}
