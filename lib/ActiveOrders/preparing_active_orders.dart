import 'package:flutter/material.dart';
import 'package:rtiggers/colors.dart';

class PreparingActiveOrders extends StatefulWidget {
  @override
  _PreparingActiveOrdersState createState() => _PreparingActiveOrdersState();
}

class _PreparingActiveOrdersState extends State<PreparingActiveOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  getBody() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.5,
        child: Card(
          elevation: 8.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
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
                      IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: new BoxDecoration(
                          color: brownColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.all(5),
                        height: 35.0,
                        width: 125.0,
                        child: FlatButton(
                            onPressed: () {},
                            child: Text(
                              "Preparing",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    Text('Name of the person \n\t\t\t\t 1st Order',
                        style: TextStyle(fontSize: 12.0)),
                  ],
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
                  child: Row(
                    children: [
                      Text('Total Bill: Rs. Amount \t\t',
                          style: TextStyle(fontSize: 13.0)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: new BoxDecoration(
                            color: brownColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          // padding: EdgeInsets.all(5),
                          height: 22.0,
                          width: 55.0,
                          child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Paid",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset('assets/1.png'),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name of Delivery Boy is arriving in 3 mins',
                              style: TextStyle(fontSize: 12.0)),
                          Text(
                            'OTP : 7361',
                            style: TextStyle(
                                color: blueColor, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        child: Image.asset('assets/2.png'),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Center(
                    child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: Container(
                        height: 40.0,
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.blue[200],
                          valueColor: AlwaysStoppedAnimation<Color>(blueColor),
                          value: 0.7,
                        ),
                      ),
                    ),
                    Positioned(
                     top: 10.0,
                     left: MediaQuery.of(context).size.width / 7.5,
                      child: Text('Order Ready (09:00)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17.0)))
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
