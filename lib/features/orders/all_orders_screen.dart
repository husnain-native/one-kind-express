import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../core/widgets/lux_card.dart';
import '../../models/order.dart';
import '../../theme/app_theme.dart';
import 'order_tracking_detail_screen.dart';

enum _OrderFilter { all, active, completed }

class AllOrdersScreen extends StatefulWidget {
  const AllOrdersScreen({super.key});

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  _OrderFilter _filter = _OrderFilter.all;

  List<Order> get _filteredOrders {
    switch (_filter) {
      case _OrderFilter.all:
        return demoOrders;
      case _OrderFilter.active:
        return demoOrders
            .where((o) =>
                o.status == OrderStatus.onTheWay ||
                o.status == OrderStatus.inReview)
            .toList();
      case _OrderFilter.completed:
        return demoOrders
            .where((o) =>
                o.status == OrderStatus.delivered ||
                o.status == OrderStatus.failed ||
                o.status == OrderStatus.returned)
            .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    final orders = _filteredOrders;
    final total = demoOrders.length;
    final active = demoOrders
        .where((o) =>
            o.status == OrderStatus.onTheWay ||
            o.status == OrderStatus.inReview)
        .length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: r.hp(1)),
        Text(
          'All orders',
          style: TextStyle(
            fontSize: r.sp(20),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: r.hp(1)),
        Text(
          '$active active • $total total shipments',
          style: TextStyle(
            fontSize: r.sp(11),
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: r.hp(2)),
        Row(
          children: [
            _FilterChip(
              label: 'All',
              isActive: _filter == _OrderFilter.all,
              onTap: () => setState(() => _filter = _OrderFilter.all),
            ),
            SizedBox(width: r.wp(2)),
            _FilterChip(
              label: 'Active',
              isActive: _filter == _OrderFilter.active,
              onTap: () => setState(() => _filter = _OrderFilter.active),
            ),
            SizedBox(width: r.wp(2)),
            _FilterChip(
              label: 'Completed',
              isActive: _filter == _OrderFilter.completed,
              onTap: () => setState(() => _filter = _OrderFilter.completed),
            ),
            const Spacer(),
            Icon(Icons.tune_rounded,
                size: r.sp(18), color: AppColors.textSecondary),
          ],
        ),
        SizedBox(height: r.hp(2)),
        Expanded(
          child: orders.isEmpty
              ? Center(
                  child: Text(
                    'No orders found',
                    style: TextStyle(
                      fontSize: r.sp(14),
                      color: AppColors.textSecondary,
                    ),
                  ),
                )
              : ListView.separated(
                  padding: EdgeInsets.only(bottom: r.hp(12)),
                  itemBuilder: (_, index) {
                    final order = orders[index];
              return LuxCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => OrderTrackingDetailScreen(order: order),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      width: r.wp(11),
                      height: r.wp(11),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white.withOpacity(0.05),
                      ),
                      child: Icon(
                        Icons.inventory_2_rounded,
                        color: AppColors.gold,
                        size: r.sp(18),
                      ),
                    ),
                    SizedBox(width: r.wp(3)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  order.title,
                                  style: TextStyle(
                                    fontSize: r.sp(13),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              _StatusPill(status: order.status),
                            ],
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
                              Row(
                                children: [
                                  Icon(Icons.schedule_rounded,
                                      size: r.sp(12),
                                      color: AppColors.textSecondary),
                                  SizedBox(width: r.wp(1)),
                                  Text(
                                    '${order.date.hour.toString().padLeft(2, '0')}:${order.date.minute.toString().padLeft(2, '0')}',
                                    style: TextStyle(
                                      fontSize: r.sp(10),
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: r.wp(1.5)),
                    Icon(Icons.chevron_right_rounded,
                        size: r.sp(20), color: AppColors.textSecondary),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => SizedBox(height: r.hp(1.2)),
            itemCount: orders.length,
          ),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    final bgColor = isActive
        ? AppColors.gold.withOpacity(0.18)
        : Colors.white.withOpacity(0.04);
    final textColor = isActive ? AppColors.gold : AppColors.textSecondary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: r.hp(0.6),
          horizontal: r.wp(3),
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: isActive
                ? AppColors.gold.withOpacity(0.7)
                : Colors.white.withOpacity(0.1),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: r.sp(10),
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);
    final (label, color) = switch (status) {
      OrderStatus.onTheWay => ('On the way', AppColors.success),
      OrderStatus.inReview => ('In review', AppColors.warning),
      OrderStatus.delivered => ('Delivered', AppColors.success),
      OrderStatus.failed => ('Failed', AppColors.danger),
      OrderStatus.returned => ('Returned', AppColors.warning),
    };

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: r.hp(0.6),
        horizontal: r.wp(3),
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: r.sp(10),
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

