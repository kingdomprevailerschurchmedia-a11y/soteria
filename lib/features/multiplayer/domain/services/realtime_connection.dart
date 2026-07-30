import '../models/connection_models.dart';

abstract class RealtimeConnection {
  Stream<ConnectionState> get connectionState;
  Future<void> connect();
  Future<void> disconnect();
  Future<void> send(String channel, Map<String, dynamic> data);
  Stream<Map<String, dynamic>> subscribe(String channel);
}
