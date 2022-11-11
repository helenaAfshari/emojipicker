
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:get/get.dart';

import 'controller/emoji_controller.dart';
// ignore: must_be_immutable
class EmojiPickerController extends StatelessWidget{
  Controllerr controllerr = Get.put(Controllerr());

  EmojiPickerController({super.key});
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     // click back not exit app 
     body: WillPopScope(
          onWillPop: () { 
         if(controllerr.isEmoji.value){
          controllerr.isEmoji.value=false;
         }else{
          Navigator.pop(context);
         }
         return Future.value(false);
        },
       child: Column(
        children: [
          Expanded(child: Container()),
          Container(
            height: 70,
            child: Row(
                 children: [
                  IconButton(onPressed: () {
                    controllerr.isEmoji.value=!controllerr.isEmoji.value;
                    controllerr.focusNode.unfocus();
                    controllerr.focusNode.canRequestFocus=true;
     
                  }, icon: const Icon(Icons.emoji_emotions_outlined)),
                   Expanded(
                    child:Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
                      child: TextField(
                        focusNode: controllerr.focusNode,
                        controller: controllerr.textEditingController,
                        decoration: const InputDecoration(
                        hintText: "Type Message",
                        fillColor: Colors.white,
                      ),),
                      ),
                   ),
                 ],
            ),
          ),
          Obx(
            ()=> Offstage(
              offstage: !controllerr.isEmoji.value,
              child: SizedBox(
                height: 250,
                child: EmojiPicker(
                  onEmojiSelected: (category, emoji) {
                   //when select emoji in show text in textEditing
                    controllerr.textEditingController.text=controllerr.textEditingController.text+emoji.emoji;
                  },
                  onBackspacePressed: () {
                    
                  },
                  config:  const Config(
                    columns: 7,
                    verticalSpacing: 0,
                    horizontalSpacing: 2,
                    initCategory: Category.SMILEYS,
                    emojiSizeMax: 26,
                    bgColor: Color.fromARGB(255, 190, 218, 235),
                    indicatorColor: Color.fromARGB(255, 4, 30, 53),
                    iconColor: Colors.grey,
                    iconColorSelected: Color.fromARGB(255, 4, 62, 109),
                    showRecentsTab: true,
                    recentsLimit: 5,
                     gridPadding: EdgeInsets.only(left: 10,right: 10),
                  enableSkinTones: true,
                    categoryIcons: CategoryIcons(),
                    buttonMode: ButtonMode.CUPERTINO,
          
          
                  ),
                ),
              ),
            ),
          )
        ],
       ),
    
     ),
    );
  }

}