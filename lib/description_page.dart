import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  List<Map<String, dynamic>> list = [
    {'image': 'assets/images/burger.svg'},
    {'image': 'assets/images/clothes.svg'},
    {'image': 'assets/images/medicine.svg'},
    {'image': 'assets/images/bread.svg'},
    {'image': 'assets/images/cosmetics.svg'},
  ];
  List<Map<String, dynamic>> list2 = [
    {'icon': Icons.delivery_dining_rounded, 'name': 'Delivered\nby Primzee'},
    {'icon': Icons.delivery_dining_rounded, 'name': 'Free\nDelivery'},
    {'icon': Icons.local_offer, 'name': 'Special\nOffer'},
  ];
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.purple.shade50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 270,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appHeader(),
                  SizedBox(
                    height: 10,
                  ),
                  searchbar(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            list_builder(),
            SizedBox(
              height: 10,
            ),
            RecentOrder(),
            SizedBox(
              height: 10,
            ),
            Recomended(),
          ],
        ),
      ),
    );
  }

  Column Recomended() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Recomended',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 90,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/images/burger.png',
                height: 50,
                width: 50,
              ),
            ),
            Container(
              height: 90,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/images/plate3.png',
                height: 50,
                width: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column RecentOrder() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.refresh,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Recent Orders',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Spacer(),
              Text(
                'View all',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 170,
            width: 320,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/week.jpg',
                  ),
                  fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '4,9',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.favorite_outlined,
                          color: Colors.black,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/Chilis-logo.png',
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1 * Mushroom Soup...',
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '85,00 t',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.greenAccent,
                          child: Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  SizedBox list_builder() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: list2.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 60,
            width: 130,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(
                    list2[index]['icon'],
                    size: 30,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    list2[index]['name'],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Column searchbar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Deliver to',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.bookmark_border_outlined,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Home .'),
                  ],
                ),
              ),
              suffixIcon: Icon(
                Icons.my_location,
                size: 17,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              fillColor: Colors.white,
              hintText: '4405 Beeghley Street',
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container appHeader() {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkResponse(
                  onTap: () {},
                  child: Icon(
                    Icons.menu,
                    size: 25,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'PRIMZEE',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 18,
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20,
                  ),
                  backgroundColor: Colors.yellow,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        select = index;
                      },
                    );
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        list[index]['image'],
                        height: 35,
                        width: 35,
                        color: select == index
                            ? Colors.deepOrangeAccent
                            : Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: select == index
                              ? Colors.black
                              : Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
    );
  }
}
