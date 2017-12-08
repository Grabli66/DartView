import 'package:test_dart/tags.dart';

import 'rootview.dart';
import 'data_part_view.dart';

class MyView extends RootView {

  @override
  Object content() =>
    div(css: "partial") (
      new DataPartView()
    );

}