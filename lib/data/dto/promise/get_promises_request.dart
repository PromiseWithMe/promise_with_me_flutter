import '../../../core/util/dio_request_entity.dart';

class GetPromisesRequest {
  final int page;
  final List<String> dayOfWeek;

  const GetPromisesRequest({required this.page, required this.dayOfWeek});

  Future<DioRequestEntity> toRequest() async {
    return DioRequestEntity(
      queryParameters: {"page": page},
      data: {"dayOfWeek": dayOfWeek},
    );
  }
}
