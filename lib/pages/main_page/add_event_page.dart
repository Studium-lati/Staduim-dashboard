import 'package:dashbord/helper/const.dart';
import 'package:dashbord/provider/event_provider.dart';
import 'package:dashbord/provider/staduim_provider.dart';
import 'package:dashbord/widgets/cards/add_event_card.dart';
import 'package:dashbord/widgets/cards/event_card.dart';
import 'package:dashbord/widgets/clickables/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<StaduimProvider, EventProvider>(
        builder: (context, staduimConsumer, eventConsumer, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: DefaultTabController(
              length: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: Column(children: [
                  TabBar(
                      onTap: (value) {
                        if (value == 1) {
                          Provider.of<EventProvider>(context, listen: false)
                              .getEvent(staduimConsumer.currentStaduim!.id
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
                          text: "Add Event",
                        ),
                        Tab(
                          text: "Events",
                        )
                      ]),
                  Expanded(
                      child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 24, left: 16, right: 16),
                          child: Column(
                            children: [
                              const AddEventCard(),
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  width: getScreenSize(context).width * 0.3,
                                  height: getScreenSize(context).height * 0.06,
                                  child: Mainbutton(
                                    text: "Add Event",
                                    textsize: 12,
                                    icon: Icons.calendar_today,
                                    ontap: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: getScreenSize(context).width,
                          child: GridView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: eventConsumer.isLoading
                                  ? 2
                                  : eventConsumer.events.length,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 1.5),
                              itemBuilder: (context, index) {
                                return AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: eventConsumer.isLoading
                                          ? Shimmer.fromColors(
                                              baseColor: Colors.grey[300]!,
                                              highlightColor: Colors.grey[100]!,
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    right: 8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            )
                                          : NearbyEvent(
                                              event:
                                                  eventConsumer.events[index])),
                                );
                              }),
                        )
                      ]))
                ]),
              )));
    });
  }
}
