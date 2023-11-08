import 'package:flutter/material.dart';
import 'package:fudr_project/banwari/about_fudr_screen.dart';
import 'package:fudr_project/banwari/login_screen.dart';
import 'package:fudr_project/banwari/scan_code_screen.dart';
import 'package:fudr_project/banwari/self_pickup_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
  }

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: double.infinity,
        elevation: 2,
        toolbarHeight: 150,
        title: Padding(
          padding: const EdgeInsets.only(top: 60, left: 10),
          child: Image.asset(
            'assets/fudr_logo.png',
            height: h * 0.5,
            width: w * 0.5,
          ),
        ),
        bottom: PreferredSize(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Container(
                height: 30,
                child: TabBar(
                    controller: tabController,
                    labelColor: Color.fromARGB(255, 83, 132, 172),
                    unselectedLabelColor: Color.fromARGB(255, 83, 132, 172),
                    indicatorColor: Color.fromARGB(255, 83, 132, 172),
                    tabs: [
                      Tab(
                        child: Text('SCAN CODE',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Hind',
                            )),
                      ),
                      Tab(
                        child: Text('SELF PICKUP',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Hind',
                            )),
                      )
                    ]),
              ),
            ),
            preferredSize: Size(double.infinity, 60)),
      ),
      drawer: Drawer(
        width: w * 0.7,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(
                'assets/fudr_logo.png',
                width: w * 0.53,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Divider(
              indent: 80,
              thickness: 1,
              color: Colors.black.withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 40,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: h * 0.04,
                    width: w * 0.06,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 83, 132, 172),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showModalBottomSheet(
                            isScrollControlled: true,
                            barrierColor: Colors.black.withOpacity(.4),
                            context: (context),
                            builder: (context) {
                              return LoginScreen();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Color.fromARGB(255, 83, 132, 172),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Divider(
              indent: 80,
              thickness: 1,
              color: Colors.black.withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.info_outline,
                      color: Color.fromARGB(255, 83, 132, 172),
                      size: 25,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AboutScreen(),
                      ));
                    },
                    child: Text(
                      'About FUDR',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 83, 132, 172)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [ScanCodeScreen(), SelfPickupScreen()],
      ),
    );
  }
}
