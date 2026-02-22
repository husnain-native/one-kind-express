import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/utils/responsive.dart';
import '../../core/widgets/lux_card.dart';
import '../../models/order.dart';
import '../../theme/app_theme.dart';

class OrderTrackingDetailScreen extends StatelessWidget {
  const OrderTrackingDetailScreen({required this.order, super.key});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    final events = order.trackingEvents ?? [];
    final origin = order.origin ?? order.subtitle.split(' → ').first;
    final destination =
        order.destination ?? order.subtitle.split(' → ').last;

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: AppColors.gold),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Tracking Details',
          style: TextStyle(
            fontSize: r.sp(18),
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: r.wp(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: r.hp(1)),
            LuxCard(
              padding: EdgeInsets.symmetric(
                vertical: r.hp(2),
                horizontal: r.wp(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Origin',
                              style: TextStyle(
                                fontSize: r.sp(11),
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(height: r.hp(0.4)),
                            Text(
                              origin,
                              style: TextStyle(
                                fontSize: r.sp(15),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        height: r.hp(4),
                        color: Colors.white.withOpacity(0.1),
                      ),
                      SizedBox(width: r.wp(4)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Destination',
                              style: TextStyle(
                                fontSize: r.sp(11),
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(height: r.hp(0.4)),
                            Text(
                              destination,
                              style: TextStyle(
                                fontSize: r.sp(15),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: r.hp(1.6)),
                  Divider(height: 1, color: Colors.white.withOpacity(0.08)),
                  SizedBox(height: r.hp(1.6)),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tracking ID',
                              style: TextStyle(
                                fontSize: r.sp(11),
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(height: r.hp(0.4)),
                            Text(
                              order.id,
                              style: TextStyle(
                                fontSize: r.sp(13),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: r.hp(0.6),
                          horizontal: r.wp(3),
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(order.status)
                              .withOpacity(0.15),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          _getStatusLabel(order.status),
                          style: TextStyle(
                            fontSize: r.sp(10),
                            color: _getStatusColor(order.status),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: r.hp(2.4)),
            Text(
              'Tracking Timeline',
              style: TextStyle(
                fontSize: r.sp(16),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: r.hp(2)),
            if (events.isEmpty)
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: r.hp(4)),
                  child: Text(
                    'No tracking events available',
                    style: TextStyle(
                      fontSize: r.sp(14),
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              )
            else
              ...events.asMap().entries.map((entry) {
                final index = entry.key;
                final event = entry.value;
                final isLast = index == events.length - 1;

                return _TimelineItem(
                  event: event,
                  isLast: isLast,
                  isActive: event.isActive,
                );
              }),
            SizedBox(height: r.hp(4)),
          ],
        ),
      ),
    );
  }

  String _getStatusLabel(OrderStatus status) {
    switch (status) {
      case OrderStatus.onTheWay:
        return 'On the way';
      case OrderStatus.inReview:
        return 'In review';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.failed:
        return 'Failed';
      case OrderStatus.returned:
        return 'Returned';
    }
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.onTheWay:
        return AppColors.success;
      case OrderStatus.inReview:
        return AppColors.warning;
      case OrderStatus.delivered:
        return AppColors.success;
      case OrderStatus.failed:
        return AppColors.danger;
      case OrderStatus.returned:
        return AppColors.warning;
    }
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.event,
    required this.isLast,
    required this.isActive,
  });

  final TrackingEvent event;
  final bool isLast;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    final dateFormat = DateFormat('MMM dd, yyyy');
    final dateStr = dateFormat.format(event.date);

    final circleColor = isActive ? AppColors.success : AppColors.textSecondary;
    final lineColor = isActive
        ? AppColors.success.withOpacity(0.3)
        : Colors.white.withOpacity(0.08);
    final textColor = isActive ? AppColors.textPrimary : AppColors.textSecondary;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: r.wp(20),
          child: Text(
            dateStr,
            style: TextStyle(
              fontSize: r.sp(11),
              color: AppColors.textSecondary,
            ),
          ),
        ),
        SizedBox(width: r.wp(3)),
        Column(
          children: [
            Container(
              width: r.wp(4.5),
              height: r.wp(4.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleColor,
                border: Border.all(
                  color: isActive
                      ? AppColors.success
                      : Colors.white.withOpacity(0.2),
                  width: isActive ? 2 : 1,
                ),
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: AppColors.success.withOpacity(0.4),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
            ),
            if (!isLast)
              Container(
                width: 1.5,
                height: r.hp(6),
                margin: EdgeInsets.symmetric(vertical: r.hp(0.4)),
                decoration: BoxDecoration(
                  color: lineColor,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
          ],
        ),
        SizedBox(width: r.wp(3)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : r.hp(2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.description,
                  style: TextStyle(
                    fontSize: r.sp(13),
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                SizedBox(height: r.hp(0.4)),
                Text(
                  event.location,
                  style: TextStyle(
                    fontSize: r.sp(11),
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
