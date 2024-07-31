<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
Digital Payment Solution
At Kuickpay we enable our customers to present, collect and manage payments through a one window quick, simple and convenient platform.
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

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
),`

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

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.

