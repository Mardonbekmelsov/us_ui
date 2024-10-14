import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatelessWidget {
  static const String telegramUrl = 'https://t.me/ustudykazakhstan';
  static const String whatsappUrl = 'https://wa.me/77001400505';
  static const String emailUrl = 'mailto:info@ustudy.kz';
  static const String phoneUrl = 'tel:+77001400505';

  static const String googleMapUrl = '''
    <!DOCTYPE html>
    <html>
    <head>
      <meta name="viewport" content="initial-scale=1.0, width=device-width" />
      <style>
        body, html {
          margin: 0;
          padding: 0;
          height: 100%;
          overflow: hidden;
        }
        iframe {
          border: none;
          height: 100%;
          width: 100%;
        }
      </style>
    </head>
    <body>
     <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d20036.479270416035!2d71.4154021!3d51.1165795!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4245843caa221dff%3A0x34e974e3604f916b!2zODA0LCDRg9C7LiDQkNC70LzQsNGC0YsgNywg0JDRgdGC0LDQvdCwIDAyMDAwMA!5e0!3m2!1sru!2skz!4v1728821707908!5m2!1sru!2skz" allowfullscreen="" loading="lazy"></iframe>
    </body>
    </html>
  ''';

  final webController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.dataFromString(
        googleMapUrl,
        mimeType: 'text/html'));

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Контакты',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Row(
              children: [
                SvgPicture.asset('assets/icons/phone.svg'),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _launchUrl(phoneUrl),
                  child: Text('+7 (700) 140 05 05',
                      style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SvgPicture.asset('assets/icons/location.svg'),
                SizedBox(width: 10),
                Text('г. Астана, ул. Алматы, 7, офис 804',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SvgPicture.asset('assets/icons/mail.svg'),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _launchUrl(emailUrl),
                  child: Text('info@ustudy.kz', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SvgPicture.asset('assets/icons/telegram.svg'),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _launchUrl(telegramUrl),
                  child: Text('Напишите нам в Telegram',
                      style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SvgPicture.asset('assets/icons/whatsapp.svg'),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _launchUrl(whatsappUrl),
                  child: Text('Напишите нам в WhatsApp',
                      style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 300,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: WebViewWidget(
                controller: webController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
