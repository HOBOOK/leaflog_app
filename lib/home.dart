import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'network.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final storage = FlutterSecureStorage();
  NetworkHandler networkHandler = NetworkHandler();

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  late String? barcodeScanRes;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: 'HOME',
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(routes: {}),
        onPressed: (context) {
          pushNewScreen(this.context, screen: Home(), withNavBar: true);
        },
      ),
      // 수정 필요 - 스캔 후 하단 nav 안뜸
      PersistentBottomNavBarItem(
          title: "QR Scan",
          icon: Icon(Icons.qr_code_scanner),
          activeColorPrimary: Colors.blueAccent,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.grey,
          onPressed: (context) {},
          routeAndNavigatorSettings: RouteAndNavigatorSettings(routes: {})),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: "My Info",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      Scaffold(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.blueGrey.shade50,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
          ? 0.0
          : kBottomNavigationBarHeight,
      hideNavigationBarWhenKeyboardShows: true,
      margin: EdgeInsets.all(0.0),
      popActionScreens: PopActionScreensType.all,
      bottomScreenMargin: 0.0,
      selectedTabScreenContext: (BuildContext? context) {
        testContext = context;
      },
      decoration: NavBarDecoration(
          colorBehindNavBar: Colors.indigo,
          borderRadius: BorderRadius.circular(20.0)),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
    ));
  }
}
