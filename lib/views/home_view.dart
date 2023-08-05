import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/link_controller.dart';
// import 'package:tt9_betweener_challenge/controllers/search_controller.dart';

import 'package:tt9_betweener_challenge/controllers/user_controller.dart';
import 'package:tt9_betweener_challenge/views/add_link_view.dart';
import 'package:tt9_betweener_challenge/views/search_view.dart';

import '../constants.dart';
import '../models/link.dart';
import '../models/user.dart';

class HomeView extends StatefulWidget {
  static String id = '/homeView';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<User1> user;
  late Future<List<Link>> links;

  @override
  void initState() {
    user = getLocalUser();
    links = getLinks(context);
    super.initState();
  }

  void refresh() {
    setState(() {
      links = getLinks(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () async {
                    //  print(await searchFunction(context, {'name': 'ahmad'}));
                    Navigator.pushNamed(context, SearchView.id);
                  },
                  icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code)),
            ],
          ),
          FutureBuilder(
            future: user,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'Hello, ${snapshot.data?.user?.name}!',
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                );
              }
              return const Text('loading');
            },
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Image.asset("assets/imgs/QR Code.png"),
          ),
          const Divider(
            thickness: 3,
            color: Colors.black,
            indent: 50,
            endIndent: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: FutureBuilder(
              future: links,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.all(12),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final link = snapshot.data?[index].title;
                                final userName = snapshot.data?[index].username;
                                return Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: kSecondaryColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '$link',
                                            style: const TextStyle(
                                                color: kOnSecondaryColor),
                                          ),
                                          Text(
                                            '$userName',
                                            style: const TextStyle(
                                                color: kOnSecondaryColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 8,
                                );
                              },
                              itemCount: snapshot.data!.length),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await Navigator.pushNamed(context, AddLink.id);
                            refresh();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            decoration: BoxDecoration(
                                color: kLinksColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Icon(Icons.add), Text("ADD")],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const Text('loading');
              },
            ),
          ),
        ],
      ),
    );
  }
}
