import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/plot_pages/plot.dart';

class ProjectCard extends StatefulWidget {
  final String projectId;
  final String tenderNumber;
  final String projectName;
  final String projectAddress;
  final String assignedWorkers;

  const ProjectCard({
    required this.projectId,
    required this.tenderNumber,
    required this.projectName,
    required this.projectAddress,
    required this.assignedWorkers,
  });

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  // Example state: You can track things like whether the card is selected or not
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected; // Toggle the selection state
        });

        // Avoid large transition jumps by adding a delay for smoother navigation
        Future.delayed(Duration(milliseconds: 2), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlotScreen(
                projectId: widget.projectId, // Pass the projectId to the PlotScreen
              ),
            ),
          );
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8), // Smooth rounding of the card
        child: Container(
          color: Colors.white, // Change color when selected
          margin: EdgeInsets.all(10.0),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow('Project ID', widget.projectId),
                _buildRow('Tender Number', widget.tenderNumber),
                _buildRow('Project Name', widget.projectName),
                _buildRow('Project Address', widget.projectAddress),
                _buildRow('Assigned Workers', widget.assignedWorkers),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 100,
            child: Text(
              value,
              style: TextStyle(fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Handles long text properly
            ),
          ),
        ],
      ),
    );
  }
}
