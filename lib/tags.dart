import 'package:test_dart/view.dart';

import 'element.dart';
import 'child_func.dart';

void _addChilds(Element element, List<Object> childs) {
  if (childs == null) return;

  for (var par in childs) {
    if (par is ChildFunc) {
      element.childs.add(par());
    } else if (par is Element) {
      element.childs.add(par);
    } else if (par is View) {
      element.childs.add(par.layout());
    } else if (par is Iterable) {
      for (final it in par) {
        if (it is Element) {
          element.childs.add(it);
        } else if (it is ChildFunc) {
          element.childs.add(it());
        }
      }
    }
  }
}

ChildFunc _tag(String name, [Map<String, String> props]) {
  return ([par1, par2, par3, par4, par5, par6, par7, par8, par9, par10]) {
    var res = new Element(name);

    if (props != null) {
      for (final key in props.keys) {
        if (key != "text") {
          final val = props[key];
          if (val != null) res.props[key] = val;
        } else {
          res.text = props[key];
        }
      }
    }

    if (par1 != null && par1 is Iterable) {
      _addChilds(res, par1);
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

      _addChilds(res, childList);
    }

    return res;
  };
}

ChildFunc html({String id, String css}) {
  return _tag("html", {"id": id, "class": css});
}

ChildFunc head() {
  return _tag("head");
}

ChildFunc title({String text}) {
  return _tag("title", {"text": text});
}

ChildFunc meta(
    {String charset, String content, String http_equiv, String name}) {
  return _tag("meta", {
    "charset": charset,
    "content": content,
    "http-equiv": http_equiv,
    "name": name
  });
}

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

ChildFunc body({String id, String css}) {
  return _tag("body", {"id": id, "class": css});
}

ChildFunc div({String id, String css, String text}) {
  return _tag("div", {"id": id, "class": css, "text": text});
}

ChildFunc p({String id, String css, String text}) {
  return _tag("p", {"id": id, "class": css, "text": text});
}
