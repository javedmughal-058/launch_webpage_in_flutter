import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('https://africaexchange.cash/admin/cnetpay/cnetpay.php?user_id=25&receiver_country=Ivory-XOF&amount=300&fee=100&total_pay=400&receiver_f_name=Sarem&receiver_l_name=Iftikhar&receiver_email=sarimiftikhar@gmail.com&receiver_phone=03361149673&currency_type=XAF&status=0&transaction_id=29797053');
    Future<void> _launchUrl() async {
      if (await launchUrl(_url)) {
        // openBrowserUrl
        // throw 'Could not launch $_url';
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Web Launch')),
        body: UpgradeAlert(
          upgrader: Upgrader(
            dialogStyle: UpgradeDialogStyle.material
          ),
          child: Center(
            child: Container(
              margin: EdgeInsets.all(40),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            // maximumSize: MediaQuery.of(context).size.width,
                            primary: Colors.white, //background color of button
                            side: BorderSide(width:3, color:Colors.green), //border width and color
                            elevation: 3, //elevation of button
                            padding: EdgeInsets.all(20) //content padding inside button
                        ),
                        onPressed: (){
                           String _url = 'https://africaexchange.cash/admin/cnetpay/cnetpay.php?user_id=25&receiver_country=Ivory-XOF&amount=300&fee=100&total_pay=400&receiver_f_name=Sarem&receiver_l_name=Iftikhar&receiver_email=sarimiftikhar@gmail.com&receiver_phone=03361149673&currency_type=XAF&status=0&transaction_id=29797053';
                          openBrowserUrl(url : _url, inApp: false);

                        },
                        child: const Text('View')),
                  ),
                  Link(
                    target: LinkTarget.self,
                    uri: Uri.parse('https://africaexchange.cash/admin/cnetpay/cnetpay.php?user_id=25&receiver_country=Ivory-XOF&amount=300&fee=100&total_pay=400&receiver_f_name=Sarem&receiver_l_name=Iftikhar&receiver_email=sarimiftikhar@gmail.com&receiver_phone=03361149673&currency_type=XAF&status=0&transaction_id=29797053'),
                    builder: (context, followLink)=> ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // maximumSize: MediaQuery.of(context).size.width,
                            primary: Colors.white, //background color of button
                            side: BorderSide(width:3, color:Colors.green), //border width and color
                            elevation: 3, //elevation of button
                            padding: EdgeInsets.all(20) //content padding inside button
                        ),
                        onPressed: followLink,
                          // String _url = 'https://africaexchange.cash/admin/cnetpay/cnetpay.php?user_id=25&receiver_country=Ivory-XOF&amount=300&fee=100&total_pay=400&receiver_f_name=Sarem&receiver_l_name=Iftikhar&receiver_email=sarimiftikhar@gmail.com&receiver_phone=03361149673&currency_type=XAF&status=0&transaction_id=29797053';
                          // openBrowserUrl(url : _url, inApp: false);


                        child: const Text('View')),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
  Future<void> openBrowserUrl({required String url, bool inApp =false,})async {
        if(await canLaunchUrl(Uri.parse(url))){
          await launch(url, forceSafariVC: inApp, forceWebView: inApp, enableJavaScript: true);
        }
  }
}

