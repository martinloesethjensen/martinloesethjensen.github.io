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
        div(classes: 'hero-text', [
          h1(classes: 'hero-name', [.text('Martin L. Jensen')]),
          p(classes: 'hero-headline', [.text('Senior Mobile Developer')]),
          div(classes: 'hero-meta', [
            span(classes: 'hero-meta-item', [
              span(classes: 'meta-icon', [.text('📍')]),
              .text(' Copenhagen'),
            ]),
            span(classes: 'hero-meta-sep', [.text('·')]),
            span(classes: 'hero-meta-item', [
              a(href: 'mailto:martin.loeseth@proton.me', [
                .text('martin.loeseth@proton.me'),
              ]),
            ]),
            span(classes: 'hero-meta-sep', [.text('·')]),
            span(classes: 'hero-meta-item', [
              a(href: 'tel:+4531563146', [.text('+45 31 56 31 46')]),
            ]),
          ]),
          div(classes: 'hero-links', [
            a(
              href: 'https://github.com/martinloesethjensen',
              attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
              classes: 'hero-link',
              [.text('GitHub')],
            ),
            a(
              href: 'https://linkedin.com/in/martinloesethjensen',
              attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
              classes: 'hero-link',
              [.text('LinkedIn')],
            ),
            a(
              href: 'martin-jensen-cv.pdf',
              attributes: {'download': 'martin-jensen-cv.pdf'},
              classes: 'hero-link hero-link--dl',
              [.text('↓ Download CV')],
            ),
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildSummary() {
    return div(classes: 'cv-section', [
      h2(classes: 'section-title', [.text('Summary')]),
      div(classes: 'section-content', [
        p([
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
      h2(classes: 'section-title', [.text('Experience')]),
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
          h3(classes: 'exp-company', [.text(exp.company)]),
          p(classes: 'exp-role', [.text('${exp.position} · ${exp.location}')]),
        ]),
        span(classes: 'exp-date', [.text(exp.date)]),
      ]),
      ul(classes: 'exp-bullets', [
        for (final bullet in exp.bullets) li([.text(bullet)]),
      ]),
    ]);
  }

  Component _buildEducation() {
    return div(classes: 'cv-section', [
      h2(classes: 'section-title', [.text('Education')]),
      div(classes: 'section-content', [
        div(classes: 'exp-list', [
          for (final edu in educations)
            div(classes: 'exp-item', [
              div(classes: 'exp-header', [
                div(classes: 'exp-title-group', [
                  h3(classes: 'exp-company', [.text(edu.institution)]),
                  p(classes: 'exp-role', [
                    .text('${edu.degree} in ${edu.area}'),
                  ]),
                ]),
                span(classes: 'exp-date', [.text(edu.date)]),
              ]),
              p(classes: 'edu-description', [.text(edu.description)]),
            ]),
        ]),
      ]),
    ]);
  }

  Component _buildSkills() {
    return div(classes: 'cv-section', [
      h2(classes: 'section-title', [.text('Skills')]),
      div(classes: 'section-content', [
        div(classes: 'skills-grid', [
          for (final group in skillGroups) _buildSkillGroup(group),
        ]),
      ]),
    ]);
  }

  Component _buildSkillGroup(SkillGroup group) {
    return div(classes: 'skill-group', [
      h3(classes: 'skill-name', [.text(group.name)]),
      div(classes: 'skill-tags', [
        for (final tag in group.tags) span(classes: 'skill-tag', [.text(tag)]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Hero
    css('.hero').styles(
      padding: .symmetric(vertical: 5.rem),
      color: heroText,
      backgroundColor: heroBg,
    ),
    css('.hero-inner').styles(
      maxWidth: 960.px,
      padding: .symmetric(horizontal: 1.5.rem),
      margin: .symmetric(horizontal: Unit.auto),
    ),
    css('.hero-name').styles(
      margin: .only(bottom: 0.5.rem),
      color: const Color('#f1f5f9'),
      fontSize: 3.rem,
      fontWeight: .w700,
    ),
    css('.hero-headline').styles(
      margin: .only(bottom: 1.5.rem),
      color: primaryColor,
      fontSize: 1.25.rem,
      fontWeight: .w400,
    ),
    css('.hero-meta').styles(
      display: .flex,
      margin: .only(bottom: 1.5.rem),
      flexWrap: .wrap,
      alignItems: .center,
      gap: Gap.all(0.5.rem),
    ),
    css(
      '.hero-meta-item',
    ).styles(color: const Color('#94a3b8'), fontSize: 0.9375.rem),
    css('.hero-meta-item a').styles(color: const Color('#93c5fd')),
    css('.hero-meta-item a:hover').styles(color: const Color('#bfdbfe')),
    css('.hero-meta-sep').styles(color: const Color('#475569')),
    css('.hero-links').styles(display: .flex, gap: Gap.all(0.75.rem)),
    css('.hero-link').styles(
      display: .inlineBlock,
      padding: .symmetric(horizontal: 1.rem, vertical: 0.5.rem),
      radius: .circular(6.px),
      color: const Color('#ffffff'),
      fontSize: 0.875.rem,
      fontWeight: .w500,
      textDecoration: TextDecoration(line: .none),
      backgroundColor: primaryColor,
    ),
    css(
      '.hero-link:hover',
    ).styles(color: const Color('#ffffff'), backgroundColor: primaryDarkColor),
    css('.hero-link--dl').styles(backgroundColor: const Color('#1e4976')),
    css('.hero-link--dl:hover').styles(backgroundColor: const Color('#163554')),

    // CV wrap
    css('.cv-wrap').styles(
      display: .flex,
      maxWidth: 960.px,
      padding: .symmetric(horizontal: 1.5.rem, vertical: 3.rem),
      margin: .symmetric(horizontal: Unit.auto),
      flexDirection: .column,
      gap: Gap.all(3.rem),
    ),

    // Sections
    css(
      '.cv-section',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(1.5.rem)),
    css('.section-title').styles(
      padding: .only(bottom: 0.75.rem),
      color: darkColor,
      fontSize: 1.125.rem,
      fontWeight: .w700,
    ),
    css(
      '.section-content',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(1.25.rem)),

    // Experience items
    css(
      '.exp-list',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(2.rem)),
    css(
      '.exp-item',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(0.75.rem)),
    css('.exp-header').styles(
      display: .flex,
      flexWrap: .wrap,
      justifyContent: .spaceBetween,
      alignItems: .start,
      gap: Gap.all(1.rem),
    ),
    css(
      '.exp-title-group',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(0.2.rem)),
    css(
      '.exp-company',
    ).styles(color: darkColor, fontSize: 1.rem, fontWeight: .w600),
    css(
      '.exp-role',
    ).styles(color: mutedColor, fontSize: 0.9375.rem, fontWeight: .w400),
    css('.exp-date').styles(
      color: mutedColor,
      fontSize: 0.875.rem,
      fontWeight: .w400,
      whiteSpace: .noWrap,
    ),
    css('.exp-bullets').styles(
      display: .flex,
      padding: .only(left: 1.25.rem),
      flexDirection: .column,
      gap: Gap.all(0.375.rem),
    ),
    css('.exp-bullets li').styles(color: textColor, fontSize: 0.9375.rem),
    css('.edu-description').styles(color: textColor, fontSize: 0.9375.rem),

    // Skills
    css(
      '.skills-grid',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(1.5.rem)),
    css(
      '.skill-group',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(0.625.rem)),
    css(
      '.skill-name',
    ).styles(color: darkColor, fontSize: 0.9375.rem, fontWeight: .w600),
    css(
      '.skill-tags',
    ).styles(display: .flex, flexWrap: .wrap, gap: Gap.all(0.5.rem)),
    css('.skill-tag').styles(
      display: .inlineBlock,
      padding: .symmetric(horizontal: 0.75.rem, vertical: 0.25.rem),
      radius: .circular(20.px),
      color: tagText,
      fontSize: 0.8125.rem,
      fontWeight: .w500,
      backgroundColor: tagBg,
    ),
  ];
}
