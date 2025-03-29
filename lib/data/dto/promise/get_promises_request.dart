import '../../../core/util/dio_get_model.dart';

class GetPromisesRequest {
  final int page;
  final List<String> dayOfWeek;

  const GetPromisesRequest({required this.page, required this.dayOfWeek});

  Future<DioGetReqModel> toDioRequest() async {
    return DioGetReqModel(
      queryParameters: {"page": page},
      data: {"dayOfWeek": dayOfWeek},
    );
  }
}
