import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/follow_controller.dart';
//import 'package:tt9_betweener_challenge/constants.dart';
import 'package:tt9_betweener_challenge/controllers/search_controller.dart';
import 'package:tt9_betweener_challenge/core/util/constants.dart';
import 'package:tt9_betweener_challenge/models/follow.dart';

class SearchView extends StatefulWidget {
  static String id = '/search';
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

TextEditingController searchController = TextEditingController();

class _SearchViewState extends State<SearchView> {
  var people = [];
  late Follow localFollow;
  int len = 0;

  void getDataOfFollowing() async {
    localFollow = await getFollowInfo();
  }

  void submitsearch() async {
    Map<String, String> body = {
      'name': searchController.text,
    };
    people = await searchFunction(body);
    len = people.length;
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
              child: len != 0
                  ? ListView.builder(
                      itemCount: len,
                      itemBuilder: (contect, index) {
                        return ListTile(
                          title: Container(
                            margin: const EdgeInsets.all(8),
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: kPrimaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      people[index].name,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      people[index].email,
                                      style: TextStyle(
                                          color: Colors.grey[300],
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                // check(people[index].id)
                                //     ? const Text("followed")
                                //     :
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: check(people[index].id)
                                            ? MaterialStatePropertyAll(
                                                kLinksColor)
                                            : MaterialStatePropertyAll(
                                                kSecondaryColor)),
                                    onPressed: () async {
                                      Map<String, String> body = {
                                        "followee_id":
                                            people[index].id.toString()
                                      };
                                      await addFollow(body);

                                      setState(() {});
                                    },
                                    child: const Text("follow"))
                              ],
                            ),
                          ),
                        );
                      })
                  : Center(
                      child: Text(
                          " no one that his name is : ${searchController.text}"),
                    ))

          //------------------------
        ],
      ),
    );
  }
}
