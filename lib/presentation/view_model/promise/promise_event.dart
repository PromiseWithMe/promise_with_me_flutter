import 'package:promise_with_me_flutter/data/dto/promise/get_promises_request.dart';

abstract class PromiseEvent {}

class GetPromisesEvent extends PromiseEvent {
  final GetPromisesRequest getPromisesRequest;

  GetPromisesEvent({required this.getPromisesRequest});
}
