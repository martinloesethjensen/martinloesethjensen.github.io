import 'package:jaspr/dom.dart';

import '../../theme.dart';

class ProjectsCss {
  static List<StyleRule> styles = <StyleRule>[
    css('.projects-page').styles(
      padding: .symmetric(vertical: 4.rem),
      backgroundColor: termBg,
    ),
    css('.projects-inner').styles(
      display: .flex,
      maxWidth: 960.px,
      padding: .symmetric(horizontal: 1.5.rem),
      margin: .symmetric(horizontal: Unit.auto),
      flexDirection: .column,
      gap: Gap.all(2.5.rem),
    ),

    // Page hero / header
    css(
      '.projects-hero',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(0.5.rem)),
    css('.proj-term-line').styles(display: .flex, alignItems: .center),
    css(
      '.proj-ps1',
    ).styles(color: termGreen, fontSize: 1.125.rem, fontWeight: .w700),
    css('.proj-cmd').styles(color: termText, fontSize: 1.125.rem),
    css('.projects-subtitle').styles(padding: .only(left: 0.125.rem)),
    css('.proj-comment').styles(color: termComment, fontSize: 0.9375.rem),

    // Grid
    css(
      '.projects-grid',
    ).styles(display: .flex, flexWrap: .wrap, gap: Gap.all(1.5.rem)),

    // Card
    css('.project-card').styles(
      display: .flex,
      width: 340.px,
      radius: .circular(8.px),
      overflow: Overflow.hidden,
      flexDirection: .column,
      backgroundColor: termCard,
    ),

    // Card title bar
    css('.card-titlebar').styles(
      display: .flex,
      padding: .symmetric(horizontal: 0.875.rem, vertical: 0.625.rem),
      alignItems: .center,
      gap: Gap.all(0.625.rem),
      backgroundColor: termTitlebar,
    ),
    css(
      '.card-dots',
    ).styles(display: .flex, alignItems: .center, gap: Gap.all(0.3125.rem)),
    css('.card-dot').styles(
      display: .inlineBlock,
      width: 10.px,
      height: 10.px,
      radius: .circular(5.px),
    ),
    css('.card-dot--red').styles(backgroundColor: const Color('#ff5f57')),
    css('.card-dot--yellow').styles(backgroundColor: const Color('#febc2e')),
    css('.card-dot--green').styles(backgroundColor: const Color('#28c840')),
    css('.card-wintitle').styles(color: termMuted, fontSize: 0.75.rem),

    // Card body
    css('.card-body').styles(
      display: .flex,
      padding: .all(1.25.rem),
      flexDirection: .column,
      gap: Gap.all(0.75.rem),
      flex: Flex(grow: 1),
    ),
    css('.card-header-row').styles(
      display: .flex,
      justifyContent: .spaceBetween,
      alignItems: .center,
    ),
    css('.project-icon').styles(fontSize: 1.5.rem),
    css('.project-badge').styles(
      display: .inlineBlock,
      padding: .symmetric(horizontal: 0.5.rem, vertical: 0.1875.rem),
      radius: .circular(4.px),
      color: termYellow,
      fontSize: 0.6875.rem,
      fontWeight: .w500,
      backgroundColor: tagBg,
    ),
    css('.project-name-line').styles(display: .flex, alignItems: .center),
    css('.proj-chevron').styles(color: termGreen, fontWeight: .w700),
    css(
      '.project-name',
    ).styles(color: termText, fontSize: 1.rem, fontWeight: .w600),
    css(
      '.project-description',
    ).styles(flex: Flex(grow: 1), color: termMuted, fontSize: 0.875.rem),
    css('.project-card-footer').styles(
      display: .flex,
      padding: .only(top: 0.5.rem),
      justifyContent: .spaceBetween,
      alignItems: .center,
    ),
    css(
      '.project-lang',
    ).styles(display: .flex, alignItems: .center, gap: Gap.all(0.375.rem)),
    css('.lang-dot').styles(
      display: .inlineBlock,
      width: 10.px,
      height: 10.px,
      radius: .circular(5.px),
    ),
    css('.lang-label').styles(color: termComment, fontSize: 0.8125.rem),
    css('.project-link').styles(
      color: termGreen,
      fontSize: 0.8125.rem,
      fontWeight: .w500,
      textDecoration: TextDecoration(line: .none),
    ),
    css('.project-link:hover').styles(color: termGreenBright),

    // Footer
    css('.projects-footer').styles(display: .flex, justifyContent: .center),
    css('.github-profile-btn').styles(
      display: .inlineBlock,
      padding: .symmetric(horizontal: 1.5.rem, vertical: 0.75.rem),
      radius: .circular(6.px),
      color: termGreen,
      fontSize: 0.9375.rem,
      fontWeight: .w500,
      textDecoration: TextDecoration(line: .none),
      backgroundColor: tagBg,
    ),
    css(
      '.github-profile-btn:hover',
    ).styles(color: termBg, backgroundColor: termGreen),
  ];
}
