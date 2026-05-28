import 'package:jaspr/dom.dart';

import '../theme.dart';

class TerminalCss {
  static List<StyleRule> styles = <StyleRule>[
    // Entrance keyframes
    css.keyframes('fadeSlideUp', {
      'from': Styles(raw: {'opacity': '0', 'transform': 'translateY(12px)'}),
      'to': Styles(raw: {'opacity': '1', 'transform': 'translateY(0)'}),
    }),
    css.keyframes('fadeIn', {
      'from': Styles(opacity: 0),
      'to': Styles(opacity: 1),
    }),

    // Terminal window container — animates in as a whole first
    css('.term-window').styles(
      radius: .circular(8.px),
      overflow: Overflow.hidden,
      backgroundColor: termCard,
      raw: {
        'border': '1px solid #253050',
        'box-shadow': '0 4px 24px rgba(9, 13, 18, 0.6)',
        'animation': 'fadeSlideUp 0.5s cubic-bezier(0.25, 1, 0.5, 1) both',
      },
    ),

    // Title bar — 2px green accent line at top signals "active terminal"
    css('.term-titlebar').styles(
      display: .flex,
      padding: .symmetric(horizontal: 1.rem, vertical: 0.75.rem),
      alignItems: .center,
      gap: Gap.all(0.75.rem),
      backgroundColor: termTitlebar,
      raw: {'border-top': '2px solid #3ddc84'},
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

    // Each body child fades in; stagger applied via nth-child below.
    // Using opacity-only (no translateY) because .term-window clips overflow.
    css('.term-body > *').styles(
      raw: {
        'opacity': '0',
        'animation': 'fadeIn 0.35s cubic-bezier(0.25, 1, 0.5, 1) both',
      },
    ),
    // Group 1: $ whoami + name
    css('.term-body > *:nth-child(1)').styles(raw: {'animation-delay': '0.2s'}),
    css('.term-body > *:nth-child(2)').styles(raw: {'animation-delay': '0.38s'}),
    // Group 2: $ cat role.txt + role
    css('.term-body > *:nth-child(3)').styles(raw: {'animation-delay': '0.54s'}),
    css('.term-body > *:nth-child(4)').styles(raw: {'animation-delay': '0.7s'}),
    // Group 3: $ cat contact.json
    css('.term-body > *:nth-child(5)').styles(raw: {'animation-delay': '0.86s'}),
    // JSON block lines — faster stagger
    css('.term-body > *:nth-child(6)').styles(raw: {'animation-delay': '1.0s'}),
    css('.term-body > *:nth-child(7)').styles(raw: {'animation-delay': '1.07s'}),
    css('.term-body > *:nth-child(8)').styles(raw: {'animation-delay': '1.14s'}),
    css('.term-body > *:nth-child(9)').styles(raw: {'animation-delay': '1.21s'}),
    css('.term-body > *:nth-child(10)').styles(raw: {'animation-delay': '1.28s'}),
    // Group 4: $ ls links/ + buttons
    css('.term-body > *:nth-child(11)').styles(raw: {'animation-delay': '1.44s'}),
    css('.term-body > *:nth-child(12)').styles(raw: {'animation-delay': '1.6s'}),
    // Cursor line — last to appear
    css('.term-body > *:nth-child(13)').styles(raw: {'animation-delay': '1.72s'}),

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
      raw: {'transition': 'color 0.15s ease'},
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
      raw: {'transition': 'color 0.15s ease, background-color 0.15s ease'},
    ),
    css('.term-btn:hover').styles(color: termBg, backgroundColor: termGreen),
    css('.term-btn--dl').styles(color: termCyan),
    css('.term-btn--dl:hover').styles(color: termBg, backgroundColor: termCyan),

    // Blinking cursor — starts hidden; blink begins after all lines have appeared
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
      opacity: 0,
      raw: {'animation': 'blink 1s step-end 2.1s infinite'},
    ),
  ];
}
