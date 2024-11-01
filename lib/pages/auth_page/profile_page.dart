import 'package:dashbord/helper/const.dart';

import 'package:dashbord/provider/auth_provider.dart';
import 'package:dashbord/provider/staduim_provider.dart';
import 'package:dashbord/widgets/cards/profile_card.dart';
import 'package:dashbord/widgets/clickables/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class AdminProfilePage extends StatefulWidget {
  const AdminProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminProfilePageState createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
  @override
  void initState() {
    Provider.of<AuthenProvider>(context, listen: false).getUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthenProvider, StaduimProvider>(
        builder: (context, authconsumer, satduimConsumer, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: primaryColor,
                      radius: 50,
                      backgroundImage: NetworkImage(
                          authconsumer.profileModel?.avatar ??
                              'https://via.placeholder.com/150'),
                    ),
                    const SizedBox(width: 16),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: SizedBox(
                        width: 260,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(authconsumer.profileModel?.name ?? 'Non',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Mainbutton(
                              text: "Edit Profile",
                              ontap: () {},
                              paddingbutten:
                                  const EdgeInsets.only(left: 20, right: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Stadiums Management',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: getScreenSize(context).width * 0.3,
                      height: getScreenSize(context).height * 0.015,
                      child: LinearProgressIndicator(
                        value: 1,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                        ),
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: satduimConsumer.isLoading
                      ? 2
                      : satduimConsumer.stadiums.length,
                  itemBuilder: (context, index) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: satduimConsumer.isLoading
                          ? Padding(
                              padding: const EdgeInsets.all(8),
                              child: Shimmer.fromColors(
                                  baseColor: Colors.black12,
                                  highlightColor: Colors.white38,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Container(
                                      color: Colors.white,
                                      width: getScreenSize(context).width * 0.9,
                                      height:
                                          getScreenSize(context).height * 0.3,
                                    ),
                                  )),
                            )
                          : ProfileCard(
                              stauim: satduimConsumer.stadiums[index],
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
