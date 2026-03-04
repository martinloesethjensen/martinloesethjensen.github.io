// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:martin_portfolio/components/header.dart' as _header;
import 'package:martin_portfolio/pages/home.dart' as _home;
import 'package:martin_portfolio/pages/projects.dart' as _projects;
import 'package:martin_portfolio/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',

  styles: () => [
    ..._header.Header.styles,
    ..._home.Home.styles,
    ..._projects.Projects.styles,
    ..._app.App.styles,
  ],
);
