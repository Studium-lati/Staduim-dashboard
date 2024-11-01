import 'package:dashbord/helper/const.dart';
import 'package:dashbord/provider/reservations_provider.dart';
import 'package:dashbord/provider/staduim_provider.dart';
import 'package:dashbord/widgets/cards/notification_approved.dart';
import 'package:dashbord/widgets/cards/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    Provider.of<ReservationsProvider>(context, listen: false).fetchReservations(
        Provider.of<StaduimProvider>(context, listen: false)
            .currentStaduim!
            .id
            .toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ReservationsProvider, StaduimProvider>(
        builder: (context, reservitionConsumer, staduimConsumer, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                      onTap: (value) {
                        if (value == 0) {
                          Provider.of<ReservationsProvider>(context,
                                  listen: false)
                              .fetchReservations(staduimConsumer
                                  .currentStaduim!.id
                                  .toString());
                        } else {
                          Provider.of<ReservationsProvider>(context,
                                  listen: false)
                              .fetchReservationsApproved(staduimConsumer
                                  .currentStaduim!.id
                                  .toString());
                        }
                      },
                      isScrollable: false,
                      unselectedLabelColor: grayColor,
                      indicatorColor: primaryColor,
                      dividerColor: Colors.black,
                      labelColor: secondaryColor,
                      dividerHeight: 0,
                      tabs: const [
                        Tab(
                          text: "Pending",
                        ),
                        Tab(
                          text: "Approved",
                        )
                      ]),
                  const SizedBox(height: 16),
                  Expanded(
                    child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          ListView.builder(
                              itemCount: reservitionConsumer.isLoading
                                  ? 4
                                  : reservitionConsumer.reservations.length,
                              itemBuilder: (context, index) {
                                return reservitionConsumer.isLoading
                                    ? Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Shimmer.fromColors(
                                            baseColor: Colors.black12,
                                            highlightColor: Colors.white38,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              child: Container(
                                                color: Colors.white,
                                                width: getScreenSize(context)
                                                        .width *
                                                    0.9,
                                                height: getScreenSize(context)
                                                        .height *
                                                    0.17,
                                              ),
                                            )),
                                      )
                                    : NotificationCard(
                                        reservation: reservitionConsumer
                                            .reservations[index]);
                              }),
                          ListView.builder(
                              itemCount: reservitionConsumer.isLoading
                                  ? 4
                                  : reservitionConsumer
                                      .reservationsAproved.length,
                              itemBuilder: (context, index) {
                                return AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  child: reservitionConsumer.isLoading
                                      ? Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Shimmer.fromColors(
                                              baseColor: Colors.black12,
                                              highlightColor: Colors.white38,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: Container(
                                                  color: Colors.white,
                                                  width: getScreenSize(context)
                                                          .width *
                                                      0.9,
                                                  height: getScreenSize(context)
                                                          .height *
                                                      0.17,
                                                ),
                                              )),
                                        )
                                      : NotificationApproved(
                                          reservation: reservitionConsumer
                                              .reservationsAproved[index]),
                                );
                              }),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
