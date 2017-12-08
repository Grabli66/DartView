import 'package:test_dart/view.dart';
import 'package:test_dart/tags.dart';

abstract class RootView extends View {

  Object content();

  @override
  Object layout() =>
      html() (
        head() (
          title(text : "My page"),
          meta(charset: "utf-8"),
          script(src: "jquery.js")
        ),
        body() (
          content()
        )
      );
}
