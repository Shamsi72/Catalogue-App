import 'package:check_project/home_page_detail.dart';
import 'package:check_project/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalog_image.dart';

import 'moddels/catalog.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context,index) {
          final catalog = CatalogModel.getByPosition(index);
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>homePageDetails(
                    catalog: catalog),
            ),) ,
              child: CatalogItem(catalog: catalog));
        }
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) :assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image,
            ),
          ),
          Expanded
            (child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [catalog.name.text.color(MyTheme.darkBluishColor).bold.xl2.make(),
              catalog.desc.text.textStyle(context.captionStyle!).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mOnly(right: 16),
                children: ["\$${catalog.price}".text.xl.bold.make(),

                  ElevatedButton(onPressed: (){}, child: "Add To Cart".text.make(),
                      style:ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                      )
                  ),

                ],
              )
            ],
          ))
        ],
      ),
    ).white.roundedLg.square(150).make().py16();
  }
}