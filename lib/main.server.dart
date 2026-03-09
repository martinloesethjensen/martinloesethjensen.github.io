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
        css('h1, h2, h3, h4, h5, h6').styles(
          margin: .zero,
          color: darkColor,
          fontWeight: .w700,
        ),
        css('p').styles(margin: .zero),
        css('ul, ol').styles(padding: .only(left: 1.5.rem), margin: .zero),
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
