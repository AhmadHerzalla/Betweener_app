import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt9_betweener_challenge/core/helper/api_respons.dart';
import 'package:tt9_betweener_challenge/core/util/constants.dart';
import 'package:tt9_betweener_challenge/provider/sender_provider.dart';

class ReceiveView extends StatefulWidget {
  static String id = '/receiveView';

  const ReceiveView({super.key});

  @override
  State<ReceiveView> createState() => _ReceiveViewState();
}

class _ReceiveViewState extends State<ReceiveView> {
  bool avtiveStatusR = false;
  bool avtiveStatusS = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 47.0),
              child: Text(
                "Active Sharing",
                style: TextStyle(fontSize: 24, color: Color(0xff2D2B4E)),
              ),
            ),
            Image.asset("assets/imgs/Frame 8.png"),
            Consumer<SenderProvider>(builder: (_, senderProvider, __) {
              if (senderProvider.links.status == Status.LOADING) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (senderProvider.links.status == Status.ERROR) {
                return Center(
                  child: Text(senderProvider.links.message!),
                );
              }

              if (senderProvider.links.status == Status.COMPLETED) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "the number of user Ative around uoy is ${senderProvider.links.data?.count}",
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xff2D2B4E)),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: senderProvider.links.data?.count,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        senderProvider.links.data!
                                            .nearestUsers![index].user!.name!,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Text(
                                        senderProvider.links.data!
                                            .nearestUsers![index].user!.email!,
                                        style: TextStyle(
                                            color: Colors.grey[300],
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              }

              return const Text(" no data from sender provider");
            })
          ],
        ),
      ),
    );
  }
}
