import 'package:file_picker/file_picker.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:open_file/open_file.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zarf/dummydata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io';

import 'fullscreen_page.dart';


class ChatMessage{
  String messageContent;
  String messagePath;
  String messageType;
  ChatMessage({ this.messageContent="",this.messagePath="", this.messageType=""});

}




class ref_messages extends StatefulWidget{
  static const routeName = '/ref_messages';
  @override
  _ref_messagesState createState() => _ref_messagesState();
}

class _ref_messagesState extends State<ref_messages> {


  final TextEditingController eCtrl = new TextEditingController();
  ScrollController controller=new ScrollController();

  final ImagePicker _picker = ImagePicker();
  dynamic myimage;
  dynamic doc;
  FilePickerResult result;
  _imageCamera() async {
    final XFile photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      setState(()  {
        myimage = File(photo.path);
      });
    }
  }


  _imageGallery() async {
    final XFile image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        myimage = File(image.path);

      });
    }
  }


  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.file_copy),
                      title: const Text('Choose Document'),
                      onTap: () async {
                         result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: [ 'pdf', 'doc'],
                        );
                        if (result != null) {
                          doc = File(result.files.single.path);
                          //final directory = await getApplicationDocumentsDirectory();
                          String path = result.files.single.path;
                          Navigator.of(context).pop();

                          String url = await dbMain.ChatDocUpload(doc);
                          dbMain.updatePaths(url, path);
                          setState(() {
                            messages.add(ChatMessage(messageContent: url,messagePath:path.split('/').last,messageType: "sender"));
                          });

                        } else {
                          // User canceled the picker
                        }



                      }),
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Choose from library'),
                      onTap: () {
                        _imageGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imageCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  void initState() {
    super.initState();

  }
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
          AppLocalizations.of(context).messages,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'InterBold'
          ),
        ),
      ),
      body: myimage==null && doc==null?
      Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: ListView.builder(
              controller: controller,

              itemCount: messages.length,
              shrinkWrap: true,
              //physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 2,bottom: 2),
                  child: messages[index].messageType == "receiver"?
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.only(topRight: Radius.circular(16.0),bottomRight: Radius.circular(16.0),bottomLeft: Radius.circular(16.0)),
                        color: Color(0xff03045E),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(messages[index].messageContent, style: TextStyle(fontFamily: ('inter'),fontWeight: FontWeight.w500,fontSize: 14, color: (Colors.white)),),
                    ),
                  ):
                  Align(
                    alignment: (Alignment.topRight),
                    child: messages[index].messageContent.contains("userimages")?
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => fullscreen_page(image: messages[index].messageContent, //widget.institute.institutedetails.images[index],
                                )
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: (BorderRadius.only(bottomLeft: Radius.circular(16.0),topRight: Radius.circular(16.0),topLeft: Radius.circular(16.0))),
                          color: (Colors.white),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Image.network(
                          messages[index].messageContent,
                          height: 100,
                          fit: BoxFit.fill,
                        )
                      ),
                    )
                        :messages[index].messageContent.contains("userDocs")?
                    InkWell(
                      onTap: () async{
                        String path=await dbMain.getPath(messages[index].messageContent);
                        OpenFile.open(path);
                        print("opened");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff03045e)),
                          borderRadius: (BorderRadius.only(bottomLeft: Radius.circular(16.0),topRight: Radius.circular(16.0),topLeft: Radius.circular(16.0))),
                          color: (Colors.white),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text( messages[index].messagePath, style: TextStyle(fontFamily: ('inter'),fontWeight: FontWeight.w800,fontSize: 17, color: (Color((0xff707C97)))),),
                      ),
                    ):
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: (BorderRadius.only(bottomLeft: Radius.circular(16.0),topRight: Radius.circular(16.0),topLeft: Radius.circular(16.0))),
                        color: (Colors.white),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(messages[index].messageContent, style: TextStyle(fontFamily: ('inter'),fontWeight: FontWeight.w500,fontSize: 14, color: (Color((0xff707C97)))),),
                    )
                  )
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                height: 60,
                width: width,
              ),
            ),
          ),
          Positioned(

            bottom: 5,
            child: Container(
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 10),
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
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      _showPicker(context);

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
                      controller: eCtrl,
                      onTap: (){
                        controller.animateTo(
                          controller.position.maxScrollExtent,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                      onSubmitted: (text) async {
                        messages.add(ChatMessage(messageContent: text,messageType: "sender"));  // Append Text to the list
                        await dbMain.updateChats(text);
                        eCtrl.clear();
                        controller.animateTo(
                          controller.position.maxScrollExtent,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );// Clear the Text area
                        //setState(() {});   // Redraw the Stateful Widget
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context).typeMessage,
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
                    onPressed: () async {
                      await dbMain.updateChats(eCtrl.text);
                      setState(() {
                        messages.add(ChatMessage(messageContent: eCtrl.text,messageType: "sender"));  // Append Text to the list
                        eCtrl.clear();
                      });
                      controller.animateTo(
                        controller.position.maxScrollExtent,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );

                    },
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Color(0xff03045E),
                    elevation: 0,
                  ),
                ],

              ),
            ),
          ),
        ],
      )
      :Container(
            child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: height-200,
                child: myimage!=null?
                Image.file(
                  myimage,
                  fit: BoxFit.contain,
                ):doc!=null?
                PDFView(
                  filePath: result.paths.single
                  ,
                ):
                PDFView(
                  filePath: result.paths.single
                  ,
                ),

              ),
              Container(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () async {
                    if(myimage!=null)
                      {
                        String url= await dbMain.ChatPhotoUpload(myimage,"chatpic");
                        setState(() {
                          messages.add(ChatMessage(messageContent: url,messageType: "sender"));
                          myimage=null;

                        });
                      }
                    else
                      {
                        String path = result.files.single.path;

                        String url = await dbMain.ChatDocUpload(doc);
                        dbMain.updatePaths(url, path);
                        setState(() {
                          messages.add(ChatMessage(messageContent: url,messagePath:path.split('/').last,messageType: "sender"));
                        });
                        doc=null;

                      }


                  },
                  backgroundColor: Color(0xff03045e),
                  child: Icon(
                    Icons.send,
                  ),
                ),
              )
            ],
          )
      )

      

    );
  }
}


