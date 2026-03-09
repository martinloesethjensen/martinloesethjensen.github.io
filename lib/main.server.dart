library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'main.server.options.dart';
import 'theme.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    Document(
      title: 'Martin L. Jensen — Senior Mobile Developer',
      head: [
        link(href: 'favicon.svg', rel: 'icon', type: 'image/svg+xml'),
        // Open Graph
        meta(attributes: {'property': 'og:type', 'content': 'website'}),
        meta(
          attributes: {
            'property': 'og:url',
            'content': 'https://martinloeseth.dev',
          },
        ),
        meta(
          attributes: {
            'property': 'og:title',
            'content': 'Martin L. Jensen — Senior Mobile Developer',
          },
        ),
        meta(
          attributes: {
            'property': 'og:description',
            'content':
                'Senior Mobile Developer specializing in Flutter with 4+ years of experience building cross-platform apps.',
          },
        ),
        meta(
          attributes: {
            'property': 'og:site_name',
            'content': 'Martin L. Jensen',
          },
        ),
        // Twitter Card
        meta(attributes: {'name': 'twitter:card', 'content': 'summary'}),
        meta(
          attributes: {
            'name': 'twitter:title',
            'content': 'Martin L. Jensen — Senior Mobile Developer',
          },
        ),
        meta(
          attributes: {
            'name': 'twitter:description',
            'content':
                'Senior Mobile Developer specializing in Flutter with 4+ years of experience building cross-platform apps.',
          },
        ),
      ],
      meta: {
        'viewport': 'width=device-width, initial-scale=1.0',
        'description':
            'Senior Mobile Developer specializing in Flutter with 4+ years of experience building cross-platform apps.',
      },
      styles: [
        css.import(
          'https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@0,400;0,500;0,700;1,400&display=swap',
        ),
        css('html, body').styles(
          width: 100.percent,
          minHeight: 100.vh,
          padding: .zero,
          margin: .zero,
          color: textColor,
          fontFamily: const .list([
            FontFamily('JetBrains Mono'),
            FontFamilies.monospace,
          ]),
          backgroundColor: lightBg,
        ),
        css(
          'h1, h2, h3, h4, h5, h6',
        ).styles(margin: .zero, color: darkColor, fontWeight: .w700),
        css('p').styles(margin: .zero),
        css('ul, ol').styles(
          padding: .only(left: 1.5.rem),
          margin: .zero,
        ),
        css('a').styles(
          color: primaryColor,
          textDecoration: TextDecoration(line: .none),
        ),
        css('a:hover').styles(color: primaryDarkColor),
        css('*, *::before, *::after').styles(boxSizing: BoxSizing.borderBox),
      ],
      body: const App(),
    ),
  );
}
