import 'package:flutter/material.dart';
import 'package:it_desk2/models/Topic.dart';
import 'package:it_desk2/models/category.dart';
import 'package:it_desk2/screens/login_screen.dart';
import 'package:it_desk2/screens/solution_screen.dart';
import 'package:intl/intl.dart';

class TopicsListScreen extends StatelessWidget {
  static final String routeName = "topics_list_screen";
  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;
    List<Topic> topics = Topic.getTopics()
        .where((element) => element.category == category.categoryTag)
        .toList();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(category.name!),
              // titlePadding: EdgeInsets.only(left: 10.0, bottom: 16.0, top: 0),
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      category.catImage!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                margin: index == 0 ? EdgeInsets.only(top: 20.0) : null,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, SolutionScreen.routeName,
                      arguments: topics[index].assetPath),
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.question_answer_rounded),
                      title: Text(topics[index].title!),
                      subtitle: Text(
                        DateFormat.yMMMd().format(topics[index].postDate!),
                      ),
                    ),
                  ),
                ),
              );
            }, childCount: topics.length),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, LoginScreen.routeName);
        },
        child: Icon(Icons.login),
      ),
    );
  }
}
