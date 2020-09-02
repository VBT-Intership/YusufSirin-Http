import 'Error/IError.dart';
import 'IResponseModel.dart';

class ResponseModel<T> extends IResponseModel<T> {
  T map;
  List<T> list;
  IError error;
  bool isSucces = false;
}
