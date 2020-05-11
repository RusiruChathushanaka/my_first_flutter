import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
//      SplashScreen.navigate(
//        name: 'intro.flr',
//        next: (context) => MyHomePage(title: 'Flutter Demo Home Page'),
//        until: () => Future.delayed(Duration(seconds: 5)),
//        startAnimation: '1',
//      ),

          MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Color> _colors = [Colors.deepPurple, Colors.purple];
  List<Color> _colors2 = [Colors.green, Colors.lightGreen];

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.green,

        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.green,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.account_circle, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),

        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Drawer Header"),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: _colors),
                ),
              ),
              Column(
                children: <Widget>[
                  ListTile(
                    title: Text("item 1"),
                    leading: Icon(Icons.print),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Back"),
                    leading: Icon(Icons.arrow_back),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              ),
              Tab(
                icon: Icon(Icons.directions_bus),
              )
            ],
          ),
          title: Text(widget.title),
          backgroundColor: Colors.deepPurple,
        ),
        body:
//        Center(
//          child:
//          Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text(
//                'You have pushed the button this many times:',
//              ),
//              Text(
//                '$_counter',
//                style: Theme.of(context).textTheme.display1,
//              ),
            Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: _colors2),
          ),
          child: TabBarView(
            children: <Widget>[
              Center(child: Text("Hello World")),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bus),
            ],
          ),
        ),
//            ],
      ),
    );
//        floatingActionButton: FloatingActionButton(
//          onPressed: _incrementCounter,
//          tooltip: 'Increment',
//          child: Icon(Icons.add),
//        ), // This trailing comma makes auto-formatting nicer for build methods.
  }
}
