import 'package:app_yachay/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTestController extends GetxController {
  final titleController = TextEditingController();
  final topicController = TextEditingController();
  final descriptionController = TextEditingController();
  
  var selectedCategory = 'Matemáticas'.obs;
  var selectedDifficulty = 'Intermedio'.obs;
  var selectedQuestionTypes = <String>[].obs;
  var numberOfQuestions = 10.obs;
  var timeLimit = 30.obs;
  var isPublic = true.obs;
  var allowComments = true.obs;
  var allowRetakes = true.obs;
  var showResults = true.obs;
  var currentStep = 0.obs;

  final categories = [
    'Matemáticas',
    'Ciencias',
    'Historia',
    'Literatura',
    'Geografía',
    'Tecnología',
    'Arte',
    'Deportes',
    'Música',
    'Idiomas'
  ];

  final difficulties = ['Básico', 'Intermedio', 'Avanzado', 'Experto'];
  
  final questionTypes = [
    'Opción múltiple',
    'Verdadero/Falso',
    'Completar espacios',
    'Respuesta corta',
    'Ordenar elementos'
  ];

  void nextStep() {
    if (currentStep.value < 2) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  void toggleQuestionType(String type) {
    if (selectedQuestionTypes.contains(type)) {
      selectedQuestionTypes.remove(type);
    } else {
      selectedQuestionTypes.add(type);
    }
  }

  void createTest() {
    // Lógica para crear la prueba
    Get.snackbar(
      '¡Éxito!',
      'Tu prueba ha sido creada exitosamente',
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
    Get.back();
  }
}