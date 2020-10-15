import 'package:cache_image/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_refresh_indicator/lazy_load_refresh_indicator.dart';
import 'package:learning_basics/components/body_builder.dart';
import 'package:learning_basics/getx_logic/home_logic.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Home extends StatelessWidget {
  final controller=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return  Obx(()=>
    Scaffold(
      body: BodyBuilder(
        apiRequestStatus: controller.apiRequestStatus.value,
        reload: controller.getFeeds,
        child: _buildBodyWidget(),
      ),
    ),
    );
  }

Widget _buildBodyWidget(){
return LiquidPullToRefresh(
  springAnimationDurationInMilliseconds: 500,
  onRefresh: controller.getFeeds,
  child: ListView.builder(
      itemBuilder: (context, value) {
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(
              controller.apiResponseModel.data[value].avatar),),
          title: Text(controller.apiResponseModel.data[value]
              .firstName),
          subtitle: Text(controller.apiResponseModel.data[value]
              .email),
          onTap: () {
            final snackBar = SnackBar(
              duration: Duration(milliseconds: 800),
              content: Text(
                  controller.apiResponseModel.data[value].lastName),
              action: SnackBarAction(
                  label: 'I am a old and ugly snackbar :(',
                  onPressed: () {}
              ),
            );
            Scaffold.of(context).showSnackBar(snackBar);
// Get.snackbar('',controller.apiResponseModel.data[value].lastName,snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.grey.shade600,snackStyle: SnackStyle.GROUNDED);
          },
        );
      },
      itemCount: controller?.apiResponseModel?.data?.length??0,
    ),
  );
}
}



//<<<<<<<<<<<<<----------------------------------------------------------------->
/*

 */