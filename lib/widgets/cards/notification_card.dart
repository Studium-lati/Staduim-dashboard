import 'package:dashbord/helper/const.dart';
import 'package:dashbord/models/reservation_model.dart';
import 'package:dashbord/provider/reservations_provider.dart';
import 'package:dashbord/widgets/clickables/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({super.key, required this.reservation});
  final ReservationsModel reservation;

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2,
      shadowColor: Colors.grey,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 24.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sure you want to accept?',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Date:${widget.reservation.date!.toString().substring(0, 10)} ',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  'Time: ${widget.reservation.time}:00',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Duration: ${widget.reservation.duration} hours',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  'Deposit: ${widget.reservation.deposit} LYD',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Price: ${widget.reservation.price} LYD',
              style: TextStyle(
                color: secondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Mainbutton(
                  text: "No, cancel",
                  textcolor: Colors.black,
                  strokeColor: Colors.black,
                  backgroundColor: Colors.white,
                  ontap: () {},
                  paddingbutten: const EdgeInsets.only(left: 18, right: 18),
                ),
                Mainbutton(
                  text: "Yes, Confirm",
                  ontap: () {
                    setState(() {
                      Provider.of<ReservationsProvider>(context, listen: false)
                          .approveReservation(widget.reservation.id.toString());
                      Provider.of<ReservationsProvider>(context, listen: false)
                          .fetchReservationsApproved( widget.reservation.stadiumId.toString());
                    });
                  },
                  paddingbutten: const EdgeInsets.only(left: 18, right: 18),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
