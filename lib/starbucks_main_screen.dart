import 'package:flutter/material.dart';

class StarBucksApp extends StatefulWidget {
  const StarBucksApp({Key? key}) : super(key: key);

  @override
  State<StarBucksApp> createState() => _StarBucksAppState();
}

class _StarBucksAppState extends State<StarBucksApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        // color: Colors.transparent, // 배경색을 투명으로 설정
        child: DefaultTextStyle(
          style: const TextStyle(fontWeight: FontWeight.bold),
          child: Padding(
            padding: const EdgeInsets.all(8.0),

            child: BottomNavigationBar(

              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedFontSize: 11,
              unselectedFontSize: 11,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              currentIndex: _selectedIndex,
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home_filled,
                    size: 30,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Pay',
                  icon: Icon(
                    Icons.payment_rounded,
                    size: 30,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Order',
                  icon: Icon(
                    Icons.coffee,
                    size: 30,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Shop',
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    size: 30,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Other',
                  icon: Icon(
                    Icons.more_horiz_sharp,
                    size: 30,
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
