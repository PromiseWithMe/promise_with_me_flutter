class WellPromiseRequest {
  final String id, title;

  const WellPromiseRequest({required this.id, required this.title});

  Future<Map<String, String>> toRequest() async {
    return {"promiseId": id, "message": title};
  }
}
