import 'dart:io';

import 'package:get/get.dart';
import 'package:learning_basics/models/api_response_model.dart';
import 'package:learning_basics/services/api_servic.dart';
import 'package:learning_basics/util/enum/api_request_status.dart';
import 'package:learning_basics/util/enum/functions.dart';

class HomeController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFeeds();
  }

  var apiRequestStatus = APIRequestStatus.loading.obs;
  APIService api = APIService();
  APIResponseModel apiResponseModel=APIResponseModel();

  Future<void> getFeeds() async {
    setApiRequestStatus(APIRequestStatus.loading);
    print('printing from getx + value of apistatus is ${apiRequestStatus.value}');
    try {
      apiResponseModel = await api.fetchapi();
      print('printing from getx + value of apiResponsemodel is ${apiResponseModel.data[0].email}');
      setApiRequestStatus(APIRequestStatus.loaded);
      print('printing from getx + value of apistatus is ${apiRequestStatus.value}');
    } catch (e) {
      checkError(e);
    }
  }

//  void setTop(value) {
//    top .value= value;
//  }
//  APIResponseModel getTop() {
//    return top.value;
//  }

  void setApiRequestStatus(APIRequestStatus value) {
    apiRequestStatus.value = value;
  }

  void checkError(e) {
    if (Functions.checkConnectionError(e)) {
      setApiRequestStatus(APIRequestStatus.connectionError);
    } else {
      setApiRequestStatus(APIRequestStatus.error);
    }
  }}


//  var isloading = false.obs;
////APIService apiService=APIService();
//  APIResponseModel apiResponseModel = APIResponseModel();
//  APIService apiService = APIService();
//
//  Future<void> callapifunction() async {
//    print(isloading.value);
////  response1.status=Status.LOADING;
////  apiResponseModel.value=APIResponseModel();
//    isloading.value = true;
//    print(isloading.value);
//    apiResponseModel = await APIService().fetchapi();
//    // response1.status=Status.COMPLETED;
//    //print(response1.status);
//    print('Printing from getx class ${apiResponseModel.data[0].email}');
//    isloading.value = false;
//    print(isloading.value);
//  }
//}

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
