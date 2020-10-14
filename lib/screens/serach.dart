import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_basics/getx_logic/expore_logic.dart';

class Search extends StatelessWidget {
  final controller = Get.put(ExploreController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
controller.increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
      child: Obx(()=>Text('Explore1 + ${controller.counter}')),
    ),);
  }
}
