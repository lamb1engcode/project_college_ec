import 'package:van_transport/src/app.dart';
import 'package:van_transport/src/common/style.dart';
import 'package:van_transport/src/pages/order/pages/manage_order_page.dart';
import 'package:van_transport/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var _pages = [
    ManageOrderPage(pageName: 'ON_GOING'),
    ManageOrderPage(pageName: 'AWAIT_FOR_CONFIRMATION'),
    ManageOrderPage(pageName: 'CANCEL'),
    ManageOrderPage(pageName: 'RECEIVE'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: mC,
        elevation: 1.85,
        centerTitle: true,
        brightness: Brightness.light,
        leadingWidth: 62.0,
        leading: IconButton(
          onPressed: () {
            if (App.token != '') {
              Get.toNamed(Routes.CREATEORDER);
            } else {
              Get.toNamed(Routes.AUTHENTICATION);
            }
          },
          icon: Icon(
            Feather.plus_square,
            color: colorPrimary,
            size: width / 16.0,
          ),
        ),
        title: Text(
          'myOrders'.trArgs(),
          style: TextStyle(
            color: colorTitle,
            fontSize: width / 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (App.token != '') {
                Get.toNamed(Routes.CART);
              } else {
                Get.toNamed(Routes.AUTHENTICATION);
              }
            },
            icon: Icon(
              Feather.shopping_bag,
              color: colorTitle,
              size: width / 16.0,
            ),
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          labelColor: colorPrimary,
          indicatorColor: colorPrimary,
          unselectedLabelColor: colorTitle.withOpacity(.825),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 1.75,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: width / 28.5,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: width / 28.5,
          ),
          tabs: [
            Container(
              width: width * .185,
              child: Tab(
                text: 'onGoing'.trArgs(),
              ),
            ),
            Container(
              width: Get.locale == Locale('vi', 'VN')
                  ? width * .265
                  : width * .305,
              child: Tab(
                text: 'waitForConfirm'.trArgs(),
              ),
            ),
            Container(
              width: width * .125,
              child: Tab(
                text: 'reject'.trArgs(),
              ),
            ),
            Container(
              width: width * .13,
              child: Tab(
                text: 'history'.trArgs(),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: _pages.map((Widget tab) {
          return tab;
        }).toList(),
      ),
    );
  }
}
