import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/colors.dart';

import 'ActiveOrders.dart';
import 'new_order.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  TabController tabView;
  @override
  void initState() {
    tabView = TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Welcome Name",
          style: TextStyle(color: blueColor),
        ),
        elevation: 0,
        bottom: getTabBar(),
      ),
      body: Column(
        children: [
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.4,
              width: MediaQuery.of(context).size.width - 50.0,
              child: getBody(),
            ),
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
                  child: Text('Inctive', style: TextStyle(color: Colors.white)),
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
    return TabBar(
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.blue[100]),
      //indicatorColor: Colors.black,
      controller: tabView,
      tabs: [
        Tab(
          icon: getTabHeader("New Order"),
        ),
        Tab(
          icon: getTabHeader("Active Order"),
        ),
        Tab(
          icon: getTabHeader("Past Order"),
        )
      ],
    );
  }

  getBody() {
    return TabBarView(
      controller: tabView,
      children: [
        NewOrder(),
        ActiveOrder(),
        Text("3"),
      ],
    );
  }

  getTabHeader(String field) {
    return Text(
      field,
      style: TextStyle(
          color: blueColor, fontWeight: FontWeight.bold, fontSize: 14),
    );
  }
}
