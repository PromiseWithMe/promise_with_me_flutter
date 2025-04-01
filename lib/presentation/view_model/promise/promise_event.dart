import 'package:promise_with_me_flutter/data/dto/promise/create_promise_request.dart';
import 'package:promise_with_me_flutter/data/dto/promise/get_promises_request.dart';

abstract class PromiseEvent {}

class GetPromisesEvent extends PromiseEvent {
  final GetPromisesRequest getPromisesRequest;

  GetPromisesEvent({required this.getPromisesRequest});
}

class InitGetPromisesEvent extends PromiseEvent {
  final GetPromisesRequest getPromisesRequest;

  InitGetPromisesEvent({required this.getPromisesRequest});
}

class CreatePromiseEvent extends PromiseEvent {
  final CreatePromiseRequest createPromiseRequest;

  CreatePromiseEvent({required this.createPromiseRequest});
}
