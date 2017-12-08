import 'child_func.dart';
import 'element.dart';

abstract class View {
  Object layout();    

  String render() {
    final lay = layout();
    if (lay is Element) {
      return lay.render();
    } else if (lay is ChildFunc) {
      return lay().render();
    } else if (lay is View) {
      return lay.render();
    }

    throw new Exception("Unknown layout object");
  }
}