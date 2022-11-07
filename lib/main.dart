import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// modified
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyBnZn7aPlUK4BtrHmRyFWbO6ztlLz88OLI",
      authDomain: "init-62754.firebaseapp.com",
      databaseURL: "https://init-62754-default-rtdb.firebaseio.com",
      projectId: "init-62754",
      storageBucket: "init-62754.appspot.com",
      messagingSenderId: "33941724300",
      appId: "1:33941724300:web:0647ee4ee651fd2f5a2fa9",
      measurementId: "G-6XHJWVV2C3",
    ));
  } else {
    await Firebase.initializeApp();
  }
  String? key = await FirebaseMessaging.instance.getToken();
  print(key);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: MyAppMain(),
        debugShowCheckedModeBanner: false,
      );
}

class MyAppMain extends StatefulWidget {
  const MyAppMain({super.key});

  @override
  State<MyAppMain> createState() => _MyAppMainState();
}

class _MyAppMainState extends State<MyAppMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('data in out'),
      ),
    );
  }
}







// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:precursorapp/PushNotifications.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   if (kIsWeb) {
//     await Firebase.initializeApp(
//         options: const FirebaseOptions(
//             apiKey: "AIzaSyBnZn7aPlUK4BtrHmRyFWbO6ztlLz88OLI",
//             authDomain: "init-62754.firebaseapp.com",
//             databaseURL: "https://init-62754-default-rtdb.firebaseio.com",
//             projectId: "init-62754",
//             storageBucket: "init-62754.appspot.com",
//             messagingSenderId: "33941724300",
//             appId: "1:33941724300:web:0647ee4ee651fd2f5a2fa9",
//             measurementId: "G-6XHJWVV2C3"));
//   } else {
//     await Firebase.initializeApp();
//   }

//   String? keyMessaging = await FirebaseMessaging.instance.getToken();
//   print(keyMessaging);

//   // WidgetsFlutterBinding.ensureInitialized();
//   // Stripe.publishableKey =
//   //     'pk_test_51LvdahEj4fmcjwk9mRIN17yLMBNAQHbHOkmzI8yJXyJfBP0S0yOHXc6cUhPIHcB7qRsMHdg2mcbltOAFHbIB425k00KPwRSLvy';
//   runApp(const PushNotifications());
// }

// // class Precursor extends StatelessWidget {
// //   const Precursor({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) => const MaterialApp(
// //         home: PrecursorMain(),
// //         debugShowCheckedModeBanner: false,
// //       );
// // }

// // class PrecursorMain extends StatefulWidget {
// //   const PrecursorMain({Key? key}) : super(key: key);

// //   @override
// //   State<PrecursorMain> createState() => _PrecursorMainState();
// // }

// // class _PrecursorMainState extends State<PrecursorMain> {
// //   Map<String, dynamic>? paymentIntent;

