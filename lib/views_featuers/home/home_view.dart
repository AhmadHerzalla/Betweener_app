import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt9_betweener_challenge/core/helper/api_respons.dart';
import 'package:tt9_betweener_challenge/core/helper/shared_prefs.dart';
import 'package:tt9_betweener_challenge/core/util/constants.dart';
import 'package:tt9_betweener_challenge/controllers/user_controller.dart';
import 'package:tt9_betweener_challenge/provider/link_provider.dart';
import 'package:tt9_betweener_challenge/views_featuers/auth/login_view.dart';
import 'package:tt9_betweener_challenge/views_featuers/link/add_link_view.dart';
import 'package:tt9_betweener_challenge/views_featuers/searsh/search_view.dart';
import '../../models/user.dart';

class HomeView extends StatefulWidget {
  static String id = '/homeView';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<User1> user;

  @override
  void initState() {
    SharedPrefsController().getData('user');
    user = getLocalUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () async {
                    await SharedPrefsController().deletdata();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const LoginView()));
                  },
                  icon: const Icon(Icons.logout)),
              const Spacer(),
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
            child: Consumer<LinkProvider>(
              builder: (_, linkProvider, __) {
                // print("===================================");
                // print(linkProvider.links);

                if (linkProvider.links.status == Status.LOADING) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (linkProvider.links.status == Status.COMPLETED) {
                  return SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.all(12),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final link =
                                    linkProvider.links.data?[index].title;
                                final userName =
                                    linkProvider.links.data?[index].username;
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
                              itemCount: linkProvider.links.data!.length),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await Navigator.pushNamed(context, AddLink.id);
                            // refresh();
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
                return const Text("no data");
              },
            ),
          ),
        ],
      ),
    );
  }
}
