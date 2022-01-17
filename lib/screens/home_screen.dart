
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data=[];
  Future<String> loadJsonFile ()async{
    var myJsonData = await rootBundle.loadString('assets/json/productslist.json');
    setState(() {
      data=jsonDecode(myJsonData);
    });
    return 'success';
  }
  @override
  void initState() {
    super.initState();
    loadJsonFile();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parse Local JSON'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index){
          return Column(
            children: <Widget>[
              ListTile(
                leading: Image.network(data[index]['imageUrl']),
                title: Text(data[index]['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(data[index]['category']),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tk ${data[index]['price']}'.toString()),
                  ],
                ),
                minVerticalPadding: size.height/25,
                style: ListTileStyle.list,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return  Divider(
            color: Theme.of(context).primaryColor,
            thickness: 1,
            height: size.height/25,
            );
        }, 
      ),
    );
}
}