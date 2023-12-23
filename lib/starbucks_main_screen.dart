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
  final ScrollController _scrollController = ScrollController();

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
      physics: ClampingScrollPhysics(),
      slivers: [
        buildSliverAppBar(),
        // buildSliverList(),
        // buildSliverAppBarWithIcons(),
        buildSliverListWithImages(),
      ],
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 220.0,
      toolbarHeight: 0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            Image.asset(
              'assets/starbucks/00_top.jpeg',
              alignment: Alignment.topCenter,
            ),
            buildSliverList(),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: buildAppBarIcons(),
      ),
    );
  }

  Widget buildSliverList() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                const _ProgressText(
                    value: '12',
                    style: TextStyle(color: Colors.black, fontSize: 40)),
                const _ProgressText(
                    value: ' / ',
                    style: TextStyle(color: Colors.grey, fontSize: 30)),
                const _ProgressText(
                    value: '25 ★',
                    style: TextStyle(color: Colors.green, fontSize: 25)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildAppBarIcons() {
    return Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //what's new widget
              _whatsNewWidget(),
              Container(
                width: 10,
              ),
              //Coupon Widget
              _couponWidget(),
              const Spacer(),
              const Icon(Icons.notification_add_outlined),
            ],
          ),
        ],
      ),
    );
  }

  Widget _whatsNewWidget() {
    return Row(
      children: [
        const Icon(Icons.mail_outline_sharp),
        Container(
          width: 5,
        ),
        const Text(
            'What\'s New',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _couponWidget() {
    return Row(
      children: [
        const Icon(Icons.discount),
        Container(
          width: 5,
        ),
        const Text(
            'Coupon',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),

        ),
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

class _ProgressText extends StatelessWidget {
  final String value;
  final TextStyle style;

  const _ProgressText({required this.value, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: style,
    );
  }
}
