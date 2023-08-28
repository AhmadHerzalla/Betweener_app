import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt9_betweener_challenge/core/helper/api_respons.dart';
import 'package:tt9_betweener_challenge/core/util/constants.dart';
import 'package:tt9_betweener_challenge/controllers/follow_controller.dart';
import 'package:tt9_betweener_challenge/controllers/user_controller.dart';
import 'package:tt9_betweener_challenge/models/follow.dart';
import 'package:tt9_betweener_challenge/models/user.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tt9_betweener_challenge/provider/link_provider.dart';
import 'package:tt9_betweener_challenge/views_featuers/link/add_link_view.dart';
import 'package:tt9_betweener_challenge/views_featuers/link/edit_link_view.dart';

class ProfileView extends StatefulWidget {
  static String id = '/profileView';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Future<User1> user;

  //late Future<List<Link>> links;
  late Future<Follow> follow;
  @override
  void initState() {
    user = getLocalUser();
    //links = getLinks(context);
    follow = getFollowInfo();
    super.initState();
  }

  // void refresh() {
  //   setState(() {
  //     //   links = getLinks(context);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomEnd, children: [
      Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Center(
              child: Text(
                'Profile',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    right: 16,
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/imgs/Mask group.png"),
                    radius: 60,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder(
                      future: user,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(snapshot.data?.user?.name ?? "",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 68),
                                  IconButton(
                                    style: const ButtonStyle(),
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              Text(snapshot.data?.user?.email ?? "",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text("+970-059-123-4567",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                            ],
                          );
                        }
                        return const Text('loading');
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        FutureBuilder(
                          future: follow,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: kSecondaryColor,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Text(
                                  'followers ${snapshot.data?.followersCount}',
                                ),
                              );
                            }
                            return const Text('loading');
                          },
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        FutureBuilder(
                          future: follow,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: kSecondaryColor,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Text(
                                  'following ${snapshot.data?.followingCount}',
                                ),
                              );
                            }
                            return const Text('loading');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Consumer<LinkProvider>(builder: (_, linkProvider, __) {
            print("55555555555");
            print(linkProvider.links);
            if (linkProvider.links.status == Status.LOADING) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (linkProvider.links.status == Status.COMPLETED) {
              return Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          // padding: const EdgeInsets.all(8),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final title = linkProvider.links.data?[index].title;
                            final link = linkProvider.links.data?[index].link;
                            final id = linkProvider.links.data?[index].id;

                            return Slidable(
                              // The end action pane is the one at the right or the bottom side.
                              endActionPane: ActionPane(
                                extentRatio: 0.6,
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    // An action can be bigger than the others.

                                    backgroundColor: kSecondaryColor,
                                    foregroundColor: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    icon: Icons.edit,

                                    onPressed: (BuildContext context) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditLink(
                                                    idOfLink: id!,
                                                  )));
                                      //           refresh();
                                    },
                                  ),
                                  const SizedBox(width: 24),
                                  SlidableAction(
                                    backgroundColor: kDangerColor,
                                    foregroundColor: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    icon: Icons.delete,
                                    onPressed: (BuildContext context) {
                                      print(id);
                                      print('---------------------------111');
                                      linkProvider.deleteLinks(id!);

                                      // deleteLink(context, id!).then((value) {
                                      //   Navigator.pop(context, true);
                                      // }).catchError((err) {
                                      //   // ignore: avoid_print
                                      //   print(err.toString());
                                      // });
                                      //     refresh();
                                    },
                                  ),
                                  const SizedBox(width: 24),
                                ],
                              ),

                              child: ListTile(
                                title: Container(
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                      color: index % 2 == 0
                                          ? kLinksColor
                                          : kLightDangerColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '$title',
                                        style: TextStyle(
                                          color: index % 2 == 0
                                              ? kPrimaryColor
                                              : kOnLightDangerColor,
                                        ),
                                      ),
                                      Text(
                                        '$link',
                                        style: TextStyle(
                                            color: index % 2 == 0
                                                ? kPrimaryColor
                                                : kOnLightDangerColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 16,
                            );
                          },
                          itemCount: linkProvider.links.data!.length),
                    ),
                  ],
                ),
              );
            }
            return const Text('no data');
          }),
        ],
      ),
      GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(context, AddLink.id);
          //  refresh();
        },
        child: Container(
          margin: const EdgeInsets.only(right: 24, bottom: 16),
          padding: const EdgeInsets.all(
            8,
          ),
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(30)),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 40,
                color: Colors.white,
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
