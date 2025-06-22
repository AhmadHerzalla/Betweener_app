import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/core/util/constants.dart';

class Otherprofile extends StatefulWidget {
  final user;
  const Otherprofile({super.key, required this.user});

  @override
  State<Otherprofile> createState() => _OtherprofileState();
}

class _OtherprofileState extends State<Otherprofile> {
  @override
  void initState() {
    print("///////////8888899999999999999");
    print(widget.user.links);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.user.name),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(children: [
            Container(
              width: 400,
              height: 235,
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/imgs/person.jpg"),
                  ),
                  Text(
                    widget.user.name,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(widget.user.email,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 18)),
                  ElevatedButton(
                      onPressed: () {
                        print(widget.user.links);
                      },
                      child: const Text("test"))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.user.links.length,
                  itemBuilder: (context, index) {
                    final title = widget.user.links[index].title;
                    final link = widget.user.links[index].link;

                    return ListTile(
                      title: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? kLinksColor
                                : kLightDangerColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                    );
                  }),
            )
          ]),
        ));
  }
}
