abstract class DiaryEvent {}

class GetDiaryEvent extends DiaryEvent {}

class SetDiaryEvent extends DiaryEvent {
  final String data;

  SetDiaryEvent({required this.data});
}
