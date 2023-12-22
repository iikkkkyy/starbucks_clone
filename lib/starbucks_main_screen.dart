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

  void _scrollListener() {
    // 여기서 스크롤 위치를 체크하고 일정 위치 이상으로 스크롤되면 해당 위젯을 숨기도록 처리할 수 있습니다.
    // 예를 들어, 스크롤이 100 픽셀 이상 내려갔을 때 해당 위젯을 숨길 수 있습니다.
    if (_scrollController.offset > 100) {
      // setState를 호출하여 UI를 업데이트합니다.
      setState(() {
        // 어떤 동작을 수행하거나 UI를 업데이트할 수 있습니다.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
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
            cacheExtent: 0,
            slivers: <Widget>[
              SliverAppBar(
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
              ),
              SliverList(
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
                              // mainAxisSize: MainAxisSize.min,
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // Left side: Progress bar
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: 12 / 25,
                                    backgroundColor: Colors.grey[100],
                                    valueColor:
                                    const AlwaysStoppedAnimation<Color>(
                                      Colors.green,
                                    ),
                                    minHeight: 12,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                // Add some spacing between progress bar and text
                                // Right side: Text '12 / 25'
                                const Text(
                                  '12',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                  ),
                                ),
                                const Text(
                                  ' / ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 30,
                                  ),
                                ),
                                const Text(
                                  '25 ★',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 25,
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
              ),
              // const SizedBox(width: 40,),
              SliverAppBar(
                toolbarHeight: 30,
                expandedHeight: 0,
                floating: true,
                pinned: true,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    const Spacer(),
                    const Icon(Icons.notification_add_outlined),
                  ],
                ),

                // flexibleSpace: FlexibleSpaceBar(
                //
                //     background: Padding(
                //       padding: const EdgeInsets.all(10.0),
                //       child: Row(
                //         children: [
                //           const Icon(Icons.mail_outline_sharp),
                //           TextButton(
                //               onPressed: () {},
                //               child: const Text(
                //                 'What\'s New',
                //                 style: TextStyle(color: Colors.black),
                //               )),
                //           const Icon(Icons.discount),
                //           TextButton(
                //               onPressed: () {},
                //               child: const Text(
                //                 'Coupon',
                //                 style: TextStyle(color: Colors.black),
                //               )),
                //           const Spacer(),
                //           const Icon(Icons.notification_add_outlined),
                //         ],
                //       ),
                //     )),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      children: [
                        Container(
                          height: 200,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(
                            'assets/starbucks/01_body.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 200,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(
                            'assets/starbucks/01_body.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 200,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(
                            'assets/starbucks/01_body.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 200,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(
                            'assets/starbucks/01_body.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 200,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(
                            'assets/starbucks/01_body.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 200,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(
                            'assets/starbucks/01_body.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 200,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(
                            'assets/starbucks/01_body.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 100,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(
                            'assets/starbucks/02_body.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Add more Image widgets as needed
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
