import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String numberCode = '';
  String text = '';
  bool isLoading = false;

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

  void setText(String code) {
    setState(() {
      isLoading = true;
      numberCode = code;
      text = 'This is the Level $code Course';
    });
    Timer tempTimer = Timer(const Duration(seconds: 1), () {});
    tempTimer = Timer(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
      tempTimer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
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
          AspectRatio(
            aspectRatio: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: InteractiveViewer(
                  boundaryMargin: EdgeInsets.all(20.0), // Margin around the widget
                  minScale: 0.5, // Minimum scale factor
                  maxScale: 3.0, // Maximum scale factor
                  child: Container(
                    height: 1080,
                    width: 1080,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/generic_map.png')
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 100, // Specify the top position
                          left: 150, // Specify the left position
                          child: FilledButton(onPressed: () {
                            setText('1');
                          },
                          child: const Text('Level 1')), // Replace with your custom widget
                        ),
                        Positioned(
                          top: 100, // Specify the top position
                          left: 930, // Specify the left position
                          child: FilledButton(onPressed: () {
                            setText('2');
                          },
                          child: const Text('Level 2')), // Replace with your custom widget
                        ),
                        Positioned(
                          top: 930, // Specify the top position
                          left: 150, // Specify the left position
                          child: FilledButton(onPressed: () {
                            setText('3');
                          },
                          child: const Text('Level 3')), // Replace with your custom widget
                        ),
                        Positioned(
                          top: 930, // Specify the top position
                          left: 930, // Specify the left position
                          child: FilledButton(onPressed: () {
                            setText('4');
                          },
                          child: const Text('Level 4')), // Replace with your custom widget
                        ),
                      ],
                    )
                  ),
                )
              )
            )
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        const SizedBox(height: 12),
                        Text('For the this area, the Level $numberCode Course has this Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nisl nunc, commodo quis facilisis feugiat, varius at justo. Maecenas interdum id orci vitae egestas. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque commodo mauris vitae nisl auctor, non ornare velit maximus. Ut non leo condimentum, tincidunt dui sit amet, tristique justo. Integer ultricies nisl massa, eu lacinia orci consectetur in. Quisque eget molestie nunc. Pellentesque quis massa ullamcorper massa ullamcorper pulvinar et quis enim. Maecenas ex leo, laoreet in tristique a, varius at leo. Vestibulum purus magna, egestas et auctor consequat, mattis non ante. Suspendisse potenti. Nulla maximus nec ipsum laoreet finibus. Fusce pellentesque, dui eget porttitor vulputate, velit arcu accumsan urna, nec gravida nunc lacus in nulla.')
                      ],
                    )
                  ),
                ),
                if(isLoading)
                const Center(child: CircularProgressIndicator())
              ],
            )
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
