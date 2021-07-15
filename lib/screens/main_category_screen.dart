import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:it_desk2/models/category.dart';
import 'package:it_desk2/models/topic.dart';
import 'package:it_desk2/screens/topics_list_screen.dart';

import '../constants.dart';

class MainCategoryScreen extends StatefulWidget {
  static final String routeName = "main_category_screen";

  @override
  _MainCategoryScreenState createState() => _MainCategoryScreenState();
}

class _MainCategoryScreenState extends State<MainCategoryScreen> {
  List<Category> categories = Category.categories;
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 34.0),
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  kCategoryScreenGradient1,
                  kCategoryScreenGradient2,
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Hey, What would you like to learn today ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      query = value.toLowerCase();
                    });
                  },
                  onSubmitted: (value) {
                    setState(() {
                      categories = Category.categories
                          .where((element) =>
                              element.name!.toLowerCase().contains(query))
                          .toList();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: categories.length,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              itemBuilder: (context, index) {
                return SingleCategoryCard(category: categories[index]);
              },
              staggeredTileBuilder: (index) {
                return StaggeredTile.count(1, index.isEven ? 1.5 : 1.0);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SingleCategoryCard extends StatelessWidget {
  final Category? category;

  SingleCategoryCard({this.category});
  @override
  Widget build(BuildContext context) {
    int totalPosts = Topic.getTopics()
        .where((element) => element.category == this.category!.categoryTag!)
        .length;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, TopicsListScreen.routeName,
          arguments: category),
      child: Card(
        color: Colors.white,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.white70, width: 1),
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(category!.imageAddress!),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category!.name!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    '$totalPosts posts',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
