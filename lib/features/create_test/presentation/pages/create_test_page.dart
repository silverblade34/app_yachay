import 'package:app_yachay/config/constants/colors.dart';
import 'package:app_yachay/features/create_test/controllers/create_test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CreateTestPage extends GetView<CreateTestController> {
  const CreateTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildProgressIndicator(),
            Expanded(
              child: Obx(() => _buildStepContent()),
            ),
            _buildNavigationButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.backgroundDarkIntense,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Crear Prueba',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.auto_awesome,
                  color: AppColors.accent,
                  size: 16,
                ),
                SizedBox(width: 4),
                Text(
                  'IA',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(() => Row(
        children: List.generate(3, (index) {
          bool isActive = index <= controller.currentStep.value;
          bool isCompleted = index < controller.currentStep.value;
          
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(right: index < 2 ? 8 : 0),
              child: Column(
                children: [
                  Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.primary : AppColors.backgroundDarkIntense,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: isCompleted ? AppColors.primary : 
                                 isActive ? AppColors.primary : AppColors.backgroundDarkIntense,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isCompleted ? Icons.check : Icons.circle,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          ['Información', 'Configuración', 'Revisión'][index],
                          style: TextStyle(
                            color: isActive ? Colors.white : Colors.white54,
                            fontSize: 12,
                            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      )),
    );
  }

  Widget _buildStepContent() {
    switch (controller.currentStep.value) {
      case 0:
        return _buildStep1();
      case 1:
        return _buildStep2();
      case 2:
        return _buildStep3();
      default:
        return _buildStep1();
    }
  }

  Widget _buildStep1() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Información Básica',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Cuéntanos sobre qué tema quieres crear tu prueba',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          _buildTextField(
            controller: controller.titleController,
            label: 'Título de la prueba',
            hint: 'Ej: Matemáticas básicas',
            icon: Icons.title,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: controller.topicController,
            label: 'Tema específico',
            hint: 'Ej: Ecuaciones de primer grado',
            icon: Icons.topic,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: controller.descriptionController,
            label: 'Descripción (opcional)',
            hint: 'Breve descripción de la prueba...',
            icon: Icons.description,
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          _buildCategorySelector(),
          const SizedBox(height: 16),
          _buildDifficultySelector(),
        ],
      ),
    );
  }

  Widget _buildStep2() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Configuración Avanzada',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Personaliza cómo funcionará tu prueba',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          _buildQuestionTypesSelector(),
          const SizedBox(height: 24),
          _buildNumberSelector(
            title: 'Número de preguntas',
            value: controller.numberOfQuestions,
            min: 5,
            max: 50,
            icon: Icons.quiz,
          ),
          const SizedBox(height: 24),
          _buildNumberSelector(
            title: 'Tiempo límite (minutos)',
            value: controller.timeLimit,
            min: 5,
            max: 120,
            icon: Icons.timer,
          ),
          const SizedBox(height: 24),
          _buildSwitchOptions(),
        ],
      ),
    );
  }

  Widget _buildStep3() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Revisión Final',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Revisa los detalles antes de crear tu prueba',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          _buildSummaryCard(),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.accent.withOpacity(0.3)),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.auto_awesome,
                  color: AppColors.accent,
                  size: 24,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'IA Generativa Lista',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Nuestra IA generará preguntas inteligentes basadas en tu configuración',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundDarkIntense,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white10),
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white38),
              prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categoría',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.backgroundDarkIntense,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white10),
          ),
          child: Obx(() => DropdownButton<String>(
            value: controller.selectedCategory.value,
            isExpanded: true,
            underline: const SizedBox(),
            dropdownColor: AppColors.backgroundDarkIntense,
            style: const TextStyle(color: Colors.white),
            icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.primary),
            items: controller.categories.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                controller.selectedCategory.value = newValue;
              }
            },
          )),
        ),
      ],
    );
  }

  Widget _buildDifficultySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nivel de dificultad',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Obx(() => Row(
          children: controller.difficulties.map((difficulty) {
            bool isSelected = controller.selectedDifficulty.value == difficulty;
            Color getColor() {
              switch (difficulty) {
                case 'Básico':
                  return Colors.green;
                case 'Intermedio':
                  return AppColors.accent;
                case 'Avanzado':
                  return Colors.orange;
                case 'Experto':
                  return AppColors.secondary;
                default:
                  return AppColors.primary;
              }
            }
            
            return Expanded(
              child: GestureDetector(
                onTap: () => controller.selectedDifficulty.value = difficulty,
                child: Container(
                  margin: EdgeInsets.only(right: difficulty != controller.difficulties.last ? 8 : 0),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? getColor().withOpacity(0.2) : AppColors.backgroundDarkIntense,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? getColor() : Colors.white10,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Text(
                    difficulty,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isSelected ? getColor() : Colors.white70,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        )),
      ],
    );
  }

  Widget _buildQuestionTypesSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tipos de preguntas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Selecciona uno o más tipos',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 12),
        Obx(() => Wrap(
          spacing: 8,
          runSpacing: 8,
          children: controller.questionTypes.map((type) {
            bool isSelected = controller.selectedQuestionTypes.contains(type);
            return GestureDetector(
              onTap: () => controller.toggleQuestionType(type),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary.withOpacity(0.2) : AppColors.backgroundDarkIntense,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : Colors.white10,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Text(
                  type,
                  style: TextStyle(
                    color: isSelected ? AppColors.primary : Colors.white70,
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        )),
      ],
    );
  }

  Widget _buildNumberSelector({
    required String title,
    required RxInt value,
    required int min,
    required int max,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.backgroundDarkIntense,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white10),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (value.value > min) value.value--;
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.remove, color: AppColors.primary, size: 16),
                ),
              ),
              Expanded(
                child: Obx(() => Text(
                  '${value.value}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              GestureDetector(
                onTap: () {
                  if (value.value < max) value.value++;
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add, color: AppColors.primary, size: 16),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Obx(() => SliderTheme(
          data: SliderTheme.of(Get.context!).copyWith(
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: Colors.white10,
            thumbColor: AppColors.primary,
            overlayColor: AppColors.primary.withOpacity(0.2),
            trackHeight: 4,
          ),
          child: Slider(
            value: value.value.toDouble(),
            min: min.toDouble(),
            max: max.toDouble(),
            divisions: max - min,
            onChanged: (newValue) => value.value = newValue.round(),
          ),
        )),
      ],
    );
  }

  Widget _buildSwitchOptions() {
    return Column(
      children: [
        _buildSwitchTile(
          title: 'Prueba pública',
          subtitle: 'Otros usuarios podrán encontrar y resolver tu prueba',
          value: controller.isPublic,
          icon: Icons.public,
        ),
        const SizedBox(height: 12),
        _buildSwitchTile(
          title: 'Permitir comentarios',
          subtitle: 'Los usuarios podrán dejar comentarios en tu prueba',
          value: controller.allowComments,
          icon: Icons.comment,
        ),
        const SizedBox(height: 12),
        _buildSwitchTile(
          title: 'Permitir reintentos',
          subtitle: 'Los usuarios podrán resolver la prueba múltiples veces',
          value: controller.allowRetakes,
          icon: Icons.refresh,
        ),
        const SizedBox(height: 12),
        _buildSwitchTile(
          title: 'Mostrar resultados',
          subtitle: 'Mostrar respuestas correctas al finalizar',
          value: controller.showResults,
          icon: Icons.visibility,
        ),
      ],
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required RxBool value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundDarkIntense,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Obx(() => Switch(
            value: value.value,
            onChanged: (newValue) => value.value = newValue,
            activeColor: AppColors.primary,
            activeTrackColor: AppColors.primary.withOpacity(0.3),
            inactiveThumbColor: Colors.white54,
            inactiveTrackColor: Colors.white10,
          )),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundDarkIntense,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Resumen de tu prueba',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Obx(() => Column(
            children: [
              _buildSummaryItem('Título', controller.titleController.text.isEmpty 
                  ? 'Sin título' : controller.titleController.text),
              _buildSummaryItem('Categoría', controller.selectedCategory.value),
              _buildSummaryItem('Dificultad', controller.selectedDifficulty.value),
              _buildSummaryItem('Preguntas', '${controller.numberOfQuestions.value}'),
              _buildSummaryItem('Tiempo límite', '${controller.timeLimit.value} min'),
              _buildSummaryItem('Tipos de pregunta', 
                  controller.selectedQuestionTypes.isEmpty 
                      ? 'Ninguno seleccionado' 
                      : controller.selectedQuestionTypes.join(', ')),
            ],
          )),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Obx(() => Row(
        children: [
          if (controller.currentStep.value > 0)
            Expanded(
              child: GestureDetector(
                onTap: controller.previousStep,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundDarkIntense,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: const Text(
                    'Anterior',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          if (controller.currentStep.value > 0) const SizedBox(width: 12),
          Expanded(
            flex: controller.currentStep.value == 0 ? 1 : 1,
            child: GestureDetector(
              onTap: controller.currentStep.value == 2 ? controller.createTest : controller.nextStep,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryDark],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.currentStep.value == 2 ? 'Crear Prueba' : 'Siguiente',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (controller.currentStep.value == 2) ...[
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}