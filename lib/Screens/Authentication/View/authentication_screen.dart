import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yaduz_login_join_us/Screens/Authentication/Controller/authentication_controller.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/joinus_tab_bar_view.dart';
import 'package:yaduz_login_join_us/Widgets/AuthenticationScreen/login_tab_bar_view.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  final authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: Colors.grey.shade300, width: 2.0),
                      ),
                    ),
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black.withOpacity(0.3),
                      automaticIndicatorColorAdjustment: false,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      controller: tabController,
                      tabs: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Tab(
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Quicksand Regular'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Tab(
                            child: Text(
                              'Join Us',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Quicksand Regular'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22, right: 15, left: 15),
                  child: SizedBox(
                    height: Get.height * 0.64,
                    child: TabBarView(
                      // physics: NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: const [
                        Login(),
                        JoinUs(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
