import 'dart:developer';

import 'package:check_project/drawar.dart';
import 'package:check_project/item_Widget.dart';
import 'package:check_project/moddels/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["Products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    log("size is: ${CatalogModel.items.length}");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      // ),
      body: Padding(
          padding: const EdgeInsets.all(16.8),
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? GridView.builder(
            itemCount: CatalogModel.items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                  crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    log("size is: ${CatalogModel.items.length}");
                    final Item = CatalogModel.items[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),

                        child: GridTile(
                          header: Container(
                              child: Text(Item.name, style: TextStyle(color: Colors.white),
                              ),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(color: Colors.deepPurple),
                          ),
                            child: Image.network(Item.image),

                            footer: Container(child: Text(Item.price.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(color:Colors.black),
                            ),
                        )
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: MyDrawer(),
    );
  }
}
