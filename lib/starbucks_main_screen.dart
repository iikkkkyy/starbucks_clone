import 'package:flutter/material.dart';

void main() {
  runApp(StarBucksApp());
}

class StarBucksApp extends StatefulWidget {
  const StarBucksApp({Key? key}) : super(key: key);

  @override
  State<StarBucksApp> createState() => _StarBucksAppState();
}

class _StarBucksAppState extends State<StarBucksApp> {
  int _selectedIndex = 0;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset > 100) {
      setState(() {
        // Handle scrolling action or UI update
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          bottomNavigationBar: buildBottomNavigationBar(),
          body: buildCustomScrollView(),
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return ClipRRect(
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
            onTap: _onTabTapped,
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
    );
  }

  Widget buildCustomScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        buildSliverAppBar(),
        buildSliverList(),
        buildSliverAppBarWithIcons(),
        buildSliverListWithImages(),
      ],
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 100.0,
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/starbucks/00_top.jpeg',
          width: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            height: 90,
            padding: const EdgeInsets.all(8.0),
            child: DefaultTextStyle(
              style: TextStyle(fontWeight: FontWeight.normal),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '13 ★ until Gold Level',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 12 / 25,
                          backgroundColor: Colors.grey[100],
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.green,
                          ),
                          minHeight: 12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '12 / 25 ★',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSliverAppBarWithIcons() {
    return SliverAppBar(
      toolbarHeight: 30,
      expandedHeight: 0,
      floating: true,
      pinned: true,
      title: buildAppBarIcons(),
    );
  }

  Widget buildAppBarIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.mail_outline_sharp),
        TextButton(
          onPressed: () {},
          child: const Text(
            'What\'s New',
            style: TextStyle(color: Colors.black),
          ),
        ),
        const Icon(Icons.discount),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Coupon',
            style: TextStyle(color: Colors.black),
          ),
        ),
        const Spacer(),
        const Icon(Icons.notification_add_outlined),
      ],
    );
  }

  Widget buildSliverListWithImages() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          buildImageContainer('assets/starbucks/01_body.jpeg'),
          buildImageContainer('assets/starbucks/01_body.jpeg'),
          buildImageContainer('assets/starbucks/01_body.jpeg'),
          buildImageContainer('assets/starbucks/01_body.jpeg'),
          buildImageContainer('assets/starbucks/01_body.jpeg'),
          buildImageContainer('assets/starbucks/01_body.jpeg'),
          buildImageContainer('assets/starbucks/01_body.jpeg'),
          buildImageContainer('assets/starbucks/02_body.jpeg', height: 100),
          // Add more Image widgets as needed
        ],
      ),
    );
  }

  Widget buildImageContainer(String imagePath, {double height = 200}) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
