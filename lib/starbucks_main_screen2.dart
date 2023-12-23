
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class StarBucksApp2 extends StatefulWidget {
  const StarBucksApp2({super.key});

  @override
  State<StarBucksApp2> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<StarBucksApp2> {
  // final cardInfos = ImageFileRepository().getCards();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              title: FittedBox(
                fit: BoxFit.fitWidth,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            elevation: 0,
                            backgroundColor: Colors.white),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '''What's New''',
                              style: TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            elevation: 0,
                            backgroundColor: Colors.white),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.confirmation_number_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '''Coupon''',
                              style: TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.notifications_none))
                    ],
                  ),
                ),
              ),
              background: Column(
                children: [
                  Image.asset('assets/starbucks/01_body.jpeg'),
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '5 ★ until Green Level',
                                  style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0, right: 10.0, bottom: 10.0),
                                  child: Opacity(
                                    opacity: 0.3,
                                    child: SimpleAnimationProgressBar(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      height: 6,
                                      width: 270,
                                      backgroundColor: Colors.grey,
                                      foregrondColor: Colors.green,
                                      ratio: 0.0,
                                      direction: Axis.horizontal,
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration: Duration(seconds: 3),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              '0',
                              style: TextStyle(fontSize: 40),
                            ),
                            Text(
                              '/5★',
                              style: TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                          ],
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
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: (){},
        tooltip: 'Increment',
        backgroundColor: Colors.green,
        child: const Icon(Icons.moped_rounded,color: Colors.white,size: 30,),
      ),
    );
  }
}