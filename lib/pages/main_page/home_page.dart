import 'package:dashbord/helper/const.dart';
import 'package:dashbord/widgets/cards/home_cart.dart';
import 'package:dashbord/widgets/cards/thisweek_cart.dart';
import 'package:dashbord/widgets/clickables/main_button_widget.dart';
import 'package:dashbord/widgets/inputs/search_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
          ),
          child: Column(
            children: [
              SearchText(searchController: TextEditingController()),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: getScreenSize(context).width * 0.26,
                    height: getScreenSize(context).height * 0.05,
                    child: Mainbutton(
                      text: 'Weekly',
                      ontap: () {},
                      textsize: 14,
                      paddingbutten: const EdgeInsets.only(),
                    ),
                  ),
                  SizedBox(
                    width: getScreenSize(context).width * 0.28,
                    height: getScreenSize(context).height * 0.05,
                    child: Mainbutton(
                      text: 'yearly',
                      ontap: () {},
                      textsize: 14,
                      textcolor: grayColor,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: getScreenSize(context).width * 0.28,
                    height: getScreenSize(context).height * 0.05,
                    child: Mainbutton(
                      text: 'All',
                      ontap: () {},
                      textsize: 14,
                      textcolor: grayColor,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "My Cards ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )),
              ),
              const SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: getScreenSize(context).height * 0.25,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const HomeCart();
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "This Week",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )),
              ),
              const SizedBox(
                height: 22,
              ),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  const ThisweekCart(
                    title: 'Total Pending',
                    value: '10',
                    icon: Icons.timer,
                    iconColor: Colors.orange,
                    backgroundColor: Colors.orange,
                  ),
                  ThisweekCart(
                      title: 'Total Sales',
                      value: '\$1,000',
                      icon: Icons.show_chart,
                      iconColor: primaryColor,
                      backgroundColor: primaryColor),
                  const ThisweekCart(
                    title: 'Total Order',
                    value: '45',
                    icon: Icons.shopping_cart,
                    iconColor: Colors.amber,
                    backgroundColor: Colors.yellow,
                  ),
                  const ThisweekCart(
                    title: 'Total User',
                    value: '200',
                    icon: Icons.person,
                    iconColor: Colors.purple,
                    backgroundColor: Colors.purple,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      //  bottomNavigationBar: BottomNavigationBar(

      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.bar_chart, color: primaryColor),
      //       label: 'Statistics',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications, color: grayColor),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.pending_actions, color: grayColor),
      //       label: '',
      //     ),
      //      BottomNavigationBarItem(
      //       icon: Icon(Icons.add_chart_rounded, color: grayColor),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person, color:grayColor),
      //       label: '',
      //     ),

      //   ],
      //   currentIndex: 0,
      //   selectedItemColor: primaryColor,
      //   unselectedItemColor:grayColor,
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.white,
      // ),
    );
  }
}
