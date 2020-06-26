import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/HomeScreen/HomeScreen.dart';
import 'package:rtiggers/MedicalActiveOrders/medical_active_orders_utility.dart';


import 'package:rtiggers/active_order_home.dart';
import 'package:rtiggers/colors.dart';




class MedicalOrder extends StatefulWidget {
  @override
  _MedicalOrderState createState() => _MedicalOrderState();
}

class _MedicalOrderState extends State<MedicalOrder>
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
      appBar: PreferredSize(child: getTabBar(), preferredSize: Size.fromHeight(100.0)),
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
                  child: Text('Inactive', style: TextStyle(color: Colors.white)),
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
        SizedBox(height: 6.0,),
        Text('Active Medical Orders', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold, fontSize: 17.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton( onPressed: (){
              
              Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: new Text('New Order', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold),)),
            FlatButton(
              onPressed: () {
                
                Navigator.push(context,  MaterialPageRoute(builder: (context) => ActiveOrderHelper()));
              },
              child: new Text('Active Order', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold),)),
            FlatButton(
              onPressed: (){
                Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => MedicalOrdersHelper()));
              },
              child: new Text('Past Order', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold),)),
          ],
        ),
      ],
    );
  }

  getBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 10,
        child: Card(
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}


