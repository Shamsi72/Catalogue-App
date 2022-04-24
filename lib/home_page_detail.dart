import 'package:check_project/theme.dart';
import 'package:check_project/utili/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'moddels/catalog.dart';

class homePageDetails extends StatelessWidget {
  final Item catalog;
  const homePageDetails({Key? key, required this.catalog}) : assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.mOnly(right: 16),
        children: ["\$${catalog.price}".text.red800.xl4.bold.make(),

          ElevatedButton(onPressed: (){}, child: "Add To Cart".text.make(),
              style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
              ),
          ).wh(120,50),

        ],
      ).p32(),
      body: SafeArea(
            bottom: false,
        child: Column(
          children:[
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h40(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                    color: Colors.white,
                 child: Column(
                   children: [
                     catalog.name.text.color(MyTheme.darkBluishColor).bold.xl5.make(),
                     catalog.desc.text.textStyle(context.captionStyle!).make(),
                     10.heightBox,
                     "You are my final love in this world if i would not meet you in future then i will not live in my real state please come back you are my love".text.make().p16(),
                   ],
                 ).py64(),
                  
                  ),
              ),

            )
          ],
        ),
      ),

    );
  }
}
