import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({ this.messageContent, this.messageType});
}




class ref_messages extends StatefulWidget{
  static const routeName = '/ref_messages';
  @override
  _ref_messagesState createState() => _ref_messagesState();
}

class _ref_messagesState extends State<ref_messages> {

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello! Finally found the time to write. I need your help with creating interactive animations for my mobile application.", messageType: "receiver"),
    ChatMessage(messageContent: "Can I send you files?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey! Okay, send out.", messageType: "sender"),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();

          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,),
        ),
        title: Text(
          'Messages',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'InterBold'
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: (messages[index].messageType  == "receiver"? BorderRadius.only(topRight: Radius.circular(16.0),bottomRight: Radius.circular(16.0),bottomLeft: Radius.circular(16.0)) : BorderRadius.only(bottomLeft: Radius.circular(16.0),topRight: Radius.circular(16.0),topLeft: Radius.circular(16.0))),
                      color: (messages[index].messageType  == "receiver"?Color(0xff03045E):Colors.white),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(messages[index].messageContent, style: TextStyle(fontFamily: ('inter'),fontWeight: FontWeight.w500,fontSize: 14, color: (messages[index].messageType  == "receiver"?Colors.white:Color((0xff707C97)))),),
                  ),
                ),
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Color(0xff8a959e).withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 40,
                    offset: Offset(0,8),

                  )],
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffF1F5F9),
                ),
                padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                height: 60,
                width: width,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color(0xff03045E),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 20, ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "Type a message here",
                            hintStyle: TextStyle(
                              color: Color(0xff4B5563),
                              fontFamily: ('inter'),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,

                            ),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    ImageIcon(
                      AssetImage("assets/images/ref16.png"),
                      size: 26,
                      color: Color(0xff03045E),
                    ),
                    SizedBox(width: 15,),
                    FloatingActionButton(
                      onPressed: (){},
                      child: Icon(Icons.send,color: Colors.white,size: 18,),
                      backgroundColor: Color(0xff03045E),
                      elevation: 0,
                    ),
                  ],

                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}


