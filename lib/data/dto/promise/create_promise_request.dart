import '../../../core/util/dio_get_model.dart';

class CreatePromiseRequest {
  final String title;
  final List<String> dayOfWeek;

  const CreatePromiseRequest({required this.title, required this.dayOfWeek});

  Future<DioGetReqModel> toDioRequest() async {
    return DioGetReqModel(data: {"title": title, "dayOfWeek": dayOfWeek});
  }
}
