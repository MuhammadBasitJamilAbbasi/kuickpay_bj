<!--
We launched Kuickpay as the nation’s largest online payment solution serving thousands of users, which is facilitating over 500 schools, housing societies, universities, E-commerce portals in Pakistan.
Through Kuickpay, merchants can enjoy a one-in-all solution for all their payment collection woes with dedicated support.

Ecommerce Payments
Looking to receive payments securely for your ecommerce. Look no further than Kuickpay. Kuickpay provides robust and fast payments for your business. Kuickpay can integrate in your system or give you dashboard to monitor real time payments.
--!>
## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

Visit https://kuickpay.com
Get institutionID & kuickpaySecuredKey

## Usage
```dart
`PaymentRedirectionPage(
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
),
```


Here is the Sample Example


```dart
const like = 'sample';
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
```

## Additional information

Support the package 
If you find this package useful, you can support it for free by giving it a thumbs up at the top of this page. Here's another option to support the package:



