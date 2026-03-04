import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'components/header.dart';
import 'pages/home.dart';
import 'pages/projects.dart';
import 'theme.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'site', [
      const Header(),
      div(classes: 'page-content', [
        Router(
          routes: [
            Route(
              path: '/',
              title: 'Martin L. Jensen',
              builder: (_, __) => const Home(),
            ),
            Route(
              path: '/projects',
              title: 'Projects — Martin L. Jensen',
              builder: (_, __) => const Projects(),
            ),
          ],
        ),
      ]),
      footer(classes: 'site-footer', [
        div(classes: 'footer-inner', [
          p([.text('© 2026 Martin L, Jensen · Copenhagen')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css(
      '.site',
    ).styles(display: .flex, minHeight: 100.vh, flexDirection: .column),
    css('.page-content').styles(flex: Flex(grow: 1)),
    css('.site-footer').styles(
      padding: .symmetric(vertical: 2.rem),
      color: mutedColor,
      backgroundColor: heroBg,
    ),
    css('.footer-inner').styles(
      display: .flex,
      padding: .symmetric(horizontal: 1.5.rem),
      justifyContent: .center,
    ),
    css('.footer-inner p').styles(color: mutedColor, fontSize: 0.875.rem),
  ];
}
