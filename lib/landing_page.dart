import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_movie_app/common_widgets/no_internet_page.dart';
import 'package:my_movie_app/pages/main_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // ConnectivityResult connectivityResult = ConnectivityResult.none;
  //
  // bool hasInternet = false;
  // Future checkConnectionState() async {
  //   setState(() async{
  //     connectivityResult = await (Connectivity().checkConnectivity());
  //   });
  //   print(connectivityResult);
  // }
  var isDeviceConnected = true;

  Future checkConnectionState() async {
    setState(() async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
    });
  }

  @override
  void initState() {
    super.initState();

    //var subscription =

    // InternetConnectionChecker().onStatusChange.listen((status) {
    //   final hasInternet = status == InternetConnectionStatus.connected ? true : false;
    //   setState(() {
    //     isDeviceConnected = hasInternet;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //future: checkConnectionState(),
      //future: Provider.of<ConnectionStateProvider>(context,listen: false).checkConnectionSate(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return Center(child: CircularProgressIndicator());
        // }
        // if (isDeviceConnected == true) {
        //   return MainPage();
        // }
        // return NoInternetPage(
        //   tryAgainOnPressed: () async {
        //     await checkConnectionState();
        //   },
        // );
        return MainPage();
      },
    );
  }
}
