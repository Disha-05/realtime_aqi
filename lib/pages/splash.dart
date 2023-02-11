import 'package:realtime_aqi/pages/aqi-home.dart';
import 'package:realtime_aqi/features/aqi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  getLocationData() async {
    AqiModel aqiModel = AqiModel();
    var aqiData = await aqiModel.getLocationAQI();
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AQIPage(locationAqi: aqiData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 58, 19, 196),
      body: Center(
          child: SpinKitChasingDots(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
