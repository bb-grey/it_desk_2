import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/material.dart';
import 'package:it_desk2/models/Topic.dart';
import 'package:it_desk2/models/category.dart';
import 'package:it_desk2/screens/login_screen.dart';
import 'package:it_desk2/screens/solution_screen.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class TopicsListScreen extends StatefulWidget {
  static final String routeName = "topics_list_screen";

  @override
  _TopicsListScreenState createState() => _TopicsListScreenState();
}

class _TopicsListScreenState extends State<TopicsListScreen> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  firebase_storage.ListResult? allFiles;

  Future<void> listFiles(String folderName) async {
    firebase_storage.ListResult result = await firebase_storage
        .FirebaseStorage.instance
        .ref(folderName)
        .listAll();
    // print(result.items.length)
    if (mounted) {
      setState(() {
        allFiles = result;
      });
    }
  }

  Future<String> getFileName(int index) async {
    firebase_storage.FullMetadata metadata =
        await allFiles!.items.elementAt(index).getMetadata();
    return metadata.name;
  }

  Future<DateTime> getFileUploadDate(int index) async {
    firebase_storage.FullMetadata metadata =
        await allFiles!.items.elementAt(index).getMetadata();
    return metadata.timeCreated!;
  }

  Future<void> goViewableScreen(int index) async {
    String downloadUrl =
        await allFiles!.items.elementAt(index).getDownloadURL();
    Navigator.pushNamed(
      context,
      SolutionScreen.routeName,
      arguments: downloadUrl,
    );
    print(downloadUrl);
  }

  Future<void> downloadFile(int index) async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    String fileName = await getFileName(index);
    File downloadToFile = File('${appDocDirectory.path}/$fileName}');
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref(allFiles!.items.elementAt(index).fullPath)
          .writeToFile(downloadToFile);
    } on firebase_core.FirebaseException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;
    // List<Topic> topics = Topic.getTopics()
    //     .where((element) => element.category == category.categoryTag)
    //     .toList();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (mounted) {
        listFiles(category.folderName!);
      }
    });
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(category.name!),
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
          allFiles == null
              ? SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      margin: index == 0 ? EdgeInsets.only(top: 20.0) : null,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: GestureDetector(
                        // onTap: () => Navigator.pushNamed(
                        //     context, SolutionScreen.routeName,
                        //     arguments: topics[index].assetPath),
                        onTap: () => goViewableScreen(index),
                        child: Card(
                          child: ListTile(
                            leading: Icon(Icons.question_answer_rounded),
                            // trailing: GestureDetector(
                            //   child: Icon(Icons.download),
                            //   onTap: () {
                            //     downloadFile(index);
                            //   },
                            // ),
                            title: FutureBuilder(
                              future: getFileName(index),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data.toString());
                                }
                                return Center(
                                    child: CircularProgressIndicator());
                              },
                            ),
                            subtitle: FutureBuilder(
                              future: getFileUploadDate(index),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(DateFormat.yMMMd()
                                      .format(snapshot.data as DateTime));
                                }
                                return Center(child: Text(''));
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }, childCount: allFiles!.items.length),
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

// subtitle: Text(
//                               'hi',
//                               // DateFormat.yMMMd()
//                               //     .format(topics[index].postDate!),
//                             ),

//   @override
//   Widget build(BuildContext context) {
//     listFiles();
//     final Category category =
//         ModalRoute.of(context)!.settings.arguments as Category;
//     List<Topic> topics = Topic.getTopics()
//         .where((element) => element.category == category.categoryTag)
//         .toList();
//     return Scaffold(
//       body: allFiles == null
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : CustomScrollView(
//               slivers: [
//                 SliverAppBar(
//                   pinned: true,
//                   expandedHeight: 250,
//                   flexibleSpace: FlexibleSpaceBar(
//                     title: Text(category.name!),
//                     background: Container(
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(
//                             category.catImage!,
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SliverList(
//                   delegate: SliverChildBuilderDelegate((context, index) {
//                     return Container(
//                       margin: index == 0 ? EdgeInsets.only(top: 20.0) : null,
//                       padding: EdgeInsets.symmetric(horizontal: 20.0),
//                       child: GestureDetector(
//                         onTap: () => Navigator.pushNamed(
//                             context, SolutionScreen.routeName,
//                             arguments: topics[index].assetPath),
//                         child: Card(
//                           child: ListTile(
//                             leading: Icon(Icons.question_answer_rounded),
//                             title: Text(topics[index].title!),
//                             subtitle: Text(
//                               DateFormat.yMMMd()
//                                   .format(topics[index].postDate!),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }, childCount: topics.length),
//                 ),
//               ],
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, LoginScreen.routeName);
//         },
//         child: Icon(Icons.login),
//       ),
//     );
//   }
// }
