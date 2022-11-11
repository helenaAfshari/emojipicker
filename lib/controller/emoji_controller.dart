
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmojiPickerControllerr extends GetxController{
 FocusNode focusNode = FocusNode();
  var isEmoji = false.obs;
  TextEditingController textEditingController=TextEditingController();
  
  @override 
  void onInit() {
    super.onInit();
   // show emoji keyboard or text keyboard
    focusNode.addListener(() {
      isEmoji.value=false;
    });

  }
    @override 
   void onClose() {
    super.onClose();
    textEditingController.dispose();
  }
}