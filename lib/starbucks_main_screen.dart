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
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
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
                        size: 25,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Pay',
                      icon: Icon(
                        Icons.payment_rounded,
                        size: 25,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Order',
                      icon: Icon(
                        Icons.coffee,
                        size: 25,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Shop',
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        size: 25,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Other',
                      icon: Icon(
                        Icons.more_horiz_sharp,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 110.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/starbucks/00_top.jpeg',
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: DefaultTextStyle(
                          style: TextStyle(fontWeight: FontWeight.normal),
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('13 ★ until Gold Level',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Row(
                                children: [
                                  // Left side: Progress bar
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: 12 / 25,
                                      backgroundColor: Colors.grey[100],
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              Colors.green),
                                      minHeight: 8,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  // Add some spacing between progress bar and text
                                  // Right side: Text '12 / 25'
                                  const Text(
                                    '12',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 40),
                                  ),
                                  const Text(
                                    ' / ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 30),
                                  ),
                                  const Text('25 ★',
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 25)),
                                ],
                              ),
                              // Text 'until Gold Level'

                              // Add more widgets as needed
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              SliverAppBar(
                expandedHeight: 0.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Icon(Icons.mail_outline_sharp),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'What\'s New',
                            style: TextStyle(color: Colors.black),
                          )),
                      const Icon(Icons.discount),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Coupon',
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                )),
              ),
            ],
          ),
        ));
  }
}
