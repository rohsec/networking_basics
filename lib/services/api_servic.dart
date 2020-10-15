import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:learning_basics/config.dart';
import 'package:learning_basics/models/api_response_model.dart';

class APIService {
  APIResponseModel apiModel;

  Future<APIResponseModel> fetchapi() async {
    var response = await Dio().get(Config.url).catchError((e) {
      throw (e);
    });
    if (response.statusCode == 200) {
      //var decoderesponse=jsonDecode(response.data);
      apiModel = APIResponseModel.fromJson(response.data);
    } else {
      throw ('Error ${response.statusCode}');
    }
    return apiModel;
  }
}

//    on DioError catch (e) {
//      if (e.response.statusCode == 401) {
//        print('Error occured due to code 401');
//      }
//      else {
//        print('Error occured due to ${e.response.statusCode}');
//      }
//    }

//    return apiModel;
