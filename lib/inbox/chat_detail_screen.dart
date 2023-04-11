import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              const CircleAvatar(
                foregroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/361217",
                ),
                child: Text('Nico'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: Sizes.size18,
                  height: Sizes.size18,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                      color: Colors.white,
                      width: Sizes.size3,
                    ),
                    borderRadius: BorderRadius.circular(
                      Sizes.size24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: const Text(
            'Nico',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text('Active now'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
              horizontal: Sizes.size14,
            ),
            itemBuilder: (context, index) {
              final isMine = index % 2 == 0;
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(Sizes.size14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(
                          Sizes.size20,
                        ),
                        topRight: const Radius.circular(
                          Sizes.size20,
                        ),
                        bottomLeft: isMine
                            ? const Radius.circular(Sizes.size20)
                            : const Radius.circular(Sizes.size5),
                        bottomRight: isMine
                            ? const Radius.circular(Sizes.size5)
                            : const Radius.circular(Sizes.size20),
                      ),
                      color:
                          isMine ? Colors.blue : Theme.of(context).primaryColor,
                    ),
                    child: const Text(
                      "This is a message!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Gaps.v14,
            itemCount: 10,
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              color: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size16,
                  vertical: Sizes.size10,
                ),
                child: Row(
                  children: [
                    Gaps.h20,
                    Expanded(
                        child: SizedBox(
                      height: Sizes.size52,
                      child: TextField(
                        expands: true,
                        minLines: null,
                        maxLines: null,
                        textInputAction: TextInputAction.send,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: "Send a message",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Sizes.size12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size12,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: Sizes.size5,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(FontAwesomeIcons.faceSmile,
                                    color: Colors.grey.shade900),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                    GestureDetector(
                      onTap: _stopWriting,
                      child: Container(
                        padding: const EdgeInsets.only(
                          right: Sizes.size14,
                          left: Sizes.size14,
                        ),
                        child: const FaIcon(FontAwesomeIcons.paperPlane),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
