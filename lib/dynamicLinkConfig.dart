// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

// Future<void> createDynamicLink({bool short = true}) async {
//   final String DynamicLink = 'https://showmydeals.page.link/offers/';
//   final String Link = 'https://showmydeals.page.link/';
//   FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

//   final DynamicLinkParameters parameters = DynamicLinkParameters(
//     uriPrefix: 'https://showmydeals.page.link/',
//     link: Uri.parse(DynamicLink),
//     longDynamicLink: Uri.parse(DynamicLink),
//     androidParameters: const AndroidParameters(
//       packageName: 'com.fugipie.showmydeals',
//       minimumVersion: 21,
//     ),
//     iosParameters: const IOSParameters(
//       bundleId: 'io.flutter.plugins.firebase.dynamiclinksexample',
//       minimumVersion: '0',
//     ),
//   );

//   Uri url;
//   if (!short) {
//     final ShortDynamicLink shortLink =
//         await dynamicLinks.buildShortLink(parameters);
//     url = shortLink.shortUrl;
//   } else {
//     url = await dynamicLinks.buildLink(parameters);
//   }
//   print(url);
// }
