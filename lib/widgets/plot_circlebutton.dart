import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/project_details.dart';
import '../pages/plot_pages/plot.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/worker_bloc/worker_bloc.dart';
import '../models/project_details.dart';

class PlotButtons extends StatefulWidget {
  final ProjectDetailsModel? projectDetails; // Assuming `projectDetails` is a model object
  final Function(String, String)? onPlotSelected; // Callback function when a plot is selected

  PlotButtons({ this.projectDetails,  this.onPlotSelected});

  @override
  _PlotButtonsState createState() => _PlotButtonsState();
}

class _PlotButtonsState extends State<PlotButtons> {
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  // To track which button is selected

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(widget.projectDetails!.data.length, (index) {
        // Assuming `data` is a list of objects and you have a `plotName` field
        String plotName = widget.projectDetails!.data[index].plotName.toString();
        return _buildCircleButton(index, plotName); // Build each button
      }),
    );
  }

  Widget _buildCircleButton(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index; // Update the selected index
        });

        // Call the parent callback when the plot is selected
        String projectId = widget.projectDetails!.data[index].projectId.toString();
        String plotId = widget.projectDetails!.data[index].id.toString();
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>PlotScreen(projectId:projectId,plotId:plotId)));
        widget.onPlotSelected!(projectId, plotId);
      },
      child: Container(
        width: 80, // Set the size of the circle
        height: 80, // Set the size of the circle
        margin: EdgeInsets.symmetric(horizontal: 8), // Add some space between buttons
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedIndex == index ? null : Colors.white, // Set circle to white when not selected
          gradient: selectedIndex == index
              ? LinearGradient(
            colors: [
              Color(0xFF722020), // #722020 (100% opacity)
              Color(0xFFC63333), // #C63333 (100% opacity)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0], // Control the color stops (100% for both)
          )
              : null, // No gradient when not selected
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: selectedIndex == index ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
