class NotificationModel {
  final Type type;
  final String typeNotification;
  final String message;

  NotificationModel({
    required this.type,
    required this.message,
    required this.typeNotification,
  });
}

enum Type { sure, cancel, info, reminder }
