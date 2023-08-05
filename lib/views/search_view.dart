import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/follow_controller.dart';
//import 'package:tt9_betweener_challenge/constants.dart';
import 'package:tt9_betweener_challenge/controllers/search_controller.dart';
import 'package:tt9_betweener_challenge/models/follow.dart';

class SearchView extends StatefulWidget {
  static String id = '/search';
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

TextEditingController searchController = TextEditingController();

class _SearchViewState extends State<SearchView> {
  Map<dynamic, dynamic> people = {};
  late Follow localFollow;
  int len = 0;

  void getDataOfFollowing() async {
    localFollow = await getFollowInfo(context);
  }

  void submitsearch() async {
    Map<String, dynamic> body = {
      'name': searchController.text,
    };
    people = await searchFunction(context, body);
    len = people['user'].length;
    setState(() {});
  }

  bool check(int id) {
    for (int i = 0; i < localFollow.following!.length; i++) {
      if (localFollow.following![i].id == id) {
        return true;
      }
    }
    return false;
  }

  @override
  void initState() {
    getDataOfFollowing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
            child: TextField(
              onSubmitted: (value) {
                submitsearch();
              },
              controller: searchController,
              decoration: InputDecoration(
                icon: const Icon(Icons.search),
                label: const Text("search"),
                hintText: "search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // TextButton(
          //     onPressed: () {
          //       submitsearch();
          //     },
          //     child: const Text("Search")),
          Expanded(
            child: ListView.builder(
                itemCount: len,
                itemBuilder: (contect, index) {
                  return ListTile(
                    title: Container(
                      margin: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(people['user'][index]['name']),
                          check(people['user'][index]['id'])
                              ? const Text("followed")
                              : ElevatedButton(
                                  onPressed: () async {
                                    Map<String, dynamic> body = {
                                      "followee_id":
                                          people['user'][index]['id'].toString()
                                    };
                                    await addFollow(context, body);

                                    setState(() {});
                                  },
                                  child: const Text("follow"))
                        ],
                      ),
                    ),
                  );
                }),
          )

          //------------------------
        ],
      ),
    );
  }
}
