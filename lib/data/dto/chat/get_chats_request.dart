import '../../../core/util/dio_request_entity.dart';

class GetChatsRequest {
  final String promiseId;

  const GetChatsRequest({required this.promiseId});

  Future<DioRequestEntity> toRequest() async {
    return DioRequestEntity(id: promiseId);
  }
}
