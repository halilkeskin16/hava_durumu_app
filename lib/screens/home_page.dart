import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hava_durumu_app/models/weather_models.dart';
import 'package:hava_durumu_app/services/weather_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeatherModels> _weathers = [];
  void _getweatherData() async {
    _weathers = await WeatherServices().getWeatherData();
    print(_weathers[0]);
    setState(() {});
  }

  @override
  void initState() {
    _getweatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "Haftalık Hava Durumu",
            style: TextStyle(
                fontFamily: "Arima", fontSize: 30, color: Colors.white),
          )),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: _weathers.length,
          itemBuilder: (context, index, realIdx) {
            final WeatherModels weather = _weathers[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(weather.tarih, style: titleStyle()),
                          Image.network(weather.ikon),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            weather.gun,
                            style: titleStyle(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Derece: ${weather.derece}",
                                    style: detailStyle(),
                                  ),
                                  Text("Min ${weather.min}",
                                      style: detailStyle()),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Nem: ${weather.nem}",
                                      style: detailStyle()),
                                  Text("Max ${weather.max}",
                                      style: detailStyle()),
                                ],
                              )
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            );
          },
          options: CarouselOptions(
            height: 800,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }

  TextStyle detailStyle() => TextStyle(fontSize: 20);

  TextStyle titleStyle() => TextStyle(fontSize: 30, color: Colors.white);
}
