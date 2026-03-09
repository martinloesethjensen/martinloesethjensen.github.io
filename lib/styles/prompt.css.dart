import 'package:jaspr/dom.dart';

class PromptCss {
  static List<StyleRule> styles = <StyleRule>[
    css('.prompt-line').styles(display: .flex, gap: Gap.all(0.5.rem)),
  ];
}
