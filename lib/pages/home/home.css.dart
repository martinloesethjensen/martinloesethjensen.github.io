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
    // Subtle chapter break between sections
    css('.cv-section + .cv-section').styles(
      raw: {'border-top': '1px solid #253050'},
    ),
    css('.section-title').styles(
      color: termComment,
      fontSize: 1.rem,
      fontWeight: .w500,
      raw: {
        'border-left': '2px solid #3ddc84',
        'padding-left': '0.625rem',
      },
    ),
    css(
      '.section-content',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(1.25.rem)),
    css('.cv-text').styles(color: termSubText, fontSize: 0.9375.rem),

    // Scroll reveal — JS adds .will-reveal then .revealed
    css('.will-reveal').styles(
      raw: {
        'opacity': '0',
        'transform': 'translateY(14px)',
        'transition':
            'opacity 0.55s cubic-bezier(0.25, 1, 0.5, 1), transform 0.55s cubic-bezier(0.25, 1, 0.5, 1)',
      },
    ),
    css('.revealed').styles(
      raw: {'opacity': '1', 'transform': 'translateY(0)'},
    ),

    // Experience / Education items
    css(
      '.exp-list',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(2.rem)),
    css('.exp-item').styles(
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(0.625.rem),
      raw: {'transition': 'box-shadow 0.2s ease'},
    ),
    css('.exp-item:hover').styles(
      raw: {'box-shadow': '-2px 0 0 0 #3ddc84'},
    ),
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

    // Skills — 2-column grid; single column on mobile via responsive.css
    css('.skills-grid').styles(
      raw: {
        'display': 'grid',
        'grid-template-columns': 'repeat(2, 1fr)',
        'gap': '1.25rem 2.5rem',
      },
    ),
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
      raw: {
        'transition':
            'background-color 0.15s ease, color 0.15s ease, transform 0.15s ease',
      },
    ),
    css('.skill-tag:hover').styles(
      raw: {
        'background-color': '#1e2f4a',
        'color': '#56f09b',
        'transform': 'translateY(-1px)',
      },
    ),
  ];
}
