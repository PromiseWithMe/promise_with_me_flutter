import '../../../core/util/dio_request_entity.dart';

class DeletePromiseRequest {
  final String id;

  const DeletePromiseRequest({required this.id});

  Future<DioRequestEntity> toRequest() async {
    return DioRequestEntity(id: id);
  }
}
