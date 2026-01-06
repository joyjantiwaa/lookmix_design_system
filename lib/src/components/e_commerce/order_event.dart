class OrderEvent {
  final String id;
  final String status;
  final String description;
  final String timestamp;
  final bool isCompleted;

  OrderEvent({
    required this.id,
    required this.status,
    required this.description,
    required this.timestamp,
    required this.isCompleted,
  });
}