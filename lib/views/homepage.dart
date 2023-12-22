import 'package:flutter/material.dart';
import 'package:meatshop/controller/productprovider.dart';
import 'package:meatshop/views/cart.dart';
import 'package:meatshop/views/fish.dart';
import 'package:meatshop/views/meat.dart';
import 'package:meatshop/views/marinated.dart';
import 'package:meatshop/views/readytocook.dart';
import 'package:provider/provider.dart';
import 'package:meatshop/views/profile.dart';

class Homee extends StatefulWidget {
  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  var names = [
    "Fish",
    "Meat",
    "Marrinated",
    "Ready to Cook",
  ];

  var pages = [
    fish_page(),
    meat_page(),
    marinated_page(),
    readytocook_page(),
  ];

  var images = [
    "assets/images/fish.png",
    "assets/images/meat.png",
    "assets/images/marinated.png",
    "assets/images/ready_to_cook.jpeg",
  ];

  @override
  int index = 1;

  Widget build(BuildContext context) {
    final cartitems = context.watch<ProductProvider>().cart;
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          floating: true,
          title: Text(
            "Hi users",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          actions: [
            IconButton(
              icon: new Icon(Icons.shopping_cart),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Cart())),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                child: Text('${cartitems.length}')),
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.all(5),
            height: 80,
            child: Text(
              ' Category ',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
               
                margin: EdgeInsets.fromLTRB(5, 0, 2, 0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(3),
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0)),
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          width: 150,
                          height: 300,
                          child: Column(children: [
                            Text(names[index],
                                style: Theme.of(context).textTheme.bodyMedium),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => pages[index]));
                              },
                              child: Text("View more",
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                          ])),
                    ),
                  ],
                ),
              );
            },
            childCount: images.length,
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tapindex) {
          setState(() {
            index = tapindex;
            if (index == 0) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Homee()));
            } else if (index == 1) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Cart()));
            } else {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profile()));
            }
          });
        },
        currentIndex: index,
        unselectedItemColor: Colors.green,
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}

/*

 */
