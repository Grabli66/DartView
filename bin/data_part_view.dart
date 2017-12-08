import 'package:test_dart/view.dart';
import 'package:test_dart/tags.dart';

class DataPartView extends View {
  @override
  Object layout() =>
    div(css: "data-part") (
      p(text: "Some part")
    );
  
}