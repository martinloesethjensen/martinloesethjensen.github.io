/// Generates a CV PDF from cv.json (rxresume format).
/// Run from project root: dart run bin/generate_cv.dart
library;

import 'dart:convert';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

// ── Colors (matching rxresume onyx theme) ────────────────────────────────────
final _blue = PdfColor.fromHex('0284c7');
final _dark = PdfColor.fromHex('0f172a');
final _text = PdfColor.fromHex('334155');
final _muted = PdfColor.fromHex('64748b');
final _tagBg = PdfColor.fromHex('eff6ff');
final _tagText = PdfColor.fromHex('2563eb');
final _rule = PdfColor.fromHex('e2e8f0');

// ── HTML helpers ─────────────────────────────────────────────────────────────
List<String> _bullets(String html) => RegExp(
  r'<li>(.*?)</li>',
  dotAll: true,
).allMatches(html).map((m) => m.group(1)!.replaceAll(RegExp(r'<[^>]*>'), '').trim()).toList();

String _text_(String html) => html.replaceAll(RegExp(r'<[^>]*>'), '').trim();

// ── Building blocks ───────────────────────────────────────────────────────────
pw.Widget _sectionTitle(String title, pw.Font bold) => pw.Padding(
  padding: const pw.EdgeInsets.only(bottom: 6),
  child: pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.center,
    children: [
      pw.Text(
        title.toUpperCase(),
        style: pw.TextStyle(
          font: bold,
          fontSize: 7.5,
          color: _blue,
          letterSpacing: 1.5,
        ),
      ),
      pw.SizedBox(width: 8),
      pw.Expanded(child: pw.Divider(height: 1, thickness: 0.5, color: _rule)),
    ],
  ),
);

pw.Widget _bullet(String text, pw.Font regular) => pw.Padding(
  padding: const pw.EdgeInsets.only(bottom: 2.5, left: 4),
  child: pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        '• ',
        style: pw.TextStyle(font: regular, fontSize: 9, color: _muted),
      ),
      pw.Expanded(
        child: pw.Text(
          text,
          style: pw.TextStyle(
            font: regular,
            fontSize: 9,
            color: _text,
            lineSpacing: 1.5,
          ),
        ),
      ),
    ],
  ),
);

pw.Widget _tag(String label, pw.Font regular) => pw.Container(
  padding: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 2),
  decoration: pw.BoxDecoration(
    color: _tagBg,
    borderRadius: const pw.BorderRadius.all(pw.Radius.circular(10)),
  ),
  child: pw.Text(
    label,
    style: pw.TextStyle(font: regular, fontSize: 7.5, color: _tagText),
  ),
);

