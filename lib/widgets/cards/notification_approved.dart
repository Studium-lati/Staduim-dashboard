import 'package:dashbord/helper/const.dart';
import 'package:dashbord/models/reservation_model.dart';
import 'package:flutter/material.dart';

class NotificationApproved extends StatelessWidget {
  const NotificationApproved({super.key, required this.reservation});
  final ReservationsModel reservation;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.grey,
      margin: const EdgeInsets.only(bottom: 24.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Accepted',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Date:${reservation.date!.toString().substring(0, 10)} ',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  'Time: ${reservation.time}:00',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Duration: ${reservation.duration} hours',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  'Deposit: ${reservation.deposit} LYD',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Price: ${reservation.price} LYD',
              style: TextStyle(
                color: secondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
