import '../../../core/util/dio_request_entity.dart';

class GetCalendarRequest {
  final int year;
  final int month;

  const GetCalendarRequest({required this.year, required this.month});

  Future<DioRequestEntity> toRequest() async {
    return DioRequestEntity(data: {"year": year, "month": month});
  }
}