// ── Main ─────────────────────────────────────────────────────────────────────
void main() async {
  final cvJson = jsonDecode(File('cv.json').readAsStringSync()) as Map<String, dynamic>;
  final basics = cvJson['basics'] as Map<String, dynamic>;
  final sections = cvJson['sections'] as Map<String, dynamic>;

  final experiences = (sections['experience']['items'] as List)
      .cast<Map<String, dynamic>>()
      .where((e) => e['visible'] == true)
      .toList();
  final educations = (sections['education']['items'] as List)
      .cast<Map<String, dynamic>>()
      .where((e) => e['visible'] == true)
      .toList();
  final skills = (sections['skills']['items'] as List)
      .cast<Map<String, dynamic>>()
      .where((e) => e['visible'] == true)
      .toList();
  final summaryHtml = sections['summary']['content'] as String;

  final regular = pw.Font.times();
  final bold = pw.Font.timesBold();
  final italic = pw.Font.timesItalic();

  final bodyStyle = pw.TextStyle(
    font: regular,
    fontSize: 9.5,
    color: _text,
    lineSpacing: 2,
  );
  final mutedStyle = pw.TextStyle(font: regular, fontSize: 8.5, color: _muted);
  final italicStyle = pw.TextStyle(font: italic, fontSize: 8.5, color: _muted);
  final boldStyle = pw.TextStyle(font: bold, fontSize: 10, color: _dark);

  final pdf = pw.Document(
    title: '${basics['name']} — CV',
    author: basics['name'] as String,
    subject: basics['headline'] as String,
    creator: 'martinloesethjensen.github.io',
  );

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(18 * PdfPageFormat.mm),
      build: (context) => [
        // ── Header ─────────────────────────────────────────────────────────
        pw.Text(
          basics['name'] as String,
          style: pw.TextStyle(font: bold, fontSize: 22, color: _dark),
        ),
        pw.SizedBox(height: 3),
        pw.Text(
          basics['headline'] as String,
          style: pw.TextStyle(font: regular, fontSize: 11, color: _blue),
        ),
        pw.SizedBox(height: 5),
        pw.Row(
          children: [
            pw.Text(basics['location'] as String, style: mutedStyle),
            pw.Text('   ·   ', style: mutedStyle),
            pw.Text(
              basics['email'] as String,
              style: pw.TextStyle(font: regular, fontSize: 8.5, color: _blue),
            ),
            pw.Text('   ·   ', style: mutedStyle),
            pw.Text(basics['phone'] as String, style: mutedStyle),
          ],
        ),
        pw.SizedBox(height: 12),
        pw.Divider(height: 1, thickness: 0.5, color: _rule),
        pw.SizedBox(height: 14),

        // ── Summary ─────────────────────────────────────────────────────────
        _sectionTitle('Summary', bold),
        pw.Text(_text_(summaryHtml), style: bodyStyle),
        pw.SizedBox(height: 16),

        // ── Experience ──────────────────────────────────────────────────────
        _sectionTitle('Experience', bold),
        for (int i = 0; i < experiences.length; i++) ...[
          if (i > 0) pw.SizedBox(height: 11),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      experiences[i]['company'] as String,
                      style: boldStyle,
                    ),
                    pw.SizedBox(height: 1),
                    pw.Text(
                      '${experiences[i]['position']}  ·  ${experiences[i]['location']}',
                      style: mutedStyle,
                    ),
                  ],
                ),
              ),
              pw.Text(experiences[i]['date'] as String, style: italicStyle),
            ],
          ),
          pw.SizedBox(height: 4),
          for (final b in _bullets(experiences[i]['summary'] as String)) _bullet(b, regular),
        ],
        pw.SizedBox(height: 16),

        // ── Education ───────────────────────────────────────────────────────
        _sectionTitle('Education', bold),
        for (int i = 0; i < educations.length; i++) ...[
          if (i > 0) pw.SizedBox(height: 11),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      educations[i]['institution'] as String,
                      style: boldStyle,
                    ),
                    pw.SizedBox(height: 1),
                    pw.Text(
                      '${educations[i]['studyType']} in ${educations[i]['area']}',
                      style: mutedStyle,
                    ),
                  ],
                ),
              ),
              pw.Text(educations[i]['date'] as String, style: italicStyle),
            ],
          ),
          pw.SizedBox(height: 4),
          pw.Text(_text_(educations[i]['summary'] as String), style: bodyStyle),
        ],
        pw.SizedBox(height: 16),

        // ── Skills ──────────────────────────────────────────────────────────
        _sectionTitle('Skills', bold),
        for (int i = 0; i < skills.length; i++) ...[
          if (i > 0) pw.SizedBox(height: 9),
          pw.Text(
            skills[i]['name'] as String,
            style: pw.TextStyle(font: bold, fontSize: 9.5, color: _dark),
          ),
          pw.SizedBox(height: 4),
          pw.Wrap(
            spacing: 4,
            runSpacing: 3,
            children: [
              for (final kw in (skills[i]['keywords'] as List).cast<String>()) _tag(kw, regular),
            ],
          ),
        ],
      ],
    ),
  );

  final output = File('web/martin-jensen-cv.pdf');
  await output.writeAsBytes(await pdf.save());
  stdout.writeln('Generated: ${output.path}');
}
