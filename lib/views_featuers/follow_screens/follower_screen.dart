import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/core/util/constants.dart';
import 'package:tt9_betweener_challenge/models/follow.dart';

class FollowerScreen extends StatelessWidget {
  final List<FollowerElement>? following;
  const FollowerScreen(this.following, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Followrs ",
            style: TextStyle(
              fontSize: 24,
              color: Color(0xff2D2B4E),
            )),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color(0xff2D2B4E)),
      ),
      body: following != null
          ? following?.length != 0
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: following?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: kPrimaryColor,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/imgs/person.jpg"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    following![index].name!,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    following![index].email!,
                                    style: TextStyle(
                                        color: Colors.grey[300], fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : const Center(child: Text("no one that you are following"))
          : const Center(
              child: Text("no one that you are following"),
            ),
    );
  }
}