// //   @override
// //   void initState() {
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     size = MediaQuery.of(context).size;
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Stripe Payment'),
// //       ),
// //       body: Center(
// //         child: TextButton(
// //           child: const Text('Make Payment'),
// //           onPressed: () async {
// //             await makePayment();
// //           },
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> makePayment() async {
// //     try {
// //       paymentIntent = await createPaymentIntent('10', 'USD');
// //       //Payment Sheet
// //       await Stripe.instance
// //           .initPaymentSheet(
// //               paymentSheetParameters: SetupPaymentSheetParameters(
// //                   paymentIntentClientSecret: paymentIntent!['client_secret'],
// //                   // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
// //                   // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
// //                   style: ThemeMode.dark,
// //                   merchantDisplayName: 'Adnan'))
// //           .then((value) {});

// //       ///now finally display payment sheeet
// //       displayPaymentSheet();
// //     } catch (e, s) {
// //       print('exception:$e$s');
// //     }
// //   }

// //   displayPaymentSheet() async {
// //     try {
// //       await Stripe.instance.presentPaymentSheet().then((value) {
// //         showDialog(
// //             context: context,
// //             builder: (_) => AlertDialog(
// //                   content: Column(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       Row(
// //                         children: const [
// //                           Icon(
// //                             Icons.check_circle,
// //                             color: Colors.green,
// //                           ),
// //                           Text("Payment Successfull"),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ));
// //         // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

// //         paymentIntent = null;
// //       }).onError((error, stackTrace) {
// //         print('Error is:--->$error $stackTrace');
// //       });
// //     } on StripeException catch (e) {
// //       print('Error is:---> $e');
// //       showDialog(
// //           context: context,
// //           builder: (_) => const AlertDialog(
// //                 content: Text("Cancelled "),
// //               ));
// //     } catch (e) {
// //       print('$e');
// //     }
// //   }

// //   //  Future<Map<String, dynamic>>
// //   createPaymentIntent(String amount, String currency) async {
// //     try {
// //       Map<String, dynamic> body = {
// //         'amount': calculateAmount(amount),
// //         'currency': currency,
// //         'payment_method_types[]': 'card'
// //       };

// //       var response = await http.post(
// //         Uri.parse('https://api.stripe.com/v1/payment_intents'),
// //         headers: {
// //           'Authorization':
// //               'Bearer sk_test_51LvdahEj4fmcjwk9DSLEG10B5ulpxyKix7dipXlDSLLUqqMprhaRoragavNXmTFGV22LnWDbIFHuZwc7eIfYVJnt00eA0odXPf',
// //           'Content-Type': 'application/x-www-form-urlencoded'
// //         },
// //         body: body,
// //       );
// //       // ignore: avoid_print
// //       print('Payment Intent Body->>> ${response.body.toString()}');
// //       return jsonDecode(response.body);
// //     } catch (err) {
// //       // ignore: avoid_print
// //       print('err charging user: ${err.toString()}');
// //     }
// //   }

// //   calculateAmount(String amount) {
// //     final calculatedAmout = (int.parse(amount)) * 100;
// //     return calculatedAmout.toString();
// //   }
// // }





// <!DOCTYPE html>
// <html>

// <head>
//   <!--
//     If you are serving your web app in a path other than the root, change the
//     href value below to reflect the base path you are serving from.

//     The path provided below has to start and end with a slash "/" in order for
//     it to work correctly.

//     For more details:
//     * https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base

//     This is a placeholder for base href that will be replaced by the value of
//     the `--base-href` argument provided to `flutter build`.
//   -->
//   <base href="$FLUTTER_BASE_HREF">

//   <meta charset="UTF-8">
//   <meta content="IE=Edge" http-equiv="X-UA-Compatible">
//   <meta name="description" content="A new Flutter project.">

//   <!-- iOS meta tags & icons -->
//   <meta name="apple-mobile-web-app-capable" content="yes">
//   <meta name="apple-mobile-web-app-status-bar-style" content="black">
//   <meta name="apple-mobile-web-app-title" content="messagingapp">
//   <link rel="apple-touch-icon" href="icons/Icon-192.png">

//   <!-- Favicon -->
//   <link rel="icon" type="image/png" href="favicon.png" />
//   <script src="https://www.gstatic.com/firebasejs/9.12.1/firebase-app.js"></script>
//   <script src="https://www.gstatic.com/firebasejs/9.12.1/firebase-messaging.js"></script>
//   <title>messagingapp</title>
//   <link rel="manifest" href="manifest.json">

//   <script>
//     // The value below is injected by flutter build, do not touch.
//     var serviceWorkerVersion = null;
//   </script>
//   <!-- This script adds the flutter initialization JS code -->
//   <script src="flutter.js" defer></script>

//   <script>
//       const firebaseConfig = {
//           apiKey: "AIzaSyBnZn7aPlUK4BtrHmRyFWbO6ztlLz88OLI",
//           authDomain: "init-62754.firebaseapp.com",
//           databaseURL: "https://init-62754-default-rtdb.firebaseio.com",
//           projectId: "init-62754",
//           storageBucket: "init-62754.appspot.com",
//           messagingSenderId: "33941724300",
//           appId: "1:33941724300:web:0647ee4ee651fd2f5a2fa9",
//           measurementId: "G-6XHJWVV2C3"
//         };
//     firebase.initializeApp(firebaseConfig);
    

//   </script>


// </head>

// <body>




//   <script>

//     window.addEventListener('load', function (ev) {







//       // Initialize Firebase
//       if ('serviceWorker' in navigator) {
//         navigator.serviceWorker.register('firebase-messaging-sw.js');
//       }

//       // Download main.dart.js
//       _flutter.loader.loadEntrypoint({
//         serviceWorker: {
//           serviceWorkerVersion: serviceWorkerVersion,
//         }
//       }).then(function (engineInitializer) {
//         return engineInitializer.initializeEngine();
//       }).then(function (appRunner) {
//         return appRunner.runApp();
//       });









//     });
//   </script>





// </body>

// </html>