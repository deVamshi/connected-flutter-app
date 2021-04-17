// // import 'package:flash_chat/helper/constants.dart';
// // import 'package:flash_chat/services/database.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';


// class Chat extends StatefulWidget {
//   // final String chatRoomId;

//   // Chat({this.chatRoomId});

//   @override
//   _ChatState createState() => _ChatState();
// }

// class _ChatState extends State<Chat> {
//   ScrollController controller = ScrollController();

//   //Stream<QuerySnapshot> chats;
//   TextEditingController messageEditingController = new TextEditingController();

//   // Widget chatMessages() {
//   //   return StreamBuilder(
//   //     stream: chats,
//   //     builder: (context, snapshot) {
//   //       return snapshot.hasData
//   //           ? ListView.builder(
//   //               reverse: true,
//   //               itemCount: snapshot.data.documents.length,
//   //               itemBuilder: (context, index) {
//   //                 return MessageTile(
//   //                   message: snapshot.data.documents[index].data["message"],
//   //                   sendByMe: Constants.myName ==
//   //                       snapshot.data.documents[index].data["sendBy"],
//   //                 );
//   //               })
//   //           : Container();
//   //     },
//   //   );
//   // }

//   // addMessage() {
//   //   if (messageEditingController.text.isNotEmpty) {
//   //     Map<String, dynamic> chatMessageMap = {
//   //       "sendBy": Constants.myName,
//   //       "message": messageEditingController.text,
//   //       'time': DateTime.now().millisecondsSinceEpoch,
//   //     };

//   //     DatabaseMethods().addMessage(widget.chatRoomId, chatMessageMap);
//   //     setState(() {
//   //       messageEditingController.text = "";
//   //     });
//   //   }
//   // }

//   @override
//   void initState() {
//     // DatabaseMethods().getChats(widget.chatRoomId).then((val) {
//     //   setState(() {
//     //     chats = val;
//     //   });
//     // });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   backgroundColor: Colors.black,
//     //   appBar: AppBar(
//     //     backgroundColor: Colors.blueGrey,
//     //     title: Text("Amigo Chat"),
//     //   ),
//     //   body: 
//       GestureDetector(
//         behavior: HitTestBehavior.opaque,
//         onPanDown: (_) {
//           FocusScopeNode currentFocus = FocusScope.of(context);
//           if (!currentFocus.hasPrimaryFocus) {
//             currentFocus.unfocus();
//           }
//         },
//         child: Container(
//           decoration: BoxDecoration(
//               // image: DecorationImage(
//               //     image: AssetImage('assets/images/cosmic_doodle.jpg'),
//               //     fit: BoxFit.cover)
//                   ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Text("Chat Messages will appear here")
//                 //chatMessages(),
//               ),
//               SizedBox(
//                 height: 0.1,
//               ),
//               Container(
//                 alignment: Alignment.bottomCenter,
//                 width: MediaQuery.of(context).size.width,
//                 child: Container(
//                   margin: EdgeInsets.only(left: 8,right: 8,bottom: 10,top: 10),
//                   padding: EdgeInsets.only(left:8,),
//                   height: 52,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.white,
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                           child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: TextField(
//                           controller: messageEditingController,
//                           style: TextStyle(color: Colors.black, fontSize: 20),
//                           decoration: InputDecoration(
//                               hintText: "Text a message",
//                               hintStyle: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                               ),
//                               border: InputBorder.none),
//                         ),
//                       )),
//                       SizedBox(
//                         width: 16,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Colors.blueGrey,
//                               borderRadius: BorderRadius.circular(5)),
//                           child: IconButton(
//                             icon: Icon(Icons.send),
//                             iconSize: 25,
//                             onPressed: () {
//                              // addMessage();
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//    // );
//   }
// }

// class MessageTile extends StatelessWidget {
//   // final String message;
//   // final bool sendByMe;

//  // MessageTile({@required this.message, @required this.sendByMe});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(1),
//       ),
//       padding: EdgeInsets.only(top: 4, bottom: 4, left: 5, right: 5),
//       alignment: //sendByMe ?
//       true ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin:
//             //sendByMe 
//             true ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
//         padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: //sendByMe
//           true ? Colors.blueGrey : Colors.grey[100],
//         ),
//         child: Text("Text Messages",//message,
//             textAlign: TextAlign.start,
//             style: TextStyle(
//                 color: //sendByMe 
//                 true ? Colors.white : Colors.black,
//                 fontSize: 17,
//                 fontWeight: FontWeight.w500)),
//       ),
//     );
//   }
// }
