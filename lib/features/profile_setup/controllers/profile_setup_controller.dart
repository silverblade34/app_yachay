import 'package:app_yachay/config/constants/constance.dart';
import 'package:get/get.dart';
class ProfileSetupController extends GetxController {
  var currentStep = 0.obs;
  var nombres = ''.obs;
  var apellidoPaterno = ''.obs;
  var apellidoMaterno = ''.obs;
  var sexo = ''.obs;
  var nivelAcademico = ''.obs;
  var carrera = ''.obs;
  var fechaNacimiento = Rx<DateTime?>(null);
  var profileImage = ''.obs;
  var selectedAvatar = ''.obs;
  
  // Nuevas variables para preferencias y metas de aprendizaje
  var selectedPreferences = <String>[].obs; // Lo que le gusta
  var selectedLearningGoals = <String>[].obs; // Lo que quiere aprender

  final List<String> sexoOptions = ['Masculino', 'Femenino', 'Otros'];
  
  final List<String> nivelAcademicoOptions = [
    'Secundaria',
    'Técnico',
    'Universitario',
    'Postgrado'
  ];
  
  final List<String> avatarOptions = [
    ConstanceData.avatarCondorSabio,
    ConstanceData.avatarLlamaAmigable,
    ConstanceData.avatarOsoAnteojos,
    ConstanceData.avatarQuipuCurioso,
    ConstanceData.avatarTumiInteligente,
    ConstanceData.avatarVizcacha,
  ];

  // Lista unificada de temas disponibles
  final List<String> availableTopics = [
    'Tecnología',
    'Programación',
    'Ciencias',
    'Matemáticas',
    'Física',
    'Química',
    'Biología',
    'Historia',
    'Geografía',
    'Arte',
    'Música',
    'Literatura',
    'Filosofía',
    'Psicología',
    'Idiomas',
    'Inglés',
    'Francés',
    'Portugués',
    'Deportes',
    'Cocina',
    'Fotografía',
    'Diseño',
    'Marketing',
    'Finanzas',
    'Emprendimiento',
    'Medicina',
    'Arquitectura',
    'Ingeniería',
    'Derecho',
    'Educación',
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

  // Métodos para manejar preferencias (lo que le gusta)
  void togglePreference(String preference) {
    if (selectedPreferences.contains(preference)) {
      selectedPreferences.remove(preference);
    } else {
      // Evitar que seleccione lo mismo en ambas listas
      if (selectedLearningGoals.contains(preference)) {
        selectedLearningGoals.remove(preference);
      }
      selectedPreferences.add(preference);
    }
  }

  // Métodos para manejar metas de aprendizaje (lo que quiere aprender)
  void toggleLearningGoal(String goal) {
    if (selectedLearningGoals.contains(goal)) {
      selectedLearningGoals.remove(goal);
    } else {
      // Evitar que seleccione lo mismo en ambas listas
      if (selectedPreferences.contains(goal)) {
        selectedPreferences.remove(goal);
      }
      selectedLearningGoals.add(goal);
    }
  }

  // Métodos de validación
  bool canProceedStep1() {
    return nombres.value.isNotEmpty &&
        apellidoPaterno.value.isNotEmpty &&
        apellidoMaterno.value.isNotEmpty &&
        sexo.value.isNotEmpty &&
        nivelAcademico.value.isNotEmpty &&
        fechaNacimiento.value != null &&
        (nivelAcademico.value != 'Universitario' || carrera.value.isNotEmpty);
  }

  bool canProceedStep2() {
    return profileImage.value.isNotEmpty || selectedAvatar.value.isNotEmpty;
  }

  bool canProceedStep3() {
    // Requiere al menos 2 preferencias y 2 metas de aprendizaje
    return selectedPreferences.length >= 2 && selectedLearningGoals.length >= 2;
  }

  // Métodos para obtener datos del perfil completo
  Map<String, dynamic> getUserProfile() {
    return {
      'personal_info': {
        'nombres': nombres.value,
        'apellido_paterno': apellidoPaterno.value,
        'apellido_materno': apellidoMaterno.value,
        'sexo': sexo.value,
        'nivel_academico': nivelAcademico.value,
        'carrera': carrera.value,
        'fecha_nacimiento': fechaNacimiento.value?.toIso8601String(),
      },
      'profile': {
        'image': profileImage.value,
        'avatar': selectedAvatar.value,
      },
      'learning_profile': {
        'preferences': selectedPreferences.toList(), // Lo que le gusta
        'learning_goals': selectedLearningGoals.toList(), // Lo que quiere aprender
        'total_interests': selectedPreferences.length + selectedLearningGoals.length,
      },
    };
  }

  // Método para obtener recomendaciones de la IA
  Map<String, List<String>> getAIRecommendations() {
    return {
      'strengthen': selectedPreferences.toList(), // Profundizar en lo que ya le gusta
      'explore': selectedLearningGoals.toList(), // Explorar nuevas áreas
      'hybrid': _generateHybridTopics(), // Combinar intereses con nuevos aprendizajes
    };
  }

  List<String> _generateHybridTopics() {
    // Lógica para sugerir temas que combinen sus intereses con sus metas
    List<String> hybrid = [];
    
    if (selectedPreferences.contains('Tecnología') && selectedLearningGoals.contains('Arte')) {
      hybrid.add('Arte Digital');
    }
    if (selectedPreferences.contains('Música') && selectedLearningGoals.contains('Programación')) {
      hybrid.add('Producción Musical Digital');
    }
    if (selectedPreferences.contains('Deportes') && selectedLearningGoals.contains('Ciencias')) {
      hybrid.add('Ciencias del Deporte');
    }
    
    return hybrid;
  }

  @override
  void onClose() {
    // Limpiar recursos si es necesario
    super.onClose();
  }
}