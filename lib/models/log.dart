class Log {
  final String action;
  final String timestamp;
  final String status;

  Log({
    required this.action,
    required this.timestamp,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'action': action,
      'timestamp': timestamp,
      'status': status,
    };
  }

  factory Log.fromMap(Map<String, dynamic> map) {
    return Log(
      action: map['action'],
      timestamp: map['timestamp'],
      status: map['status'],
    );
  }
}
