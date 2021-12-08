import 'package:evtoelon/screens/info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:evtoelon/widgets/card_view.dart';
import 'package:flutter/services.dart';
import 'models/car.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    final ThemeData theme =  ThemeData();

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/second': (context) => InfoPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Avtoelon',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.blue,
          secondary: Colors.black,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () { },icon: Icon(Icons.menu,size: 26,),),
        actions: [
          Icon(Icons.add_circle_outline_rounded,size: 26,),
          SizedBox(width: 30,),
          Icon(Icons.monetization_on_outlined,size: 26,),
          SizedBox(width: 30,),
          Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.search,size: 30)),




        ],
        title: const Text("Avtoelon",style: TextStyle(fontSize: 25),),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: Car.cars.length,
            itemBuilder: (BuildContext context,int index){
              return cardView(context,Car.cars[index]);
            }),
      ),
    );
  }
}

