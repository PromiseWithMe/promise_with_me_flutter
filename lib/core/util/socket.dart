import 'package:flutter/material.dart';
import 'package:promise_with_me_flutter/core/util/env_values.dart';
import 'package:promise_with_me_flutter/core/util/token_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

late final IO.Socket socket;

Future<void> connectSocketIo() async {
  socket = IO.io(EnvValues.baseUrlWs, {
    'transports': ['websocket'],
    'autoConnect': true,
    'extraHeaders': {
      'Authorization': "Bearer ${await TokenStorage.findAccessToken()}",
    },
  });

  socket.onConnect((_) {
    debugPrint('연결 성공!');
  });
  socket.onDisconnect((_) {
    debugPrint('연결 해제');
  });
}
