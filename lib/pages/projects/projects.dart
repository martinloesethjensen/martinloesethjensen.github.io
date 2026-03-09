import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../data/projects_data.dart';
import '../../models/project.dart';
import 'projects.css.dart';

class Projects extends StatelessComponent {
  const Projects({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'projects-page', [
      div(classes: 'projects-inner', [
        // Page header as terminal prompt
        div(classes: 'projects-hero', [
          div(classes: 'proj-term-line prompt-line', [
            span(classes: 'proj-ps1', [.text('\$')]),
            span(classes: 'proj-cmd', [.text(' ls ~/projects/')]),
          ]),
          p(classes: 'projects-subtitle', [
            span(classes: 'proj-comment', [
              .text('// open source work and side projects'),
            ]),
          ]),
        ]),

        // Project cards grid
        div(classes: 'projects-grid', [
          for (final project in projectsData) _buildCard(project),
        ]),

        // Footer
        div(classes: 'projects-footer', [
          a(
            href: 'https://github.com/martinloesethjensen',
            attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
            classes: 'github-profile-btn',
            [.text('View all on GitHub 🐙 →')],
          ),
        ]),
      ]),
    ]);
  }

  Component _buildCard(Project project) {
    return div(classes: 'project-card', [
      // Card title bar
      div(classes: 'card-titlebar', [
        div(classes: 'card-dots', [
          span(classes: 'card-dot card-dot--red', []),
          span(classes: 'card-dot card-dot--yellow', []),
          span(classes: 'card-dot card-dot--green', []),
        ]),
        span(classes: 'card-wintitle', [.text(project.title.toLowerCase())]),
      ]),
      // Card body
      div(classes: 'card-body', [
        div(classes: 'card-header-row', [
          span(classes: 'project-icon', [.text(project.icon)]),
          if (project.liveUrl != null)
            a(
              href: project.liveUrl!,
              attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
              classes: 'project-play-btn',
              [.text('🕹️ play')],
            ),
          if (project.comingSoon) span(classes: 'project-badge', [.text('coming soon')]),
        ]),
        div(classes: 'project-name-line prompt-line', [
          span(classes: 'proj-chevron', [.text('>')]),
          h2(classes: 'project-name', [.text(project.title)]),
        ]),
        p(classes: 'project-description', [.text(project.description)]),
        if (project.tags.isNotEmpty)
          div(classes: 'project-tags', [
            for (final tag in project.tags) span(classes: 'project-tag', [.text(tag)]),
          ]),
        div(classes: 'project-card-footer', [
          div(classes: 'project-lang', [
            span(
              classes: 'lang-dot',
              styles: Styles(backgroundColor: Color(project.languageColor)),
              [],
            ),
            span(classes: 'lang-label', [.text(project.language)]),
          ]),
          div(classes: 'project-card-actions', [
            a(
              href: project.url,
              attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
              classes: 'project-link',
              [.text('view on GitHub 🐙 →')],
            ),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => ProjectsCss.styles;
}
