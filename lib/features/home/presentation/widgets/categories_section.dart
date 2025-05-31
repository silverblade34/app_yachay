import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/config/constants/responsive.dart';
import 'package:app_yachay/features/home/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppResponsive.paddingSymmetric(horizontal: 24, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.book,
                color: AppColors.primary,
                size: AppResponsive.iconSizeMedium,
              ),
              AppResponsive.horizontalSpace8,
              Text(
                'Explorar Categorías',
                style: AppResponsive.textStyle(
                  color: AppColors.textDark,
                  fontSize: AppResponsive.fontSizeLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          AppResponsive.verticalSpace16,
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppResponsive.spacing16,
              mainAxisSpacing: AppResponsive.spacing16,
              childAspectRatio: 1.1,
            ),
            itemCount: _getCategories().length,
            itemBuilder: (context, index) {
              final category = _getCategories()[index];
              return CategoryCard(category: category);
            },
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getCategories() {
    return [
      {
        'name': 'Matemáticas',
        'icon': '📊',
        'color': Colors.blue.shade500,
        'tests': 1234,
        'progress': 0.7,
      },
      {
        'name': 'Ciencias',
        'icon': '🧪',
        'color': Colors.green.shade500,
        'tests': 856,
        'progress': 0.5,
      },
      {
        'name': 'Historia',
        'icon': '📚',
        'color': Colors.purple.shade500,
        'tests': 642,
        'progress': 0.8,
      },
      {
        'name': 'Idiomas',
        'icon': '🌍',
        'color': Colors.orange.shade500,
        'tests': 978,
        'progress': 0.6,
      },
      {
        'name': 'Arte',
        'icon': '🎨',
        'color': Colors.pink.shade500,
        'tests': 423,
        'progress': 0.4,
      },
      {
        'name': 'Tecnología',
        'icon': '💻',
        'color': Colors.indigo.shade500,
        'tests': 567,
        'progress': 0.9,
      },
    ];
  }
}
