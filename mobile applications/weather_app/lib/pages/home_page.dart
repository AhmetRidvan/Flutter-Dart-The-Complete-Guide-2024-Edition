import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeatherModel> gelenler = [];

  cagir() async {
    gelenler = await WeatherService().getWeatherData();
    setState(() {});
  }

  @override
  void initState() {
    cagir();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
        itemCount: gelenler.length,
        itemBuilder: (context, index) {
          var x = gelenler[index];
          return Container(
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(222))),
            margin: EdgeInsets.all(22),
            padding: EdgeInsets.all(22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  x.icon,
                  width: 80,
                ),
                Padding(
                  padding: EdgeInsets.all(22),
                  child: Column(
                    children: [
                      Text(
                        x.day,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(x.durum),
                      Text(x.gece),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
