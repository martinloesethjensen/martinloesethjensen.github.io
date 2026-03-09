import '../models/project.dart';

const projectsData = [
  Project(
    title: 'Snake Universe',
    description:
        'A retro 8-bit Snake game built with Flutter and Flame, featuring a global leaderboard powered by Supabase and hosted on Firebase.',
    url: 'https://github.com/martinloesethjensen/snake_universe',
    liveUrl: 'https://snakegame.martinloeseth.dev',
    language: 'Dart',
    languageColor: '#00B4AB',
    icon: '🐍',
    tags: ['Flutter', 'Flame', 'Supabase', 'Firebase', 'Game'],
  ),

  Project(
    title: 'GenkiFlow',
    description:
        'An iOS app for Japanese language learning, combining JMDict dictionary data and kanji resources into a streamlined study experience.',
    url: 'https://github.com/martinloesethjensen/genkiflow',
    language: 'Swift',
    languageColor: '#f05138',
    icon: '⛩️',
    tags: ['iOS', 'SwiftUI', 'Kanji', 'Learning'],
  ),

  Project(
    title: 'AltStore Source',
    description: 'A personal AltStore source for distributing and sideloading iOS apps — no jailbreak required.',
    url: 'https://github.com/martinloesethjensen/altstore-source',
    language: 'JSON',
    languageColor: '#292929',
    icon: '🚀',
    comingSoon: true,
    tags: ['iOS', 'AltStore', 'Sideloading', 'App Distribution'],
  ),
];
