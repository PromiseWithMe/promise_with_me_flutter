import '../../../core/util/dio_request_entity.dart';

class CreatePromiseRequest {
  final String title;
  final List<String> dayOfWeek;

  const CreatePromiseRequest({required this.title, required this.dayOfWeek});

  Future<DioRequestEntity> toRequest() async {
    return DioRequestEntity(data: {"title": title, "dayOfWeek": dayOfWeek});
  }
}
