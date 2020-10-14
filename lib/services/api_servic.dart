import 'dart:io';

import 'package:dio/dio.dart';
import 'package:learning_basics/config.dart';
import 'package:learning_basics/models/api_response_model.dart';
import 'package:learning_basics/services/exception.dart';


class APIService {
  APIResponseModel apiModel;
  bool ret = false;

  Future<dynamic> fetchapi() async {
    var response = await Dio().get(Config.url);
    print(response.data);
    try {
        apiModel =_response(response);
        print('printing from try bock+ ${apiModel.data[0].lastName}');
    }
    on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return apiModel;
//    on DioError catch (e) { 
//      if (e.response.statusCode == 401) {
//        print('Error occured due to code 401');
//      }
//      else {
//        print('Error occured due to ${e.response.statusCode}');
//      }
//    }

//    return apiModel;
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        apiModel = APIResponseModel.fromJson(response.data);
        return apiModel;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode ${response
                .statusCode}');
    }
  }
}