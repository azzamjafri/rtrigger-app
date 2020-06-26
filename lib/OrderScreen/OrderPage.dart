import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/MedicalActiveOrders/medical_active_orders_utility.dart';

import 'package:rtiggers/PastOrder/past_order_utility.dart';
import 'package:rtiggers/active_order_home.dart';
import 'package:rtiggers/colors.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  TabController tabView;

  static const IconData attachment_icon =
      IconData(0xe2bc, fontFamily: 'MaterialIcons');
  @override
  void initState() {
    tabView = TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: getTabBar(), preferredSize: Size.fromHeight(100.0)),
      body: Column(
        children: [
          SafeArea(
            child: Container(
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width - 50.0,
                child: SingleChildScrollView(
                  child: getBody(),
                )),
          ),
          Row(
            children: [
              Container(
                height: 45.0,
                width: (MediaQuery.of(context).size.width - 52.0) / 2,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Active', style: TextStyle(color: Colors.white)),
                  color: brownColor,
                ),
              ),
              Container(
                height: 45.0,
                decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Theme.of(context).dividerColor,
                        width: 2.0,
                      ),
                    ),
                    color: Colors.black),
                child: Text(''),
              ),
              Container(
                height: 45.0,
                width: (MediaQuery.of(context).size.width - 52.0) / 2,
                child: FlatButton(
                  onPressed: () {},
                  child:
                      Text('Inactive', style: TextStyle(color: Colors.white)),
                  color: brownColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  getTabBar() {
    return Column(
      children: [
        SizedBox(
          height: 6.0,
        ),
        Text('New Orders',
            style: TextStyle(
                color: blueColor, fontWeight: FontWeight.bold, fontSize: 17.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                onPressed: () {
                  // Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => OrderPage()));
                },
                child: new Text(
                  'New Order',
                  style:
                      TextStyle(color: blueColor, fontWeight: FontWeight.bold),
                )),
            FlatButton(
                onPressed: () {},
                child: new Text(
                  'Active Order',
                  style:
                      TextStyle(color: blueColor, fontWeight: FontWeight.bold),
                )),
            FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PastOrderHelper()));
                },
                child: new Text( 'Past Order', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold),)
                ),
          ],
        ),
      ],
    );
  }

  getBody() {
    return Column(
      children: [
        getOrders(),


        getMedicalOrder(),
      ],
    );
  }

  getMedicalOrder() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.99,
        child: Card(
          elevation: 6.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text("1 Order #106", style: TextStyle(fontSize: 13.0)),
                    Spacer(),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(context);
                          },
                          icon: Icon(attachment_icon),
                        ),
                        Text("View Attachment",
                            style: TextStyle(fontSize: 12.0)),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    'Name of the person \t\t\t\t 1st Order',
                    style: TextStyle(fontSize: 13.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.red)),
                        padding: EdgeInsets.all(5),
                        height: 35.0,
                        width: 90.0,
                        child: Center(
                            child: Text(
                          "Reject",
                          style: TextStyle(color: Colors.red),
                        )),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                            child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(18.0),
                              child: Container(
                                height: 35.0,
                                width: 110.0,
                                child: LinearProgressIndicator(
                                  backgroundColor: Colors.green[200],
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(greenColor),
                                  value: 0.7,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 10.0,
                                left: 15.0,
                                child: GestureDetector(
                                  onTap: () {
                                    print('asdsad');
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalActiveOrders()));
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalOrdersHelper()));
                                  },
                                  child: Text('Accept (00:30)',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0)),
                                ))
                          ],
                        ))),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getOrders() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.05,
        child: Card(
          elevation: 6.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "ID: 171111111111111",
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Spacer(),
                      Text(
                        'Time',
                        style: TextStyle(fontSize: 14.0),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text('Name of the person \t\t\t\t 1st Order'),
                ),
                Text(
                  'Total Bill : Rs. amount',
                  style: TextStyle(color: Colors.white),
                ),
                Text('1 Chicken Egg Dosa ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: blueColor,
                        fontSize: 16.0)),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 18.0, 18.0, 18.0),
                  child: Text('Set food preparation time'),
                ),
                Center(
                  child: Container(
                    height: 35.0,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              '10 mins',
                              style: TextStyle(color: Colors.white),
                            )),
                        IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.red)),
                        padding: EdgeInsets.all(5),
                        height: 35.0,
                        width: 90.0,
                        child: Center(
                            child: Text(
                          "Reject",
                          style: TextStyle(color: Colors.red),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: new BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.all(5),
                        height: 35.0,
                        width: 125.0,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ActiveOrderHelper()));
                            },
                            child: Text(
                              "Accept(00:30)",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.0),
                            )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 500,
            child: SizedBox.expand(
                child: Material(
                    type: MaterialType.transparency, child: FlutterLogo())),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}
