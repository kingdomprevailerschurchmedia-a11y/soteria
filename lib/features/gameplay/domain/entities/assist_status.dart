/// Represents the current status of a Knowledge Assist.
enum AssistStatus {
  available,
  used,
  disabled,
  cooldown;

  bool get isAvailable => this == AssistStatus.available;
  bool get isUsed => this == AssistStatus.used;
}
