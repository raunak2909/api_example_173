import 'dart:convert';

import 'package:api_example_173/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataModel? dataModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes'),
      ),
      body: dataModel !=null && dataModel!.quotes.isNotEmpty? ListView.builder(
        itemCount: dataModel!.quotes.length,
          itemBuilder: (_, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 7,
              child: ListTile(
                title: Text(dataModel!.quotes[index].quote),
                subtitle: Text(dataModel!.quotes[index].author),
              ),
            ),
          );
      }) : Container(
        child: Center(child: Text('No Quotes..'),),
      ),
    );
  }

  void getQuotes() async{

    var uri = Uri.parse("https://dummyjson.com/quotes");
    
    var response = await httpClient.get(uri);

    print("code: ${response.statusCode}");
    print("body: ${response.body}");

    if(response.statusCode==200){
      var mData = jsonDecode(response.body);
      dataModel = DataModel.fromJson(mData);
      setState(() {

      });
      print(dataModel);
    }


  }
}
