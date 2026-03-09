import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

enum TerminalSocialType { link, download }

class TerminalSocial {
  TerminalSocial({required this.text, required this.href, required this.type});

  final String text;
  final String href;
  final TerminalSocialType type;

  Map<String, String> get attributes => switch (type) {
    TerminalSocialType.link => {
      'target': '_blank',
      'rel': 'noopener noreferrer',
    },
    TerminalSocialType.download => {'download': href},
  };

  String get classes {
    return 'term-btn ${type == TerminalSocialType.download ? 'term-btn--dl' : ''}';
  }
}

class Terminal extends StatelessComponent {
  const Terminal({
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.socials,
  });

  final String name;
  final String role;
  final String email;
  final String phone;
  final List<TerminalSocial> socials;

  @override
  Component build(BuildContext context) {
    return div(classes: 'term-window', [
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
        div(classes: 'term-line prompt-line', [
          span(classes: 'term-ps1', [.text('\$')]),
          span(classes: 'term-cmd', [.text(' whoami')]),
        ]),
        div(classes: 'term-output term-output--name', [.text(name)]),
        // cat role.txt
        div(classes: 'term-line prompt-line', [
          span(classes: 'term-ps1', [.text('\$')]),
          span(classes: 'term-cmd', [.text(' cat role.txt')]),
        ]),
        div(classes: 'term-output term-output--role', [.text(role)]),
        // cat contact.json
        div(classes: 'term-line prompt-line', [
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
          a(href: 'mailto:$email', classes: 'term-str term-str--link', [
            .text('"$email"'),
          ]),
          span(classes: 'term-punct', [.text(',')]),
        ]),
        div(classes: 'term-output term-output--json', [
          span(classes: 'term-key', [.text('"phone"')]),
          span(classes: 'term-punct', [.text(': ')]),
          a(
            href: 'tel:${phone.replaceAll(' ', '')}',
            classes: 'term-str term-str--link',
            [.text('"$phone"')],
          ),
        ]),
        div(classes: 'term-output', [
          span(classes: 'term-punct', [.text('}')]),
        ]),
        // ls links/
        div(classes: 'term-line prompt-line', [
          span(classes: 'term-ps1', [.text('\$')]),
          span(classes: 'term-cmd', [.text(' ls links/')]),
        ]),
        div(classes: 'term-output term-links-row', [
          for (final social in socials)
            a(
              href: social.href,
              attributes: social.attributes,
              classes: social.classes,
              [.text(social.text)],
            ),
        ]),
        // Cursor
        div(classes: 'term-line term-line--last prompt-line', [
          span(classes: 'term-ps1', [.text('\$')]),
          span(classes: 'term-cursor', []),
        ]),
      ]),
    ]);
  }
}
