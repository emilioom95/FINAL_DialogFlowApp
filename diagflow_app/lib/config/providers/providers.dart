import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers(DialogFlowtter dialogFlowtter) {
  return [
    Provider<DialogFlowtter>.value(value: dialogFlowtter),
  ];
}
