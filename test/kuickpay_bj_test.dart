import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kuickpay_bj/kuickpay_bj.dart';

void main() {

  runApp(KuickpayApp());
}


class KuickpayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuickpay Integration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kuickpay Integration')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {

            Navigator.of(context).pushReplacement(
                MaterialPageRoute(
              builder: (BuildContext context) =>PaymentRedirectionPage(
                institutionID: '',
                kuickpaySecuredKey: '',
                orderID: '',
                amount: '',
                customername: '',
                customerMobileNumber: '',
                customerEmail: '',
                successUrl: '',
                failureUrl: '',
                checkouturl: '',
                orderdate_YYYY_MM_DD: '',
              ),));
          },
          child: Text('Pay Now'),
        ),
      ),
    );
  }
}
