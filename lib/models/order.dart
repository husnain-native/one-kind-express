enum OrderStatus {
  onTheWay,
  inReview,
  delivered,
  failed,
  returned,
}

class TrackingEvent {
  const TrackingEvent({
    required this.date,
    required this.description,
    required this.location,
    this.isActive = false,
  });

  final DateTime date;
  final String description;
  final String location;
  final bool isActive;
}

class Order {
  const Order({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.date,
    this.distanceKm,
    this.etaMinutes,
    this.origin,
    this.destination,
    this.trackingEvents,
  });

  final String id;
  final String title;
  final String subtitle;
  final OrderStatus status;
  final DateTime date;
  final double? distanceKm;
  final int? etaMinutes;
  final String? origin;
  final String? destination;
  final List<TrackingEvent>? trackingEvents;
}

final demoOrders = <Order>[
  Order(
    id: '#RDE4354324343',
    title: 'Premium Package',
    subtitle: 'Bogotá → Texas',
    status: OrderStatus.onTheWay,
    date: DateTime.now(),
    distanceKm: 12.4,
    etaMinutes: 24,
    origin: 'Bogotá',
    destination: 'Texas',
    trackingEvents: [
      TrackingEvent(
        date: DateTime.now().subtract(const Duration(days: 5)),
        description: 'Send item abroad (EDI-received)',
        location: 'BOGOTÁ',
        isActive: false,
      ),
      TrackingEvent(
        date: DateTime.now().subtract(const Duration(days: 3)),
        description: 'Receive item at office of exchange',
        location: 'HOUSTON INTERNATIONAL MAIL OFFICE',
        isActive: false,
      ),
      TrackingEvent(
        date: DateTime.now().subtract(const Duration(days: 1)),
        description: 'Insert item into domestic bag',
        location: 'DALLAS PROCESSING CENTER',
        isActive: false,
      ),
      TrackingEvent(
        date: DateTime.now().subtract(const Duration(hours: 6)),
        description: 'Item in transit to destination',
        location: 'AUSTIN DISTRIBUTION CENTER',
        isActive: true,
      ),
    ],
  ),
  Order(
    id: '#RDE4354324344',
    title: 'Business Docs',
    subtitle: 'New York → Miami',
    status: OrderStatus.inReview,
    date: DateTime.now().subtract(const Duration(hours: 3)),
    origin: 'New York',
    destination: 'Miami',
    trackingEvents: [
      TrackingEvent(
        date: DateTime.now().subtract(const Duration(days: 2)),
        description: 'Package collected',
        location: 'NEW YORK POST OFFICE',
        isActive: false,
      ),
      TrackingEvent(
        date: DateTime.now().subtract(const Duration(hours: 5)),
        description: 'Under review',
        location: 'MIAMI CUSTOMS',
        isActive: true,
      ),
    ],
  ),
  Order(
    id: '#RDE4354324345',
    title: 'Luxury Goods',
    subtitle: 'Paris → London',
    status: OrderStatus.delivered,
    date: DateTime.now().subtract(const Duration(days: 1)),
    origin: 'Paris',
    destination: 'London',
    trackingEvents: [
      TrackingEvent(
        date: DateTime.now().subtract(const Duration(days: 3)),
        description: 'Package dispatched',
        location: 'PARIS CENTRAL',
        isActive: false,
      ),
      TrackingEvent(
        date: DateTime.now().subtract(const Duration(days: 2)),
        description: 'In transit',
        location: 'CALAIS PROCESSING',
        isActive: false,
      ),
      TrackingEvent(
        date: DateTime.now().subtract(const Duration(days: 1)),
        description: 'Delivered',
        location: 'LONDON DELIVERY CENTER',
        isActive: true,
      ),
    ],
  ),
  Order(
    id: '#RDE4354324346',
    title: 'Return Parcel',
    subtitle: 'Berlin → Rome',
    status: OrderStatus.returned,
    date: DateTime.now().subtract(const Duration(days: 4)),
    origin: 'Berlin',
    destination: 'Rome',
    trackingEvents: [
      TrackingEvent(
        date: DateTime.now().subtract(const Duration(days: 5)),
        description: 'Return initiated',
        location: 'ROME POST OFFICE',
        isActive: false,
      ),
      TrackingEvent(
        date: DateTime.now().subtract(const Duration(days: 4)),
        description: 'Returned to sender',
        location: 'BERLIN RETURN CENTER',
        isActive: true,
      ),
    ],
  ),
];

