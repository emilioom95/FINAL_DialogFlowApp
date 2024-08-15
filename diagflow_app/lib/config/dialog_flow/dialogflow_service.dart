import 'package:dialog_flowtter/dialog_flowtter.dart';

class DialogflowService {
  final DialogFlowtter dialogFlowtter;

  DialogflowService({required this.dialogFlowtter});

  Future<String> detectIntent(String query) async {
    final response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(
        text: TextInput(
          text: query,
          languageCode: 'es',
        ),
      ),
    );

    if (response.message == null || response.message!.text == null) {
      throw Exception('No hay respuesta desde Dialogflow');
    }

    return response.message!.text!.text![0];
  }
}
