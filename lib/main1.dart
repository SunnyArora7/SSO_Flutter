// import 'dart:developer';
//
// import 'package:aad_oauth/aad_oauth.dart';
// import 'package:aad_oauth/model/config.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// final navigatorKey = GlobalKey<NavigatorState>();
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'AAD OAuth Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'AAD OAuth Home'),
//       navigatorKey: navigatorKey,
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   static final Config config = Config(
//     tenant: '2b55602e-647a-4625-87b8-f2493d349000',
//     clientId: '033c2eff-2d39-4faa-9c97-fc8860915b60',
//     scope: 'openid profile offline_access',
//     navigatorKey: navigatorKey,
//     loader: SizedBox(),
//     appBar: AppBar(
//       title: Text('AAD OAuth Demo'),
//     ),
//     onPageFinished: (String url) {
//       log('onPageFinished: $url');
//     },
//   );
//   final AadOAuth oauth = AadOAuth(config);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: ListView(
//         children: <Widget>[
//           ListTile(
//             title: Text(
//               'AzureAD OAuth',
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.launch),
//             title: Text('Login${kIsWeb ? ' (web popup)' : ''}'),
//             onTap: () {
//               login(false);
//             },
//           ),
//           if (kIsWeb)
//             ListTile(
//               leading: Icon(Icons.launch),
//               title: Text('Login (web redirect)'),
//               onTap: () {
//                 login(true);
//               },
//             ),
//           ListTile(
//             leading: Icon(Icons.data_array),
//             title: Text('HasCachedAccountInformation'),
//             onTap: () => hasCachedAccountInformation(),
//           ),
//           ListTile(
//             leading: Icon(Icons.logout),
//             title: Text('Logout'),
//             onTap: () {
//               logout();
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   void showError(dynamic ex) {
//     showMessage(ex.toString());
//   }
//
//   void showMessage(String text) {
//     var alert = AlertDialog(content: Text(text), actions: <Widget>[
//       TextButton(
//           child: const Text('Ok'),
//           onPressed: () {
//             Navigator.pop(context);
//           })
//     ]);
//     showDialog(context: context, builder: (BuildContext context) => alert);
//   }
//
//   void login(bool redirect) async {
//     config.webUseRedirect = redirect;
//     final result = await oauth.login();
//     result.fold(
//       (l) => showError(l.toString()),
//       (r) => showMessage('Logged in successfully, your access token: $r'),
//     );
//     var accessToken = await oauth.getAccessToken();
//     print(accessToken);
//     print('access token aa gaya');
//     if (accessToken != null) {
//       ScaffoldMessenger.of(context).hideCurrentSnackBar();
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(accessToken)));
//     }
//   }
//
//   void hasCachedAccountInformation() async {
//     var hasCachedAccountInformation = await oauth.hasCachedAccountInformation;
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content:
//             Text('HasCachedAccountInformation: $hasCachedAccountInformation'),
//       ),
//     );
//   }
//
//   void logout() async {
//     await oauth.logout();
//     showMessage('Logged out');
//   }
// }
