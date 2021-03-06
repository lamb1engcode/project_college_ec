import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_transport/src/common/style.dart';
import 'package:van_transport/src/pages/order/controllers/cart_client_controller.dart';

class BottomProductType extends StatefulWidget {
  final List<String> values;
  BottomProductType({this.values});
  @override
  State<StatefulWidget> createState() => _BottomProductTypeState();
}

class _BottomProductTypeState extends State<BottomProductType> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: mC,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            20.0,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 12.5),
            Container(
              height: 4.0,
              margin: EdgeInsets.symmetric(horizontal: _size.width * .35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: mCD,
                boxShadow: [
                  BoxShadow(
                    color: mCD,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 2.0,
                  ),
                  BoxShadow(
                    color: mCL,
                    offset: Offset(-1.0, -1.0),
                    blurRadius: 1.0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            _buildAction(context, widget.values[0], 0),
            Divider(
              color: mCH,
              thickness: .2,
              height: .2,
              indent: 12.0,
              endIndent: 12.0,
            ),
            _buildAction(context, widget.values[1], 1),
            Divider(
              color: mCH,
              thickness: .2,
              height: .2,
              indent: 12.0,
              endIndent: 12.0,
            ),
            _buildAction(context, widget.values[2], 2),
            SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }

  Widget _buildAction(context, title, index) {
    final _size = MediaQuery.of(context).size;
    final cartController = Get.put(CartClientController());

    return GestureDetector(
      onTap: () => cartController.setTypeProduct(index),
      child: Container(
        width: _size.width,
        color: mC,
        padding: EdgeInsets.fromLTRB(24.0, 15.0, 20.0, 15.0),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: _size.width / 24.0,
            color: colorDarkGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
