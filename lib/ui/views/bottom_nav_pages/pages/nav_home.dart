import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_app/ui/route/routes.dart';
import '../../../widgets/nav_home_categories.dart';
import '../detail_screen.dart';
import '../see_all.dart';
import 'package:get_storage/get_storage.dart';

class NavHome extends StatefulWidget {
  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  final RxInt _currentIndex = 0.obs;

  final CollectionReference _refference = FirebaseFirestore.instance
      .collection('all-data')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection('images');
  final CollectionReference _carouselImage =
      FirebaseFirestore.instance.collection('carousel-image');

  //queryName
  late Future<QuerySnapshot> _futureDataForYou;
  late Future<QuerySnapshot> _futureDataRecentlyAdded;
  late Future<QuerySnapshot> _futureDataTopPlaces;

  //carousel-Image
  List<String> carouselImages = [
    'assets/images/cover-one.jpeg',
    'assets/images/cover-one.webp',
    'assets/images/cover-two.webp',
    'assets/images/cover-three.webp',
  ];

  List<String> touristPlaces = [
    'assets/images/debtakhum.jpeg',
    'assets/images/debtakhum.jpeg',
    'assets/images/debtakhum.jpeg',
    'assets/images/debtakhum.jpeg',
  ];
  int currentIndex = 0;
  var _dotPosition = 0;
  fetchCarouselImages() async {
    QuerySnapshot qn =
        await FirebaseFirestore.instance.collection("carousel-image").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        carouselImages.add(
          qn.docs[i]["img"],
        );
        // print(qn.docs[i]["img"]);
      }
    });
    return qn.docs;
  }

  Widget buildView() {
    return Container(
      width: 300,
      child: Text(carouselImages[currentIndex]),
    );
  }

  @override
  void initState() {
    _futureDataForYou = _refference.where('for_you', isEqualTo: true).get();
    _futureDataRecentlyAdded =
        _refference.where('recently_added', isEqualTo: true).get();
    _futureDataTopPlaces =
        _refference.where('top_places', isEqualTo: true).get();
    fetchCarouselImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CarouselSlider.builder(
                itemCount: carouselImages.length,
                itemBuilder: (context, _, index) {
                  return buildView();
                },
                options: CarouselOptions(
                    height: 130,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    autoPlay: false)),
            DotsIndicator(
              dotsCount: carouselImages.length,
              position: currentIndex.toDouble(),
              decorator: const DotsDecorator(
                color: Colors.grey, // Inactive color
                activeColor: Colors.blue,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
              child: InkWell(
                onTap: () => Get.toNamed(searchScreen),
                child: Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search_outlined,
                          size: 20.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Search for your next tour",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            navHomeCategories(
              "For You",
              () => Get.toNamed(seeAllScreen, arguments: SeeAll('for_you')),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              height: 40,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: touristPlaces.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                                child: Text(
                              touristPlaces[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            )),
                          )),
                    );
                  },
                ),
              ),
            ),

            // Container(
            //     height: 180.h,
            //     child:ListView(
            //       scrollDirection:Axis.vertical,
            //       children: widget.data.images.map(e)=>Container(decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),
            //       border:Border.all(color: Colors.black,width:5)),
            //       child:CacheNetworkImage(imageUrl:e, height:100,fit:BoxFit.cover,progressIndicatorBuilder:(context,url,progress)=>Center(child:CircularProgressIndicator(value:progress.progress,)))),
            //     )),

            SizedBox(
              height: 15.h,
            ),
            navHomeCategories(
              "Recently Added",
              () => Get.toNamed(seeAllScreen,
                  arguments: SeeAll('recently_added')),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: touristPlaces.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                                child: Text(
                              touristPlaces[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            )),
                          )),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                ),
              ),
            ),

            SizedBox(
              height: 15.h,
            ),
            navHomeCategories(
              "Top Places",
              () => Get.toNamed(seeAllScreen, arguments: SeeAll('top_places')),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
                height: 80.h,
                child: FutureBuilder<QuerySnapshot>(
                    future: _futureDataTopPlaces,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Error");
                      }
                      if (snapshot.hasData) {
                        List<Map> items = parseData(snapshot.data);
                        return topPlaces(items);
                      }
                      return Center(child: CircularProgressIndicator());
                    })),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

List<Map> parseData(QuerySnapshot querySnapshot) {
  List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
  List<Map> listItems = listDocs
      .map((e) => {
            'list_images': e['gallery_img'],
            'list_destination': e['destination'],
            'list_cost': e['cost'],
            'list_description': e['description'],
            'list_facilities': e['facilities'],
            'list_owner_name': e['owner_name'],
            'list_phone': e['phone'],
          })
      .toList();
  return listItems;
}

ListView forYou(List<Map<dynamic, dynamic>> items) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: items.length,
    itemBuilder: (_, i) {
      Map thisItem = items[i];
      return Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: InkWell(
          onTap: () =>
              Get.toNamed(detailsScreen, arguments: DetailsSCreen(thisItem)),
          child: Container(
            width: 100.w,
            height: 180.h,
            decoration: BoxDecoration(
              color: Color(0xFfC4C4C4),
              borderRadius: BorderRadius.all(
                Radius.circular(7.r),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7.r),
                      topRight: Radius.circular(7.r),
                    ),
                    child: Image.network(
                      thisItem['list_images'][0],
                      height: 115.h,
                      fit: BoxFit.cover,
                    )),
                Text(
                  thisItem['list_destination'],
                  style: TextStyle(fontSize: 15.sp),
                ),
                Text(
                  thisItem['list_cost'],
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

ListView recentlyAdded(List<Map<dynamic, dynamic>> items) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: items.length,
    itemBuilder: (_, i) {
      Map thisItem = items[i];
      return Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: InkWell(
          onTap: () =>
              Get.toNamed(detailsScreen, arguments: DetailsSCreen(thisItem)),
          child: Container(
            width: 100.w,
            height: 180.h,
            decoration: BoxDecoration(
              color: Color(0xFfC4C4C4),
              borderRadius: BorderRadius.all(
                Radius.circular(7.r),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7.r),
                      topRight: Radius.circular(7.r),
                    ),
                    child: Image.network(
                      thisItem['list_images'][0],
                      height: 115.h,
                      fit: BoxFit.cover,
                    )),
                Text(
                  thisItem['list_destination'],
                  style: TextStyle(fontSize: 15.sp),
                ),
                Text(
                  thisItem['list_cost'],
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

ListView topPlaces(List<Map<dynamic, dynamic>> items) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: items.length,
    itemBuilder: (_, i) {
      Map thisItem = items[i];
      return Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: InkWell(
          onTap: () =>
              Get.toNamed(detailsScreen, arguments: DetailsSCreen(thisItem)),
          child: Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: Color(0xFfC4C4C4),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(thisItem['list_images'][0]),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      );
    },
  );
}
