import 'tag.dart';
import 'child_func.dart';

/// Create tag with [name] and [properties]
ChildFunc _tag(String name, [Map<String, String> properties]) {
  return ([par1, par2, par3, par4, par5, par6, par7, par8, par9, par10]) {
    var res = new Tag(name);

    if (properties != null) {
      for (final key in properties.keys) {
        if (key != "text") {
          final val = properties[key];
          if (val != null) res.props[key] = val;
        } else {
          res.text = properties[key];
        }
      }
    }

    if (par1 != null && par1 is Iterable) {
      res.addChilds(par1);
    } else {
      var childList = <Object>[];
      childList.add(par1);
      if (par2 != null) childList.add(par2);
      if (par3 != null) childList.add(par3);
      if (par4 != null) childList.add(par4);
      if (par5 != null) childList.add(par5);
      if (par6 != null) childList.add(par6);
      if (par7 != null) childList.add(par7);
      if (par8 != null) childList.add(par8);
      if (par9 != null) childList.add(par9);
      if (par10 != null) childList.add(par10);

      res.addChilds(childList);
    }

    return res;
  };
}

/// Create <html> tag
ChildFunc html({String id, String css}) {
  return _tag("html", {"id": id, "class": css});
}

/// Create <head> tag
ChildFunc head() {
  return _tag("head");
}

/// Create title tag
ChildFunc title({String text}) {
  return _tag("title", {"text": text});
}

/// Create <meta> tag
ChildFunc meta(
    {String charset, String content, String http_equiv, String name}) {
  return _tag("meta", {
    "charset": charset,
    "content": content,
    "http-equiv": http_equiv,
    "name": name
  });
}

/// Create <script> tag
ChildFunc script(
    {String isAsync, String defer, String language, String src, String type}) {
  return _tag("script", {
    "async": isAsync,
    "defer": defer,
    "language": language,
    "src": src,
    "type": type,
  });
}

/// Create <body> tag
ChildFunc body({String id, String css}) {
  return _tag("body", {"id": id, "class": css});
}

/// Create <div> tag
ChildFunc div({String id, String css, String text}) {
  return _tag("div", {"id": id, "class": css, "text": text});
}

/// Create <p> tag
ChildFunc p({String id, String css, String text}) {
  return _tag("p", {"id": id, "class": css, "text": text});
}
