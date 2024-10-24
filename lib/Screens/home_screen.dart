import 'package:desibites/Screens/restaurant_scree.dart';
import 'package:desibites/models/card.dart';
import 'package:desibites/models/product_tile.dart';
import 'package:desibites/styles/colors.dart';
import 'package:desibites/widgets/text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });
 final List<Categorycard> category = [
    const Categorycard(
        image: Image(
          image: AssetImage('assets/images/burger 1.png'),
          fit: BoxFit.cover,
        ),
        title: 'Burgers'),
    const Categorycard(
        image: Image(
          image: AssetImage('assets/images/cake 1.png'),
          fit: BoxFit.cover,
        ),
        title: 'Pastry'),
    const Categorycard(
        image: Image(
          image: AssetImage('assets/images/taco 1.png'),
          fit: BoxFit.cover,
        ),
        title: 'Mexican'),
    const Categorycard(
        image: Image(
          image: AssetImage('assets/images/Sushii.png'),
          fit: BoxFit.cover,
        ),
        title: 'Sushi'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: dynamicTitleText(
              text: 'Delivery \nMaplewoods Suites',
              fontSize: 15,
              color: AppColors.white),
          backgroundColor: const Color(0xff0b1225),
          actions:  [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.delivery_dining,color: AppColors.white,),
            )
          ],
        ),
        drawer: const Drawer(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bj.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: SearchBar(
                    
                    hintText: 'Yor Order',
                    hintStyle:
                        WidgetStatePropertyAll(TextStyle(color: Colors.white)),
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromARGB(255, 16, 38, 99)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      dynamicTitleText(
                          text: 'Categories',
                          fontSize: 17,
                          color: AppColors.white),
                      dynamicTitleText(
                          text: 'See All',
                          fontSize: 12,
                          color: AppColors.white,
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: category[index],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                          child: Image.asset('assets/images/Card.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                          child: Image.asset('assets/images/Card.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: dynamicTitleText(
                            text: 'Fastest Near You',
                            fontSize: 17,
                            color: AppColors.white)),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const RestaurantScreen(restaurantId: 'Studio7teas'),
                      ),
                    );
                  },
                  child: const Padding(
                    padding:  EdgeInsets.all(15),
                    child: ImageContainer(image: 'assets/images/studio7.jpg', restaurantName: 'Studio7teas',),
                   
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const RestaurantScreen(restaurantId: 'Kababjees'),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child:ImageContainer(image: 'assets/images/kababjees1.jpg', restaurantName: 'Kababjees',),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const RestaurantScreen(restaurantId: 'SweetCreme'),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child:ImageContainer(image: 'assets/images/SweetCremee.jpg', restaurantName: 'Sweet Creme',),
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
