import 'package:artauct_app/components/productCardAccount.dart';
import 'package:artauct_app/components/productCardProductPage.dart';
/* import 'package:artauct_app/components/viewDetailButton.dart'; */
import 'package:flutter/material.dart';
import 'package:artauct_app/components/avatarUser.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          // Added account info section above the tab bar
          body: Column(
            children: [
              // Account info section
              PreferredSize(
                preferredSize: const Size.fromHeight(150.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 60),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        const AvatarUser(
                          size: 70,
                          imagePath: 'https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/109897762_316813336170293_5068459052902954878_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=1d70fc&_nc_ohc=9SP_hj2j6uMQ7kNvgEIry7O&_nc_ht=scontent.fsgn5-5.fna&oh=00_AYCP08lTIpkO4PfOvaTsZVMKDcFchQQkQU41unt098rPEg&oe=66BA29D3',
                          ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Võ Quang Linh',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Joined since 2020',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/icon_setting.png',
                            width: 40,
                            height: 40,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Tab bar and TabBarView
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(
                            child: Text(
                            "My Collection",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ),
                          Tab(
                            child: Text(
                            "My Favorites",
                           style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Container(
                              color: const Color.fromARGB(206, 221, 221, 221),
                              child: const Padding(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Productcardproductpage(
                                      imageUrl:
                                          'https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXJ0fGVufDB8fDB8fHww',
                                      title: 'Flower In Oddy',
                                      artist: 'Vo Quang Linh',
                                      price: '\$1,000',
                                    ),
                                    Productcardproductpage(
                                      imageUrl:
                                          'https://th.bing.com/th/id/R.39b43033a0cdda8a4d9285258fa70ffa?rik=5PbwMRZHRK2OVA&pid=ImgRaw&r=0',
                                      title: 'Hidden',
                                      artist: 'Phungu',
                                      price: '\$2,000',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: const Color.fromARGB(255, 232, 220, 229),
                              child: const Padding(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ProductCard(
                                      imageUrl:
                                          'https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXJ0fGVufDB8fDB8fHww',
                                      title: 'Flower In Oddy',
                                      artist: 'Vo Quang Linh',
                                      price: '\$1,000',
                                    ),
                                    ProductCard(
                                      imageUrl:
                                          'https://th.bing.com/th/id/R.39b43033a0cdda8a4d9285258fa70ffa?rik=5PbwMRZHRK2OVA&pid=ImgRaw&r=0',
                                      title: 'Hidden',
                                      artist: 'Phungu',
                                      price: '\$2,000',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

