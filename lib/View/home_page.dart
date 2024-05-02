import 'package:flutter/material.dart';
import '../Model/itemdata.dart';
import '../widget/MenuItem.dart';
import 'item_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final List foods = const [
    "Burger",
    "Pizza",
    "Snacks",
    "Drinks",
  ];

  final List<Color> bgColors = const [
    Color(0xFFFBDCDA),
    Color(0xFFD4EEF3),
    Color(0xFFFAE6D5),
    Color(0xFFEFCFE7),
  ];
  List<ItemData>? _selectedItem;

  final List<ItemData> items = [
    ItemData(
        Category: 'Burger',
        imgpath: 'assets/images/Burger.png',
        Name: 'Cheese Burger',
        price: 20),
    ItemData(
        Category: 'Burger',
        imgpath: 'assets/images/Burger3.png',
        Name: 'Classic Burger',
        price: 25),
    ItemData(
        Category: 'Burger',
        imgpath: 'assets/images/three_patty_burger.png',
        Name: 'three patty burger',
        price: 30),
    ItemData(
        Category: 'Pizza',
        imgpath: 'assets/images/Margherita.png',
        Name: 'Margherita Pizza',
        price: 30),
    ItemData(
        Category: 'Pizza',
        imgpath: 'assets/images/Mixed Cheese.png',
        Name: 'Mixed Cheese Pizza',
        price: 40),
    ItemData(
        Category: 'Pizza',
        imgpath: 'assets/images/Sausage.png',
        Name: 'Sausage Pizza',
        price: 50),
    ItemData(
        Category: 'Snacks',
        imgpath: 'assets/images/mixed nuts.png',
        Name: 'mixednuts',
        price: 15),
    ItemData(
        Category: 'Snacks',
        imgpath: 'assets/images/popcorn.png',
        Name: 'Popcorn',
        price: 10),
    ItemData(
        Category: 'Snacks',
        imgpath: 'assets/images/snack3.png',
        Name: 'Fries',
        price: 12),
    ItemData(
        Category: 'Drinks',
        imgpath: 'assets/images/Drinks.png',
        Name: 'apple drink ',
        price: 8),
    ItemData(
        Category: 'Drinks',
        imgpath: 'assets/images/drink1.png',
        Name: 'lemon drink',
        price: 8),
    ItemData(
        Category: 'Drinks',
        imgpath: 'assets/images/drink2.png',
        Name: 'grape drink',
        price: 8),
  ];
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const   SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(

                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.4,
                    padding:  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:Center(
                      child:   Text(
                        'Halawa Delivery',
                        style: TextStyle(
                          color:Colors.black,
                          fontSize: 24,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            flag = false;
                          });
                        },
                        child:const Text(
                          "View All",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          this.index = index;
                          flag = true;
                          _selectedItem = filterByCategory(items, foods[index]);
                          print(foods[index]);
                          print(this.index);
                          print(index);
                          _selectedItem!.forEach((element) {
                            print(element.Category);
                          });
                        });
                      },
                      child: Container(
                        width: 100,
                        margin:const EdgeInsets.only(left: 15),
                        padding:const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: bgColors[index],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/images/${foods[index]}.png",
                              height: 80,
                              width: 80,
                            ),
                            Text(
                              foods[index],
                              style:const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const   Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Menu",
                      style:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              if (flag) showCategory(),
              if (!flag)
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics:const  BouncingScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return ItemScreen(item: items[index],);
                                  }));
                            },
                            child: MenuItem(item: items[index])),
                      );
                    }),
            ],
          ),
        ));
  }

  Widget showCategory() {
    return ListView.builder(
        itemCount: _selectedItem!.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics:const  BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ItemScreen(item: _selectedItem![index],);
                  }));
                },
                child: MenuItem(item: _selectedItem![index])),
          );
        });
  }

  List<ItemData> filterByCategory(List<ItemData> list, String category) {
    return list
        .where((item) => item.Category.toLowerCase() == category.toLowerCase())
        .toList();
  }
}
