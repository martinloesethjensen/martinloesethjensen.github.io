import 'package:jaspr/dom.dart';

import '../theme.dart';

class TerminalCss {
  static List<StyleRule> styles = <StyleRule>[
    // Terminal window container
    css('.term-window').styles(
      radius: .circular(8.px),
      overflow: Overflow.hidden,
      backgroundColor: termCard,
    ),

    // Title bar
    css('.term-titlebar').styles(
      display: .flex,
      padding: .symmetric(horizontal: 1.rem, vertical: 0.75.rem),
      alignItems: .center,
      gap: Gap.all(0.75.rem),
      backgroundColor: termTitlebar,
    ),
    css(
      '.term-dots',
    ).styles(display: .flex, alignItems: .center, gap: Gap.all(0.375.rem)),
    css('.term-dot').styles(
      display: .inlineBlock,
      width: 12.px,
      height: 12.px,
      radius: .circular(6.px),
    ),
    css('.term-dot--red').styles(backgroundColor: const Color('#ff5f57')),
    css('.term-dot--yellow').styles(backgroundColor: const Color('#febc2e')),
    css('.term-dot--green-dot').styles(backgroundColor: const Color('#28c840')),
    css('.term-wintitle').styles(color: termMuted, fontSize: 0.8125.rem),

    // Terminal body
    css('.term-body').styles(
      display: .flex,
      padding: .symmetric(horizontal: 1.5.rem, vertical: 1.25.rem),
      flexDirection: .column,
      gap: Gap.all(0.125.rem),
    ),
    css('.term-line').styles(
      display: .flex,
      padding: .only(top: 0.875.rem),
      alignItems: .center,
    ),
    css('.term-line--last').styles(
      padding: .only(top: 0.875.rem, bottom: 0.25.rem),
    ),
    css(
      '.term-ps1',
    ).styles(color: termGreen, fontSize: 1.rem, fontWeight: .w700),
    css('.term-cmd').styles(color: termText, fontSize: 0.9375.rem),

    // Output lines
    css('.term-output').styles(
      padding: .only(left: 1.25.rem, top: 0.125.rem),
      color: termSubText,
      fontSize: 0.9375.rem,
    ),
    css('.term-output--name').styles(
      padding: .only(left: 1.25.rem, top: 0.25.rem, bottom: 0.25.rem),
      color: termGreen,
      fontSize: 1.625.rem,
      fontWeight: .w700,
    ),
    css('.term-output--role').styles(
      padding: .only(left: 1.25.rem, top: 0.125.rem, bottom: 0.25.rem),
      color: termCyan,
      fontSize: 1.rem,
    ),
    css('.term-output--json').styles(
      padding: .only(left: 2.5.rem, top: 0.125.rem),
    ),

    // JSON syntax colouring
    css('.term-punct').styles(color: termMuted),
    css('.term-key').styles(color: termCyan),
    css('.term-str').styles(color: termYellow),
    css('.term-str--link').styles(
      color: termYellow,
      textDecoration: TextDecoration(line: .none),
    ),
    css('.term-str--link:hover').styles(color: termGreenBright),

    // Links row
    css('.term-links-row').styles(
      display: .flex,
      padding: .only(left: 1.25.rem, top: 0.375.rem, bottom: 0.25.rem),
      flexWrap: .wrap,
      alignItems: .center,
      gap: Gap.all(0.625.rem),
    ),
    css('.term-btn').styles(
      display: .inlineBlock,
      padding: .symmetric(horizontal: 0.875.rem, vertical: 0.375.rem),
      radius: .circular(4.px),
      color: termGreen,
      fontSize: 0.875.rem,
      fontWeight: .w500,
      textDecoration: TextDecoration(line: .none),
      backgroundColor: tagBg,
    ),
    css('.term-btn:hover').styles(color: termBg, backgroundColor: termGreen),
    css('.term-btn--dl').styles(color: termCyan),
    css('.term-btn--dl:hover').styles(color: termBg, backgroundColor: termCyan),

    // Blinking cursor
    css.keyframes('blink', {
      '0%, 100%': Styles(opacity: 1),
      '50%': Styles(opacity: 0),
    }),
    css('.term-cursor').styles(
      display: .inlineBlock,
      width: 9.px,
      height: 1.125.rem,
      margin: .only(left: 0.25.rem),
      backgroundColor: termGreen,
      raw: {'animation': 'blink 1s step-end infinite'},
    ),
  ];
}
