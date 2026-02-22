import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../core/widgets/lux_card.dart';
import '../../models/order.dart';
import '../../theme/app_theme.dart';
import '../orders/all_orders_screen.dart';
import '../orders/order_history_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: r.hp(1)),
        Text(
          'Good evening,',
          style: TextStyle(
            fontSize: r.sp(14),
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: r.hp(0.4)),
        Text(
          'Alexander',
          style: TextStyle(
            fontSize: r.sp(22),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: r.hp(2)),
        // LuxCard(
        //   padding: EdgeInsets.symmetric(
        //     vertical: r.hp(2),
        //     horizontal: r.wp(5),
        //   ),
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             // Text(
        //             //   'Track your luxury parcels',
        //             //   style: TextStyle(
        //             //     fontSize: r.sp(16),
        //             //     fontWeight: FontWeight.w600,
        //             //   ),
        //             // ),
        //             // SizedBox(height: r.hp(1)),
        //             Container(
        //               padding: EdgeInsets.symmetric(
        //                 vertical: r.hp(1.1),
        //                 horizontal: r.wp(3),
        //               ),
        //               decoration: BoxDecoration(
        //                 color: Colors.white.withOpacity(0.04),
        //                 borderRadius: BorderRadius.circular(16),
        //               ),
        //               child: Row(
        //                 children: [
        //                   const Icon(Icons.search_rounded,
        //                       color: AppColors.textSecondary),
        //                   SizedBox(width: r.wp(2)),
        //                   Expanded(
        //                     child: Text(
        //                       'Enter tracking code',
        //                       style: TextStyle(
        //                         color: AppColors.textSecondary,
        //                         fontSize: r.sp(11),
        //                       ),
        //                     ),
        //                   ),
        //                   Container(
        //                     padding: EdgeInsets.all(r.wp(2)),
        //                     decoration: const BoxDecoration(
        //                       color: AppColors.gold,
        //                       shape: BoxShape.circle,
        //                     ),
        //                     child: Icon(
        //                       Icons.near_me_rounded,
        //                       size: r.sp(18),
        //                       color: AppColors.black,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       SizedBox(width: r.wp(3)),
        //       Icon(
        //         Icons.local_shipping_rounded,
        //         size: r.sp(32),
        //         color: AppColors.gold,
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(height: r.hp(2.5)),
        Text(
          'Quick actions',
          style: TextStyle(
            fontSize: r.sp(14),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: r.hp(1.5)),
        SizedBox(
          height: r.hp(14),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _QuickCard(
                label: 'Track\nOrder',
                icon: Icons.qr_code_scanner_rounded,
                isActive: true,
              ),
              _QuickCard(
                label: 'Active\nOrders',
                icon: Icons.flash_on_rounded,
              ),
              _QuickCard(
                label: 'Order\nHistory',
                icon: Icons.history_rounded,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const OrderHistoryScreen(),
                    ),
                  );
                },
              ),
              _QuickCard(
                label: 'Profile',
                icon: Icons.person_rounded,
              ),
            ],
          ),
        ),
        SizedBox(height: r.hp(2.5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Active shipments',
              style: TextStyle(
                fontSize: r.sp(14),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AllOrdersScreen(),
                  ),
                );
              },
              child: Text(
                'View all',
                style: TextStyle(
                  color: AppColors.gold,
                  fontSize: r.sp(11),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(bottom: r.hp(14)),
            itemBuilder: (_, index) {
              final order = demoOrders[index];
              return _OrderTile(order: order);
            },
            separatorBuilder: (_, __) => SizedBox(height: r.hp(1.2)),
            itemCount: demoOrders.length,
          ),
        ),
      ],
    );
  }
}

class _QuickCard extends StatelessWidget {
  const _QuickCard({
    required this.label,
    required this.icon,
    this.onTap,
    this.isActive = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    return Padding(
      padding: EdgeInsets.only(right: r.wp(3)),
      child: SizedBox(
        width: r.wp(32),
        child: LuxCard(
          onTap: onTap,
          borderColor: isActive ? AppColors.gold : null,
          borderWidth: isActive ? 2 : null,
          padding: EdgeInsets.symmetric(
            vertical: r.hp(1.4),
            horizontal: r.wp(2.6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: r.sp(20), color: AppColors.gold),
              const Spacer(),
              Text(
                label,
                style: TextStyle(
                  fontSize: r.sp(11),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrderTile extends StatelessWidget {
  const _OrderTile({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final r = Responsive(context);

    final (label, color) = _statusMeta(order.status);

    return LuxCard(
      padding: EdgeInsets.symmetric(
        vertical: r.hp(1.6),
        horizontal: r.wp(4),
      ),
      child: Row(
        children: [
          Container(
            width: r.wp(11),
            height: r.wp(11),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.04),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.inventory_2_rounded,
              size: r.sp(18),
              color: AppColors.gold,
            ),
          ),
          SizedBox(width: r.wp(3.5)),
          Expanded(
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
                  order.id,
                  style: TextStyle(
                    fontSize: r.sp(11),
                    color: AppColors.textSecondary,
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
              color: color.withOpacity(0.16),
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
          ),
          SizedBox(width: r.wp(2)),
          Icon(Icons.arrow_forward_ios_rounded,
              size: r.sp(14), color: AppColors.textSecondary),
        ],
      ),
    );
  }

  (String, Color) _statusMeta(OrderStatus status) {
    switch (status) {
      case OrderStatus.onTheWay:
        return ('On the way', AppColors.success);
      case OrderStatus.inReview:
        return ('In review', AppColors.warning);
      case OrderStatus.delivered:
        return ('Delivered', AppColors.success);
      case OrderStatus.failed:
        return ('Failed', AppColors.danger);
      case OrderStatus.returned:
        return ('Returned', AppColors.warning);
    }
  }
}

