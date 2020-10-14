import 'dart:io';

import 'package:get/get.dart';
import 'package:learning_basics/models/api_response_model.dart';
import 'package:learning_basics/models/api_status_response.dart';
import 'package:learning_basics/services/api_servic.dart';

class HomeController extends GetxController{
  HomeController(){
    callapifunction();
  }
var isloading=false.obs;
//APIService apiService=APIService();
APIResponseModel apiResponseModel=APIResponseModel();
APIService apiService=APIService();

Future<void> callapifunction() async{
  print(isloading.value);
//  response1.status=Status.LOADING;
//  apiResponseModel.value=APIResponseModel();
  isloading.value=true;
  print(isloading.value);
  apiResponseModel = await APIService().fetchapi();
   // response1.status=Status.COMPLETED;
    //print(response1.status);
    print('Printing from getx class ${apiResponseModel.data[0].email}');
    isloading.value = false;
  print(isloading.value);
}
}

// <-------------------------------Hit and Trial experiments-------------------------------->
/*
var hasConnection=true.obs;
bool recievedret;
//var apiResponseModel=APIResponseModel().obs;
  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection.value;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection.value = true;
      } else {
        hasConnection.value = false;
      }
    } on SocketException catch(_) {
      hasConnection.value = false;
    }

    //The connection status changed send out an update to all listeners
//    if (previousConnection != hasConnection.value) {
//      connectionChangeController.add(hasConnection.value);
//    }
    return hasConnection.value;
  }
 */