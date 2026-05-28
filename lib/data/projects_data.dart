import '../models/project.dart';

const projectsData = [
  Project(
    title: 'Snake Universe',
    description:
        'A retro 8-bit Snake game built with Flutter and Flame, featuring a global leaderboard powered by Supabase and hosted on Firebase.',
    languages: [ProjectLanguage(name: 'Dart', color: '#00B4AB')],
    url: GitHubProjectUrl(
      url: 'https://github.com/martinloesethjensen/snake_universe',
    ),
    liveUrl: ProjectUrl(
      url: 'https://snakegame.martinloeseth.dev',
      label: 'play',
      emoji: '🕹️',
    ),
    icon: '🐍',
    tags: ['Flutter', 'Flame', 'Supabase', 'Firebase', 'Game'],
  ),

  Project(
    title: 'GenkiFlow',
    description:
        'An iOS app for Japanese language learning, combining JMDict dictionary data and kanji resources into a streamlined study experience.',
    languages: [ProjectLanguage(name: 'Swift', color: '#f05138')],
    url: GitHubProjectUrl(
      url: 'https://github.com/martinloesethjensen/genkiflow',
    ),
    icon: '⛩️',
    tags: ['iOS', 'SwiftUI', 'Kanji', 'Learning'],
  ),

  Project(
    title: 'TREK',
    description:
        'A TREK trip planning webapp, that is built from \'mauriceboe/TREK\' Docker image and self-hosted on Railway.app',
    liveUrl: ProjectUrl(
      url: 'https://trek.martinloeseth.dev',
      label: 'go there',
      emoji: '🧭',
    ),
    icon: '🗺️',
    tags: ['self-host', 'Railway', 'docker'],
  ),

  Project(
    title: 'AltStore Source',
    description:
        'A personal AltStore source for distributing and sideloading iOS apps — no jailbreak required.',
    url: GitHubProjectUrl(
      url: 'https://github.com/martinloesethjensen/altstore-source',
    ),
    languages: [ProjectLanguage(name: 'JSON', color: '#292929')],
    icon: '🚀',
    comingSoon: true,
    tags: ['iOS', 'AltStore', 'Sideloading', 'App Distribution'],
  ),
];
