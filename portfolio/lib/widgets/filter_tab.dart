import 'package:flutter/material.dart';
import '../constants/colors.dart';

class FilterTab extends StatelessWidget {
  final String label;
  final bool isActive;
  const FilterTab({super.key, required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryCyan : AppColors.cardBg,
        borderRadius: BorderRadius.circular(8),
        border: isActive
            ? null
            : Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? AppColors.bgColor : AppColors.secondaryGrey,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
