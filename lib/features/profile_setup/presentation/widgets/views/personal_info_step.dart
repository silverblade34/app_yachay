import 'package:app_yachay/config/constants/responsive.dart';
import 'package:app_yachay/core/widgets/custom_dropdown.dart';
import 'package:app_yachay/core/widgets/date_picker_field.dart';
import 'package:app_yachay/core/widgets/text_field_simple.dart';
import 'package:app_yachay/features/profile_setup/controllers/profile_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoStep extends StatelessWidget {
  PersonalInfoStep({super.key});

  final ProfileSetupController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppResponsive.paddingOnly(
        left: 24,
        right: 24,
        bottom: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldSimple(
            label: 'Nombres',
            hint: 'Ingresa tus nombres',
            onChanged: (value) => controller.nombres.value = value,
          ),
          AppResponsive.verticalSpace16,

          // Apellidos
          Row(
            children: [
              Expanded(
                child: TextFieldSimple(
                  label: 'Apellido Paterno',
                  hint: 'Apellido paterno',
                  onChanged: (value) =>
                      controller.apellidoPaterno.value = value,
                ),
              ),
              AppResponsive.horizontalSpace12,
              Expanded(
                child: TextFieldSimple(
                  label: 'Apellido Materno',
                  hint: 'Apellido materno',
                  onChanged: (value) =>
                      controller.apellidoMaterno.value = value,
                ),
              ),
            ],
          ),
          AppResponsive.verticalSpace16,

          // Sexo
          CustomDropdown(
            label: 'Sexo',
            items: controller.sexoOptions,
            onChanged: (value) => controller.sexo.value = value ?? '',
          ),
          AppResponsive.verticalSpace16,

          // Nivel Académico
          CustomDropdown(
            label: 'Nivel Académico',
            items: controller.nivelAcademicoOptions,
            onChanged: (value) {
              controller.nivelAcademico.value = value ?? '';
              if (value != 'Universitario') {
                controller.carrera.value = '';
              }
            },
          ),
          AppResponsive.verticalSpace16,

          // Carrera (solo si es universitario)
          Obx(() {
            if (controller.nivelAcademico.value == 'Universitario') {
              return Column(
                children: [
                  TextFieldSimple(
                    label: 'Carrera',
                    hint: 'Ingresa tu carrera',
                    onChanged: (value) => controller.carrera.value = value,
                  ),
                  AppResponsive.verticalSpace16,
                ],
              );
            }
            return SizedBox.shrink();
          }),

          // Fecha de nacimiento
          Obx(() => DatePickerField(
                label: 'Fecha de Nacimiento',
                hint: "Selecciona tu fecha de nacimiento",
                selectedDate: controller.fechaNacimiento.value,
                onDateSelected: (date) =>
                    controller.fechaNacimiento.value = date,
              )),

          AppResponsive.verticalSpace40,
        ],
      ),
    );
  }
}
