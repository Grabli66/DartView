import 'child_func.dart';
import 'view.dart';

/// Html tag
class Tag {
  /// Name of tag
  String name;

  /// Text of tag
  String text;

  /// Tag properties
  Map<String, String> props = {};

  /// Tag childs
  List<Tag> childs = [];

  /// Constructor
  Tag(this.name, {this.text});

  /// Add [childObjects] to tag
  ///
  /// It accept Tag, View, Iterable<Tag>, Iterable<ChildFunc>
  void addChilds(List<Object> childObjects) {
    if (childs == null) return;

    for (var par in childObjects) {
      if (par is ChildFunc) {
        childs.add(par());
      } else if (par is Tag) {
        childs.add(par);
      } else if (par is View) {
        childs.add(par.layout());
      } else if (par is Iterable) {
        for (final it in par) {
          if (it is Tag) {
            childs.add(it);
          } else if (it is ChildFunc) {
            childs.add(it());
          }
        }
      }
    }
  }

  /// Render tag to string
  String render() {
    var sb = new StringBuffer();
    if (props.isNotEmpty) {
      sb.write("<${name}");
      for (final k in props.keys) {
        final v = props[k];
        sb.write(' ${k}="${v}"');
      }
      sb.write(">");
    } else {
      sb.write("<${name}>");
    }

    if (text != null) sb.write(text);

    for (final c in childs) {
      sb.write(c.render());
    }

    sb.write("</${name}>");
    return sb.toString();
  }
}
