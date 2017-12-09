import 'child_func.dart';
import 'tag.dart';

/// Abstract view for rendering html
abstract class View {
  /// Layout view
  Object layout();

  /// Render view to string
  String render() {
    final lay = layout();
    if (lay is Tag) {
      return lay.render();
    } else if (lay is ChildFunc) {
      return lay().render();
    } else if (lay is View) {
      return lay.render();
    }

    throw new Exception("Unknown layout object");
  }
}
