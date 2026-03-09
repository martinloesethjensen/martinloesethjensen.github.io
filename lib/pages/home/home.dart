import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../components/terminal.dart';
import '../../data/cv_data.dart';
import 'home.css.dart';

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
        Terminal(
          name: 'Martin L. Jensen',
          role: 'Senior Mobile Developer',
          email: 'martin.loeseth@proton.me',
          phone: '+45 31 56 31 46',
          socials: [
            TerminalSocial(
              text: 'GitHub',
              href: 'https://github.com/martinloesethjensen',
              type: TerminalSocialType.link,
            ),
            TerminalSocial(
              text: 'LinkedIn',
              href: 'https://linkedin.com/in/martinloesethjensen',
              type: TerminalSocialType.link,
            ),
            TerminalSocial(
              text: '↓ CV.pdf',
              href: 'martin-jensen-cv.pdf',
              type: TerminalSocialType.download,
            ),
          ],
        ),
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
  static List<StyleRule> get styles => HomeCss.styles;
}
