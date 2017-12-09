# Dart View - write html templates with dart

# Installation
In your `pubspec.yaml`:

```yaml
dependencies:
  dart_view: ^1.0.0
```

# Simple template example:

```dart
import 'package:dart_view/dart_view.dart';

main() {
    final template = 
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
    print(res.render());
}
```