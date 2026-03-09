import 'package:jaspr/dom.dart';

import '../../styles/terminal.css.dart';
import '../../theme.dart';

class HomeCss {
  static List<StyleRule> styles = <StyleRule>[
    // Hero
    css('.hero').styles(
      padding: .symmetric(vertical: 4.rem),
      backgroundColor: termBg,
    ),
    css('.hero-inner').styles(
      maxWidth: 700.px,
      padding: .symmetric(horizontal: 1.5.rem),
      margin: .symmetric(horizontal: Unit.auto),
    ),

    ...TerminalCss.styles,

    // CV content wrapper
    css('.cv-wrap').styles(
      display: .flex,
      maxWidth: 700.px,
      padding: .symmetric(horizontal: 1.5.rem, vertical: 3.rem),
      margin: .symmetric(horizontal: Unit.auto),
      flexDirection: .column,
      gap: Gap.all(3.rem),
    ),

    // Sections
    css(
      '.cv-section',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(1.25.rem)),
    css(
      '.section-title',
    ).styles(color: termComment, fontSize: 0.875.rem, fontWeight: .w400),
    css(
      '.section-content',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(1.25.rem)),
    css('.cv-text').styles(color: termSubText, fontSize: 0.9375.rem),

    // Experience / Education items
    css(
      '.exp-list',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(2.rem)),
    css(
      '.exp-item',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(0.625.rem)),
    css('.exp-header').styles(
      display: .flex,
      flexWrap: .wrap,
      justifyContent: .spaceBetween,
      alignItems: .start,
      gap: Gap.all(0.75.rem),
    ),
    css(
      '.exp-title-group',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(0.2.rem)),
    css('.exp-chevron').styles(color: termGreen, fontWeight: .w700),
    css(
      '.exp-company',
    ).styles(color: termText, fontSize: 1.rem, fontWeight: .w600),
    css('.exp-role').styles(
      padding: .only(left: 1.rem),
      color: termMuted,
      fontSize: 0.875.rem,
      fontWeight: .w400,
    ),
    css(
      '.exp-date',
    ).styles(color: termComment, fontSize: 0.8125.rem, whiteSpace: .noWrap),
    css('.exp-bullets').styles(
      display: .flex,
      padding: .only(left: 1.5.rem),
      flexDirection: .column,
      gap: Gap.all(0.375.rem),
    ),
    css('.exp-bullets li').styles(color: termSubText, fontSize: 0.9375.rem),

    // Skills
    css(
      '.skills-grid',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(1.25.rem)),
    css(
      '.skill-group',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(0.5.rem)),
    css('.skill-hash').styles(color: termComment),
    css(
      '.skill-name',
    ).styles(color: termGreen, fontSize: 0.875.rem, fontWeight: .w400),
    css(
      '.skill-tags',
    ).styles(display: .flex, flexWrap: .wrap, gap: Gap.all(0.5.rem)),
    css('.skill-tag').styles(
      display: .inlineBlock,
      padding: .symmetric(horizontal: 0.625.rem, vertical: 0.25.rem),
      radius: .circular(4.px),
      color: termCyan,
      fontSize: 0.8125.rem,
      fontWeight: .w400,
      backgroundColor: tagBg,
    ),
  ];
}
