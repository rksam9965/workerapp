import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String projectId;
  final String tenderNumber;
  final String projectName;
  final String projectAddress;
  final String assignedWorkers;
  final Function(String id)? navigatorToScreen;

  const ProjectCard({
    Key? key,
    required this.projectId,
    required this.tenderNumber,
    required this.projectName,
    required this.projectAddress,
    required this.assignedWorkers,
    this.navigatorToScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (navigatorToScreen != null) {
          navigatorToScreen!(projectId); // Trigger navigation with projectId
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8), // Smooth rounding of the card
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                row('Project ID', projectId),
                row('Tender Number', tenderNumber),
                row('Project Name', projectName),
                row('Project Address', projectAddress),
                row('Assigned Workers', assignedWorkers),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 100,
            child: Text(
              value,
              style: const TextStyle(fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Handles long text properly
            ),
          ),
        ],
      ),
    );
  }
}
