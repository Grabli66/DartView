import 'package:dart_view/dart_view.dart';
import 'package:test/test.dart';

main() {
  test('test tag render', () {
    final res = 
      html() (
        head() (
          title(text: 'test')
        ),
        body() (
          div(id: "main-page") (
            p(css: "header"),
            div(css: "content"),
            div(css: "footer")
          )
        )
      );
    expect(res.render(), equals('<html><head><title>test</title></head><body><div id="main-page"><p class="header"></p><div class="content"></div><div class="footer"></div></div></body></html>'));
  });
}