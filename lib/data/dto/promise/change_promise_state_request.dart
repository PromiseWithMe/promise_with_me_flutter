import 'package:promise_with_me_flutter/core/util/enum/promise_state_enum.dart';

import '../../../core/util/dio_request_entity.dart';

class ChangePromiseStateRequest {
  final String id;
  final PromiseState state;

  const ChangePromiseStateRequest({required this.id, required this.state});

  Future<DioRequestEntity> toRequest() async {
    return DioRequestEntity(id: id, data: {"promiseState": state.name});
  }
}
