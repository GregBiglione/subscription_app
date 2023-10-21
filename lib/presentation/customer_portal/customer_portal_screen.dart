import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../app/constant/constant.dart';

class CustomerPortalScreen extends StatefulWidget {
  final String url;

  const CustomerPortalScreen({super.key, required this.url});

  @override
  State<CustomerPortalScreen> createState() => _CustomerPortalScreenState();
}

class _CustomerPortalScreenState extends State<CustomerPortalScreen> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    controller
      ..loadRequest(Uri.parse(widget.url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress){},
          onWebResourceError: (error) {},
          onNavigationRequest: (request) {
            if(request.url.startsWith(widget.url)) {
              return NavigationDecision.prevent;
            }
            if(request.url.startsWith(cancelUrl)) {
              Navigator.pop(context, cancel);
            }

            return NavigationDecision.navigate;
          },
        ),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: WebViewWidget(controller: controller),
        )
    );
  }
}
