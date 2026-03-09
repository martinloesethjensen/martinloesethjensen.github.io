import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/cv_data.dart';
import '../theme.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'home', [
      _buildHero(),
      div(classes: 'cv-wrap', [
        _buildSummary(),
        _buildExperience(),
        _buildEducation(),
        _buildSkills(),
      ]),
    ]);
  }

  Component _buildHero() {
    return div(classes: 'hero', [
      div(classes: 'hero-inner', [
        div(classes: 'term-window', [
          // Title bar with traffic-light dots
          div(classes: 'term-titlebar', [
            div(classes: 'term-dots', [
              span(classes: 'term-dot term-dot--red', []),
              span(classes: 'term-dot term-dot--yellow', []),
              span(classes: 'term-dot term-dot--green-dot', []),
            ]),
            span(classes: 'term-wintitle', [.text('martin@portfolio: ~')]),
          ]),
          // Terminal body
          div(classes: 'term-body', [
            // whoami
            div(classes: 'term-line', [
              span(classes: 'term-ps1', [.text('\$')]),
              span(classes: 'term-cmd', [.text(' whoami')]),
            ]),
            div(classes: 'term-output term-output--name', [
              .text('Martin L. Jensen'),
            ]),
            // cat role.txt
            div(classes: 'term-line', [
              span(classes: 'term-ps1', [.text('\$')]),
              span(classes: 'term-cmd', [.text(' cat role.txt')]),
            ]),
            div(classes: 'term-output term-output--role', [
              .text('Senior Mobile Developer'),
            ]),
            // cat contact.json
            div(classes: 'term-line', [
              span(classes: 'term-ps1', [.text('\$')]),
              span(classes: 'term-cmd', [.text(' cat contact.json')]),
            ]),
            div(classes: 'term-output', [
              span(classes: 'term-punct', [.text('{')]),
            ]),
            div(classes: 'term-output term-output--json', [
              span(classes: 'term-key', [.text('"location"')]),
              span(classes: 'term-punct', [.text(': ')]),
              span(classes: 'term-str', [.text('"Copenhagen"')]),
              span(classes: 'term-punct', [.text(',')]),
            ]),
            div(classes: 'term-output term-output--json', [
              span(classes: 'term-key', [.text('"email"')]),
              span(classes: 'term-punct', [.text(': ')]),
              a(
                href: 'mailto:martin.loeseth@proton.me',
                classes: 'term-str term-str--link',
                [.text('"martin.loeseth@proton.me"')],
              ),
              span(classes: 'term-punct', [.text(',')]),
            ]),
            div(classes: 'term-output term-output--json', [
              span(classes: 'term-key', [.text('"phone"')]),
              span(classes: 'term-punct', [.text(': ')]),
              a(href: 'tel:+4531563146', classes: 'term-str term-str--link', [
                .text('"+45 31 56 31 46"'),
              ]),
            ]),
            div(classes: 'term-output', [
              span(classes: 'term-punct', [.text('}')]),
            ]),
            // ls links/
            div(classes: 'term-line', [
              span(classes: 'term-ps1', [.text('\$')]),
              span(classes: 'term-cmd', [.text(' ls links/')]),
            ]),
            div(classes: 'term-output term-links-row', [
              a(
                href: 'https://github.com/martinloesethjensen',
                attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
                classes: 'term-btn',
                [.text('GitHub')],
              ),
              a(
                href: 'https://linkedin.com/in/martinloesethjensen',
                attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
                classes: 'term-btn',
                [.text('LinkedIn')],
              ),
              a(
                href: 'martin-jensen-cv.pdf',
                attributes: {'download': 'martin-jensen-cv.pdf'},
                classes: 'term-btn term-btn--dl',
                [.text('↓ CV.pdf')],
              ),
            ]),
            // Cursor
            div(classes: 'term-line term-line--last', [
              span(classes: 'term-ps1', [.text('\$')]),
              span(classes: 'term-cursor', []),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildSummary() {
    return div(classes: 'cv-section', [
      h2(classes: 'section-title', [.text('// summary')]),
      div(classes: 'section-content', [
        p(classes: 'cv-text', [
          .text(
            'Experienced Flutter Developer, adept in all stages of app development with 4+ years of experience. '
            'Proficient in various platforms and languages in software development. '
            'Able to effectively self-manage during independent projects and collaborate as part of a productive team.',
          ),
        ]),
      ]),
    ]);
  }

  Component _buildExperience() {
    return div(classes: 'cv-section', [
      h2(classes: 'section-title', [.text('// experience')]),
      div(classes: 'section-content', [
        div(classes: 'exp-list', [
          for (final exp in experiences) _buildExpItem(exp),
        ]),
      ]),
    ]);
  }

  Component _buildExpItem(ExperienceItem exp) {
    return div(classes: 'exp-item', [
      div(classes: 'exp-header', [
        div(classes: 'exp-title-group', [
          h3(classes: 'exp-company', [
            span(classes: 'exp-chevron', [.text('> ')]),
            .text(exp.company),
          ]),
          p(classes: 'exp-role', [.text('${exp.position} · ${exp.location}')]),
        ]),
        span(classes: 'exp-date', [.text('[${exp.date}]')]),
      ]),
      ul(classes: 'exp-bullets', [
        for (final bullet in exp.bullets) li([.text(bullet)]),
      ]),
    ]);
  }

  Component _buildEducation() {
    return div(classes: 'cv-section', [
      h2(classes: 'section-title', [.text('// education')]),
      div(classes: 'section-content', [
        div(classes: 'exp-list', [
          for (final edu in educations)
            div(classes: 'exp-item', [
              div(classes: 'exp-header', [
                div(classes: 'exp-title-group', [
                  h3(classes: 'exp-company', [
                    span(classes: 'exp-chevron', [.text('> ')]),
                    .text(edu.institution),
                  ]),
                  p(classes: 'exp-role', [
                    .text('${edu.degree} in ${edu.area}'),
                  ]),
                ]),
                span(classes: 'exp-date', [.text('[${edu.date}]')]),
              ]),
              p(classes: 'cv-text', [.text(edu.description)]),
            ]),
        ]),
      ]),
    ]);
  }

  Component _buildSkills() {
    return div(classes: 'cv-section', [
      h2(classes: 'section-title', [.text('// skills')]),
      div(classes: 'section-content', [
        div(classes: 'skills-grid', [
          for (final group in skillGroups) _buildSkillGroup(group),
        ]),
      ]),
    ]);
  }

  Component _buildSkillGroup(SkillGroup group) {
    return div(classes: 'skill-group', [
      h3(classes: 'skill-name', [
        span(classes: 'skill-hash', [.text('# ')]),
        .text(group.name),
      ]),
      div(classes: 'skill-tags', [
        for (final tag in group.tags) span(classes: 'skill-tag', [.text(tag)]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
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

    // Terminal window container
    css(
      '.term-window',
    ).styles(radius: .circular(8.px), backgroundColor: termCard),

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
    css('.term-cursor').styles(
      display: .inlineBlock,
      width: 9.px,
      height: 1.125.rem,
      margin: .only(left: 0.25.rem),
      backgroundColor: termGreen,
    ),

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
