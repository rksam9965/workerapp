import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/worker_bloc/worker_bloc.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/plot_circlebutton.dart';
import '../../widgets/plots_card.dart';

class PlotScreen extends StatefulWidget {
  final String? projectId;
  final String? plotId;
  final int? selectedIndex;

  const PlotScreen({
    Key? key,
    this.projectId,
    this.plotId,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _PlotScreenState createState() => _PlotScreenState();
}

class _PlotScreenState extends State<PlotScreen> {
  WorkerBloc? pillBloc;
  WorkerBloc? projectBloc;
  WorkerBloc? getDataPlot;
  bool transist = false;
  bool isLoading = true;

  @override
  void initState() {
    pillBloc = WorkerBloc();
    projectBloc = WorkerBloc();
    getDataPlot = WorkerBloc();

    final projectId = int.tryParse(widget.projectId ?? '0') ?? 0;
    pillBloc!.add(GetAllPill(projectId));
    projectBloc!.add(GetProjectDetails(projectId));

    // Set isLoading to false once the data is fetched
    Future.delayed(Duration(milliseconds: 0), () {
      setState(() {
        isLoading = false;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    pillBloc?.close();
    projectBloc?.close();
    getDataPlot?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F4),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: pillBloc!),
          BlocProvider.value(value: projectBloc!),
        ],
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  header(screenHeight),
                  const SizedBox(height: 50),
                  transist
                      ? BlocBuilder<WorkerBloc, WorkerState>(
                    bloc: getDataPlot!,
                    builder: (context, state) {
                      if (state is WorkerLoadingAllPills) {
                        return Center(child: Loading("Loading Pills..."));
                      } else if (state is WorkerDetailPlotLoaded) {
                        return PlotsCard(
                          pileList2: state.plotView,
                          transist: transist,
                        );
                      } else if (state is WorkerError) {
                        return Center(child: Error(state.message ?? 'Error'));
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  )
                      : BlocBuilder<WorkerBloc, WorkerState>(
                    bloc: pillBloc!,
                    builder: (context, state) {
                      if (state is WorkerLoadingAllPills) {
                        return Center(child: Loading("Loading Pills..."));
                      } else if (state is GetAllView) {
                        return PlotsCard(
                          pileList: state.pileData,
                          transist: transist,
                        );
                      } else if (state is WorkerError) {
                        return Center(child: Error(state.message ?? 'Error'));
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildBottomButtons(),
                ],
              ),
            ),
            HorizontalPlots(screenHeight),

            // Display loading indicator in the center of the screen
            if (isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  Widget header(double screenHeight) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent.withOpacity(0.2),
            offset: const Offset(2, 2),
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
      ),
      height: screenHeight * 0.245,
      child: Stack(
        children: [
          const AppBarTop(),
          Column(
            children: [
              const SizedBox(height: 45),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'PLOTS',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        rectangleButton("Add Pile", const Color(0xFF70281f), () {
          print("Add Pile button clicked!");
        }),
        const SizedBox(width: 45),
        rectangleButton("View EG", const Color(0xFF70281f), () {
          print("View EG button clicked!");
        }),
      ],
    );
  }

  Widget rectangleButton(String label, Color color, VoidCallback onPressed) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.120, vertical: 9),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFF2B58), Color(0xFF8C132D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget Loading(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget Error(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget HorizontalPlots(double screenHeight) {
    return Container(
      margin: EdgeInsets.only(top: screenHeight / 5.5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 7,
            ),
            BlocBuilder<WorkerBloc, WorkerState>(
              bloc: projectBloc!,
              builder: (context, state) {
                if (state is WorkerLoadingProjectDetails) {
                  return Center(child: Loading(""));
                } else if (state is WorkerDetailLoaded) {
                  return PlotButtons(
                    projectDetails: state.projectDetails,
                    onPlotSelected: (projectId, plotId) {
                      setState(() {
                        transist = true;
                      });
                      getDataPlot!.add(GetByPlot(
                        int.parse(projectId),
                        int.parse(plotId),
                      ));
                    },
                  );
                } else if (state is WorkerError) {
                  return Error(state.message ?? 'Error');
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
