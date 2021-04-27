import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:van_transport/src/common/style.dart';
import 'package:van_transport/src/pages/home/widget/vertical_store_card.dart';
import 'package:van_transport/src/routes/app_pages.dart';

class DetailsProductGroupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DetailsProductGroupPageState();
}

class _DetailsProductGroupPageState extends State<DetailsProductGroupPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  SlidableController slidableController = new SlidableController();

  @override
  void initState() {
    slidableController = SlidableController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mC,
        elevation: .0,
        centerTitle: true,
        brightness: Brightness.light,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.arrow_left,
            color: colorTitle,
            size: width / 15.0,
          ),
        ),
        title: Text(
          'Shoes',
          style: TextStyle(
            color: colorTitle,
            fontSize: width / 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Feather.edit_3,
              color: colorTitle,
              size: width / 16.0,
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: width / 6.25,
        width: width / 6.25,
        child: FloatingActionButton(
          backgroundColor: colorTitle,
          child: Icon(
            Feather.plus,
            color: colorPrimaryTextOpacity,
            size: width / 16.0,
          ),
          onPressed: () => Get.toNamed(Routes.MERCHANT + Routes.CREATEPRODUCT),
        ),
      ),
      key: _scaffoldKey,
      body: Container(
        color: mC,
        height: height,
        width: width,
        margin: EdgeInsets.only(top: 12.0),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  controller: slidableController,
                  child: GestureDetector(
                    onTap: () =>
                        Get.toNamed(Routes.MERCHANT + Routes.EDITPRODUCT),
                    child: VerticalStoreCard(),
                  ),
                  secondaryActions: <Widget>[
                    GestureDetector(
                      onTap: () => slidableController.activeState.close(),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(12.0, 12.0, 6.0, 18.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: mCD,
                          boxShadow: [
                            BoxShadow(
                                color: mCL,
                                offset: Offset(3, 3),
                                blurRadius: 3,
                                spreadRadius: -3),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Feather.trash_2,
                          color: colorTitle,
                          size: width / 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}