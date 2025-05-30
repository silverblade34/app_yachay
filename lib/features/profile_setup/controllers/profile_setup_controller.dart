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
  var selectedInterests = <String>[].obs;

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

  final List<String> interestOptions = [
    'Tecnología',
    'Ciencias',
    'Matemáticas',
    'Historia',
    'Arte',
    'Música',
    'Deportes',
    'Literatura',
    'Filosofía',
    'Idiomas',
    'Cocina',
    'Viajes'
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

  void toggleInterest(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.remove(interest);
    } else {
      selectedInterests.add(interest);
    }
  }

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
    return selectedInterests.length >= 3;
  }
}
