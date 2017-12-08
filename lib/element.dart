class Element {
  String name;
  String text;

  Map<String, String> props = {};
  List<Element> childs = [];

  Element(this.name, {this.text});

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