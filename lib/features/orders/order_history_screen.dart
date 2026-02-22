import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../core/widgets/lux_card.dart';
import '../../models/order.dart';
import '../../theme/app_theme.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    final grouped = <String, List<Order>>{};
    for (final order in demoOrders) {
      final key =
          '${order.date.year}-${order.date.month.toString().padLeft(2, '0')}-${order.date.day.toString().padLeft(2, '0')}';
      grouped.putIfAbsent(key, () => []).add(order);
    }

    final entries = grouped.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: r.hp(1)),
        Text(
          'Order history',
          style: TextStyle(
            fontSize: r.sp(20),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: r.hp(2)),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: r.hp(12)),
            itemCount: entries.length,
            itemBuilder: (_, index) {
              final entry = entries[index];
              return Padding(
                padding: EdgeInsets.only(bottom: r.hp(2)),
                child: _DateSection(dateLabel: entry.key, orders: entry.value),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _DateSection extends StatelessWidget {
  const _DateSection({
    required this.dateLabel,
    required this.orders,
  });

  final String dateLabel;
  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dateLabel,
          style: TextStyle(
            fontSize: r.sp(11),
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: r.hp(0.8)),
        ...orders.map(
          (order) => Padding(
            padding: EdgeInsets.only(bottom: r.hp(1)),
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 1,
                    color: Colors.white.withOpacity(0.12),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      alignment: Alignment.center,
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.gold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: LuxCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.title,
                              style: TextStyle(
                                fontSize: r.sp(13),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: r.hp(0.4)),
                            Text(
                              order.subtitle,
                              style: TextStyle(
                                fontSize: r.sp(11),
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(height: r.hp(0.8)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  order.id,
                                  style: TextStyle(
                                    fontSize: r.sp(10),
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                _StatusLabel(status: order.status),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StatusLabel extends StatelessWidget {
  const _StatusLabel({required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    final (label, color) = switch (status) {
      OrderStatus.delivered => ('Delivered', AppColors.success),
      OrderStatus.failed => ('Failed', AppColors.danger),
      OrderStatus.returned => ('Returned', AppColors.warning),
      OrderStatus.onTheWay => ('On the way', AppColors.success),
      OrderStatus.inReview => ('In review', AppColors.warning),
    };

    return Text(
      label,
      style: TextStyle(
        fontSize: r.sp(10),
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

