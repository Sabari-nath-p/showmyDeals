import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:show_my_deals/Screens/HomeScreen/service/HomeController.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  bool loadError = false;
  HomeController ctrl = Get.put(HomeController());
  // final controller = WebViewController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadWeb();
  }

  loadWeb() {
    // controller.setBackgroundColor(const Color(0x00000000));
    // controller.setNavigationDelegate(
    //   NavigationDelegate(
    //     onProgress: (int progress) {
    //       // Update loading bar.
    //     },
    //     onPageStarted: (String url) {},
    //     onPageFinished: (String url) {
    //       rctrl.refreshCompleted();

    //       print("page finished");
    //     },
    //     onWebResourceError: (WebResourceError error) {
    //       setState(() {
    //         //rctrl.loadComplete();
    //         loadError = true;
    //       });
    //     },
    //     onNavigationRequest: (NavigationRequest request) {
    //       if (request.url.startsWith('http://www.showmydeals.in/feeds')) {
    //         return NavigationDecision.prevent;
    //       }
    //       return NavigationDecision.navigate;
    //     },
    //   ),
    // );
    // controller.loadRequest(Uri.parse('http://www.showmydeals.in/feeds'));
    setState(() {
      loadError = false;
    });
  }

  RefreshController rctrl = RefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (loadError)
            ? Center(
                child: SmartRefresher(
                  controller: rctrl,
                  onRefresh: () {
                    loadWeb();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LottieBuilder.asset(
                          "lib/Base/Assets/Images/No_internet.json"),
                      Text(
                        "No Internet Connection",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            loadError = false;
                          });
                        },
                        child: Text(
                          "click here to retry",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400, fontSize: 10.sp),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : InAppWebView(
                onReceivedError: (controller, request, error) {
                  setState(() {
                    //rctrl.loadComplete();
                    print(error);
                    loadError = true;
                  });
                },
                initialUrlRequest:
                    URLRequest(url: WebUri("https://www.showmydeals.in/feeds")),
              )
        // WebViewWidget(
        //     controller: controller,
        //   ),
        );
  }
}
