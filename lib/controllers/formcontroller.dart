import 'package:upload_doc_app/controllers/baseBloc.dart';
import 'package:upload_doc_app/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class FormController extends Object with Validators implements BaseBloc {
  final fullNameController = BehaviorSubject<String>();
  Function(String) get nameChanged => fullNameController.sink.add;
  Stream<String> get fullName =>
      fullNameController.stream.transform(nameValidator);

  Stream<bool> get personalCheck => fullName.map((fullName) => true);
  @override
  void dispose() {
    fullNameController?.close();
  }
}
