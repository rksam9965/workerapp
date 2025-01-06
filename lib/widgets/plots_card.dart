import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workerapp/models/viewall_pile.dart';
import 'package:workerapp/models/viewpilesbyplot.dart';

class PlotsCard extends StatelessWidget {
  final PileData? pileList;
  final PlotResponse? pileList2;
  final bool? transist;

  // List of pile data passed to the widget
  PlotsCard({super.key, this.pileList, this.pileList2, this.transist});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // If transist is true, use pileList2; otherwise, use pileList
    if (transist == true) {
      if (pileList2?.data == null || pileList2!.data!.isEmpty) {
        return Center(
          child: Text(
            'No piles available',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        );
      }

      List<Widget> pileWidgets = pileList2!.data!.map((pile) {
        return pileCard(pile, screenWidth);
      }).toList();

      return Column(
        children: pileWidgets, // Returning the list of widgets generated by the map
      );
    } else {
      if (pileList?.data == null || pileList!.data.isEmpty) {
        return Center(
          child: Text(
            'No piles available',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        );
      }

      List<Widget> pileWidgets = pileList!.data.map((pile) {
        return pileCard(pile, screenWidth);
      }).toList();

      return Column(
        children: pileWidgets, // Returning the list of widgets generated by the map
      );
    }
  }

  Widget pileCard(dynamic pile, double screenWidth) {
    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.8, // Adjust width as per screen size
          child: Card(
            color: Colors.white,
            shadowColor: Colors.red,
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  // Padding inside the card
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/pile_logo.png', // Replace with your image asset path
                          width: 50, // Adjust the width and height
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 50,
                              height: 50,
                              color: Colors.grey,
                              child: Icon(Icons.image, color: Colors.white),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Space between image and text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pile.pileId.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              pile.plotName ?? 'Specification not available',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // "Installed" text positioned in the top-right corner
                Positioned(
                  top: 8,
                  right: 8,
                  child: Text(
                    pile.plotStatus == 'Installed' ? 'Installed' : 'Not Installed',
                    style: TextStyle(
                      fontSize: 11,
                      color: pile.plotStatus == 'Installed'
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            print('Pile ${pile.id?.toString() ?? 'Unknown'} pressed!');
          },
          borderRadius: BorderRadius.circular(25),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.4),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.arrow_forward_ios,
                size: 23,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
