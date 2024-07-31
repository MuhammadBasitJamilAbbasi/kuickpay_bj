import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Model/Authmodel.dart';

class PaymentRedirectionPage extends StatefulWidget {
  final String institutionID;
  final String kuickpaySecuredKey;
  final String orderID;
  final String amount;
  final String customerMobileNumber;
  final String customerEmail;
  final String successUrl;
  final String failureUrl;
  final String? customername;
  final String? cnic;
  final String? orderdate_YYYY_MM_DD;
  final String? TaxAmount;
  final String? discount;
  final String? checkouturl;





  PaymentRedirectionPage({
    required this.institutionID,
    required this.kuickpaySecuredKey,
    required this.orderID,
    required this.amount,
    required this.customername,
    required this.customerMobileNumber,
    required this.customerEmail,
    required this.successUrl,
    required this.failureUrl,
    required this.checkouturl,
    required this.orderdate_YYYY_MM_DD,
    this.TaxAmount,
    this.discount,
    this.cnic



  });

  @override
  _PaymentRedirectionPageState createState() => _PaymentRedirectionPageState();
}

class _PaymentRedirectionPageState extends State<PaymentRedirectionPage> {
  late WebViewController _controller;
  String _authToken = '';
  late Dio _dio = Dio();

 // InAppWebViewController? webViewController;

  late String _checkoutUrl;
  late String _signature;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
    _fetchAuthToken();
  }

  Future<void> _initializeWebView() async {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)

      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            if (url.contains(widget.successUrl)) {
             Navigator.of(context).pop('Payment Successful');

            } else if (url.contains(widget.failureUrl)) {
              Navigator.of(context).pop('Payment Failed');
            }
          },
        ),

      );
  }

  Future<void> _fetchAuthToken() async {
    try {
      final token = await getAuthToken(widget.institutionID, widget.kuickpaySecuredKey);
      setState(() {
        _authToken = token; // Use today's date as OrderDate
        _checkoutUrl = 'https://your-checkout-url.com'; // Replace with actual checkout URL
        _signature = _generateSignature(); // Generate signature based on fields
      });
      print("token");
      _redirectToPayment();
    } catch (e) {
      print('Error fetching auth token: $e');
    }
  }

  Future<String> getAuthToken(String institutionID,
      String kuickpaySecuredKey)
  async {
    final response = await _dio.post(
      'https://testcheckout.kuickpay.com/api/KPToken',
      data: {
        'institutionID': institutionID,
        'kuickpaySecuredKey': kuickpaySecuredKey,
      },
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    if (response.statusCode == 200) {
      AuthResponse authResponse = AuthResponse.fromJson(response.data);
      return authResponse.authToken;
    } else {
      throw Exception('Failed to fetch auth token');
    }
  }

  String _generateSignature() {
   // MD5(InstitutionID + OrderID + Amount + KuickpaySecuredKey
   // MD5(OrderID&TransactionID&KuickpaySecuredKey&ResponseCode
    final data = '${widget.institutionID}${widget.orderID}${widget.amount}${widget.kuickpaySecuredKey}';
    final bytes = utf8.encode(data);
    final digest = md5.convert(bytes);
   // print("sign "+digest.toString());
    return digest.toString();
  }

  Future<void> _redirectToPayment() async {
    final Map<String, dynamic> formData = {
      'institutionID': widget.institutionID, // Replace with actual Institution ID
      'orderID': widget.orderID, // Replace with actual Order ID
      'MerchantName':widget.customername, // Replace with actual Merchant Name
      'amount': widget.amount, // Replace with actual Amount
      'TransactionDescription': 'abc', // Replace with actual Transaction Description
      'customerMobileNumber': widget.customerMobileNumber, // Replace with actual Customer Mobile Number
      'customerEmail': widget.customerEmail, // Replace with actual Customer Email
      'successUrl': widget.successUrl, // Replace with actual Success URL
      'failureUrl':widget.failureUrl, // Replace with actual Failure URL
      'OrderDate': widget.orderdate_YYYY_MM_DD, // Replace with actual Order Date if dynamic
      'CheckoutUrl': widget.checkouturl, // Replace with actual Checkout URL
      'Token': _authToken,
      'Signature':_signature, // Replace with actual Signature
      'GrossAmount': widget.amount, // Replace with actual Gross Amount
      'TaxAmount': widget.TaxAmount, // Replace with actual Tax Amount if any
      'Discount': widget.discount, // Replace with 0 or 1 as applicable
      'nic': widget.cnic, // Replace with actual NIC if required
    };


    final formInputs = formData.entries
        .map((entry) => '<input type="hidden" name="${entry.key}" value="${entry.value}">')
        .join();
    final htmlString = '''
      <html>
       <meta charset="UTF-8">
       <body onload="document.forms[0].submit()">
          <form method="POST" action="https://testcheckout.kuickpay.com/api/Redirection" 
          enctype="application/x-www-form-urlencoded">
            ${formInputs.toString()}
          </form>
        </body>
      </html>
    ''';

    _controller.loadHtmlString(
     htmlString
    );




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}
