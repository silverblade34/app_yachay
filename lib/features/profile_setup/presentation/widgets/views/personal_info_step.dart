import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/features/profile_setup/controllers/profile_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PersonalInfoStep extends StatelessWidget {
  PersonalInfoStep({super.key});

  final ProfileSetupController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24), // Menos padding arriba
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ya no necesitamos título aquí porque está en el header dinámico
          SizedBox(height: 16), // Espacio reducido
          
          // Nombres
          _buildTextField(
            label: 'Nombres',
            hint: 'Ingresa tus nombres',
            onChanged: (value) => controller.nombres.value = value,
          ),
          SizedBox(height: 16),

          // Apellidos
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  label: 'Apellido Paterno',
                  hint: 'Apellido paterno',
                  onChanged: (value) =>
                      controller.apellidoPaterno.value = value,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildTextField(
                  label: 'Apellido Materno',
                  hint: 'Apellido materno',
                  onChanged: (value) =>
                      controller.apellidoMaterno.value = value,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Sexo
          _buildDropdown(
            label: 'Sexo',
            items: controller.sexoOptions,
            onChanged: (value) => controller.sexo.value = value ?? '',
          ),
          SizedBox(height: 16),

          // Nivel Académico
          _buildDropdown(
            label: 'Nivel Académico',
            items: controller.nivelAcademicoOptions,
            onChanged: (value) {
              controller.nivelAcademico.value = value ?? '';
              if (value != 'Universitario') {
                controller.carrera.value = '';
              }
            },
          ),
          SizedBox(height: 16),

          // Carrera (solo si es universitario)
          Obx(() {
            if (controller.nivelAcademico.value == 'Universitario') {
              return Column(
                children: [
                  _buildTextField(
                    label: 'Carrera',
                    hint: 'Ingresa tu carrera',
                    onChanged: (value) => controller.carrera.value = value,
                  ),
                  SizedBox(height: 16),
                ],
              );
            }
            return SizedBox.shrink();
          }),

          // Fecha de nacimiento
          _buildDateField(),

          SizedBox(height: 40),
          // El botón de navegación ahora está en la parte inferior de la página principal
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.textDarkTitle,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundDarkIntense,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.primary.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: TextField(
            onChanged: onChanged,
            style: TextStyle(color: AppColors.textDark),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: AppColors.textDarkSubtitle),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.textDarkTitle,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundDarkIntense,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.primary.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: DropdownButtonFormField<String>(
            onChanged: onChanged,
            dropdownColor: AppColors.backgroundDarkIntense,
            style: TextStyle(color: AppColors.textDark),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            items: items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fecha de Nacimiento',
          style: TextStyle(
            color: AppColors.textDarkTitle,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            final date = await showDatePicker(
              context: Get.context!,
              initialDate: DateTime.now()
                  .subtract(Duration(days: 6570)), // 18 años atrás
              firstDate: DateTime(1950),
              lastDate: DateTime.now(),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.dark(
                      primary: AppColors.primary,
                      surface: AppColors.backgroundDarkIntense,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (date != null) {
              controller.fechaNacimiento.value = date;
            }
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.backgroundDarkIntense,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  final date = controller.fechaNacimiento.value;
                  return Text(
                    date != null
                        ? "${date.day}/${date.month}/${date.year}"
                        : "Selecciona tu fecha de nacimiento",
                    style: TextStyle(
                      color: date != null
                          ? AppColors.textDark
                          : AppColors.textDarkSubtitle,
                    ),
                  );
                }),
                Icon(
                  Icons.calendar_today,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}