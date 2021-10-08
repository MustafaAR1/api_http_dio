import 'package:flutter/material.dart';
import 'package:http_with_dio/models/weatherModels/weather_response.dart';
import 'package:http_with_dio/models/weatherModels/weathermodel.dart';
import 'package:http_with_dio/services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var mysnapshot;
  var mysnapshot2;
  late WeatherResponse response;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //ApiService().getDummy().then((e) {});
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: ApiService().getProducts(),
                builder: (context, snapshot) {
                  mysnapshot = snapshot.data;

                  return snapshot.hasData == true
                      ? ListView.builder(
                          itemCount: mysnapshot.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text(mysnapshot[index].name.toString()),
                                // Text(
                                //   mysnapshot[index].id.toString(),
                                // ),
                                // Text(mysnapshot[index].description.toString())
                              ],
                            );
                          })
                      : Text(snapshot.error.toString());
                }),
          ),
          Expanded(
            child: FutureBuilder(
                future: ApiService().getOpenWeather(),
                builder: (context, snapshot) {
                  mysnapshot2 = snapshot.data;
                  return snapshot.hasData
                      ? Column(
                          children: [
                            Text(mysnapshot2.temperature.temp.toString())
                          ],
                        )
                      : Text(snapshot.error.toString());
                }),
          )
        ],
      ),
      // ElevatedButton(
      //   onPressed: () {
      //     ApiService().getArticle();
      //   },
      //   child: Text("Dio"),
      // )
      // FutureBuilder(
      //     future: ApiService().getDummy(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         mysnapshot = snapshot.data;

      //         return ListView.builder(
      //           itemCount: mysnapshot.length,
      //           itemBuilder: (context, index) {
      //             return Column(
      //               children: [
      //                 Text(mysnapshot[index].title.toString()),
      //                 //        Image.network(mysnapshot[index].image)
      //               ],
      //             );
      //           },
      //         );
      //       }
      //       return Text(snapshot.error.toString());
      //     })
    );
  }
}
