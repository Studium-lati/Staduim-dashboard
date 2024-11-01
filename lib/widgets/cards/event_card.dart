import 'package:dashbord/models/event_model.dart';
import 'package:dashbord/provider/staduim_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class NearbyEvent extends StatelessWidget {
  const NearbyEvent({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Consumer<StaduimProvider>(
        builder: (context, staduimConsumer, child) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
          image: DecorationImage(
            image: NetworkImage(event.image),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        event.name,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(IconlyBold.location, color: Colors.blue[800]),
                      const SizedBox(width: 10),
                      Text(
                          staduimConsumer.stadiums
                              .where((stadium) => stadium.id == event.stadiumId)
                              .first
                              .location,
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
