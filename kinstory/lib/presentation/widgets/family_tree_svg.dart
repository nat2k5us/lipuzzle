import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// Simple node model for the SVG layout.
class FamilyNode {
  final String id;      // internal id, here we just use the name
  final String label;   // display label (also name)
  final int generation; // vertical level

  double x = 0; // set during layout
  double y = 0;

  FamilyNode({
    required this.id,
    required this.label,
    required this.generation,
  });
}

class Edge {
  final String fromId;
  final String toId;

  Edge({required this.fromId, required this.toId});
}

/// Load JSON from assets and build SVG
Future<String> loadFamilyTreeSvg() async {
  final jsonStr = await rootBundle.loadString('assets/krishna-family-tree.json');
  final Map<String, dynamic> data = json.decode(jsonStr);

  final parsed = parseFamilyTree(data);
  layoutNodes(parsed.nodes);

  final svg = buildSvg(parsed.nodes, parsed.edges);
  return svg;
}

class ParsedTree {
  final List<FamilyNode> nodes;
  final List<Edge> edges;

  ParsedTree({required this.nodes, required this.edges});
}

/// ---- PARSING ----

ParsedTree parseFamilyTree(Map<String, dynamic> data) {
  final genMap = <String, int>{};
  final nodesMap = <String, FamilyNode>{};
  final edges = <Edge>[];

  // Define generation levels for key figures manually
  // Generation 0: Supreme
  genMap['Śrī Kṛṣṇa'] = 0;

  // Generation 1: Direct expansions and Brahma
  genMap['Mahā-Viṣṇu'] = 1;
  genMap['Garbhodakaśāyī Viṣṇu'] = 1;
  genMap['Kṣīrodakaśāyī Viṣṇu'] = 1;
  genMap['Lord Brahmā'] = 1;

  // Generation 2: Prajapatis
  genMap['Marīci'] = 2;
  genMap['Atri'] = 2;
  genMap['Aṅgirā'] = 2;
  genMap['Pulaha'] = 2;
  genMap['Pulastya'] = 2;
  genMap['Kratu'] = 2;
  genMap['Vasiṣṭha'] = 2;
  genMap['Bhṛgu'] = 2;
  genMap['Dakṣa'] = 2;

  // Generation 3: Children of Prajapatis
  genMap['Kaśyapa'] = 3;
  genMap['Candra'] = 3;

  // Generation 4: Solar and Lunar dynasty founders
  genMap['Vivasvān (Sūrya)'] = 4;
  genMap['Vivasvān'] = 4;
  genMap['Budha'] = 4;

  // Generation 5: Early ancestors
  genMap['Manu'] = 5;
  genMap['Purūravas'] = 5;

  // Generation 6-10: Middle ancestors
  genMap['Ikṣvāku'] = 6;
  genMap['Āyu'] = 6;
  genMap['Nahuṣa'] = 7;
  genMap['Yayāti'] = 8;

  // Generation 11: Yayāti's sons
  genMap['Puru'] = 11;
  genMap['Yadu'] = 11;
  genMap['Druhyu'] = 11;
  genMap['Anu'] = 11;
  genMap['Turvasu'] = 11;

  // Generation 12-20: Middle generations (simplified)
  // Skip many generations...

  // Generation 21: Kuru dynasty
  genMap['Kuru'] = 21;
  genMap['Śantanu'] = 22;
  genMap['Bhīṣma'] = 23;
  genMap['Vicitravīrya'] = 23;
  genMap['Citrāṅgada'] = 23;

  // Generation 24: Dhṛtarāṣṭra and Pāṇḍu
  genMap['Dhṛtarāṣṭra'] = 24;
  genMap['Pāṇḍu'] = 24;
  genMap['Vidura'] = 24;

  // Generation 25: Pāṇḍavas and Kauravas
  genMap['Yudhiṣṭhira'] = 25;
  genMap['Bhīma'] = 25;
  genMap['Arjuna'] = 25;
  genMap['Nakula'] = 25;
  genMap['Sahadeva'] = 25;
  genMap['Duryodhana'] = 25;
  genMap['Duḥśāsana'] = 25;

  // Generation 26: Children of Pāṇḍavas
  genMap['Abhimanyu'] = 26;
  genMap['Ghaṭotkaca'] = 26;
  genMap['Prativindhya'] = 26;
  genMap['Sutasoma'] = 26;
  genMap['Śrutakīrti'] = 26;
  genMap['Śatānīka'] = 26;
  genMap['Śrutakarma'] = 26;

  // Generation 27: Parikṣit
  genMap['Parikṣit'] = 27;

  // Yadu line to Krishna (parallel branch)
  genMap['Śūrasena'] = 23;
  genMap['Vasudeva'] = 24;
  genMap['Devakī'] = 24;
  genMap['Balarāma'] = 25;
  // Note: Krishna at generation 0 as supreme

  // Helper: ensure node exists
  FamilyNode _ensureNode(String name) {
    return nodesMap.putIfAbsent(
      name,
      () => FamilyNode(
        id: name,
        label: name,
        generation: genMap[name] ?? 0,
      ),
    );
  }

  // 1. Create nodes for all mapped names
  genMap.forEach((name, _) {
    _ensureNode(name);
  });

  // 2. Define edges manually for main connections
  // Supreme to expansions
  edges.add(Edge(fromId: 'Śrī Kṛṣṇa', toId: 'Mahā-Viṣṇu'));
  edges.add(Edge(fromId: 'Śrī Kṛṣṇa', toId: 'Garbhodakaśāyī Viṣṇu'));
  edges.add(Edge(fromId: 'Śrī Kṛṣṇa', toId: 'Kṣīrodakaśāyī Viṣṇu'));

  // Creation
  edges.add(Edge(fromId: 'Garbhodakaśāyī Viṣṇu', toId: 'Lord Brahmā'));

  // Prajapatis from Brahma
  edges.add(Edge(fromId: 'Lord Brahmā', toId: 'Marīci'));
  edges.add(Edge(fromId: 'Lord Brahmā', toId: 'Atri'));
  edges.add(Edge(fromId: 'Lord Brahmā', toId: 'Dakṣa'));

  // Key lineages
  edges.add(Edge(fromId: 'Marīci', toId: 'Kaśyapa'));
  edges.add(Edge(fromId: 'Atri', toId: 'Candra'));

  // Solar dynasty
  edges.add(Edge(fromId: 'Kaśyapa', toId: 'Vivasvān'));
  edges.add(Edge(fromId: 'Vivasvān', toId: 'Manu'));
  edges.add(Edge(fromId: 'Manu', toId: 'Ikṣvāku'));

  // Lunar dynasty
  edges.add(Edge(fromId: 'Candra', toId: 'Budha'));
  edges.add(Edge(fromId: 'Budha', toId: 'Purūravas'));
  edges.add(Edge(fromId: 'Purūravas', toId: 'Āyu'));
  edges.add(Edge(fromId: 'Āyu', toId: 'Nahuṣa'));
  edges.add(Edge(fromId: 'Nahuṣa', toId: 'Yayāti'));

  // Yayāti's sons
  edges.add(Edge(fromId: 'Yayāti', toId: 'Puru'));
  edges.add(Edge(fromId: 'Yayāti', toId: 'Yadu'));

  // Kuru line (simplified - many generations skipped)
  edges.add(Edge(fromId: 'Puru', toId: 'Kuru'));
  edges.add(Edge(fromId: 'Kuru', toId: 'Śantanu'));
  edges.add(Edge(fromId: 'Śantanu', toId: 'Bhīṣma'));
  edges.add(Edge(fromId: 'Śantanu', toId: 'Vicitravīrya'));

  // Next generation
  edges.add(Edge(fromId: 'Vicitravīrya', toId: 'Dhṛtarāṣṭra'));
  edges.add(Edge(fromId: 'Vicitravīrya', toId: 'Pāṇḍu'));

  // Pāṇḍavas
  edges.add(Edge(fromId: 'Pāṇḍu', toId: 'Yudhiṣṭhira'));
  edges.add(Edge(fromId: 'Pāṇḍu', toId: 'Bhīma'));
  edges.add(Edge(fromId: 'Pāṇḍu', toId: 'Arjuna'));
  edges.add(Edge(fromId: 'Pāṇḍu', toId: 'Nakula'));
  edges.add(Edge(fromId: 'Pāṇḍu', toId: 'Sahadeva'));

  // Kauravas
  edges.add(Edge(fromId: 'Dhṛtarāṣṭra', toId: 'Duryodhana'));

  // Children of Pāṇḍavas
  edges.add(Edge(fromId: 'Arjuna', toId: 'Abhimanyu'));
  edges.add(Edge(fromId: 'Bhīma', toId: 'Ghaṭotkaca'));

  // Parikṣit
  edges.add(Edge(fromId: 'Abhimanyu', toId: 'Parikṣit'));

  // Yadu to Krishna line
  edges.add(Edge(fromId: 'Yadu', toId: 'Śūrasena'));
  edges.add(Edge(fromId: 'Śūrasena', toId: 'Vasudeva'));
  edges.add(Edge(fromId: 'Vasudeva', toId: 'Balarāma'));
  // Note: Krishna is supreme, not shown as child of Vasudeva here

  return ParsedTree(nodes: nodesMap.values.toList(), edges: edges);
}

/// ---- LAYOUT ----

void layoutNodes(List<FamilyNode> nodes) {
  if (nodes.isEmpty) return;

  // Group by generation
  final byGen = <int, List<FamilyNode>>{};
  for (final n in nodes) {
    byGen.putIfAbsent(n.generation, () => []).add(n);
  }

  const double levelHeight = 140.0; // vertical spacing between generations
  const double nodeWidth = 160.0;   // just for layout spacing
  const double horizontalGap = 40.0;
  const double margin = 40.0;

  // Sort generations
  final sortedGens = byGen.keys.toList()..sort();

  // Calculate max width needed
  double maxWidth = 0;
  for (final list in byGen.values) {
    final width = list.length * nodeWidth + (list.length - 1) * horizontalGap;
    if (width > maxWidth) maxWidth = width;
  }

  // Layout nodes
  for (final gen in sortedGens) {
    final list = byGen[gen]!;
    list.sort((a, b) => a.label.compareTo(b.label)); // deterministic order
    final count = list.length;
    if (count == 0) continue;

    final totalWidth = count * nodeWidth + (count - 1) * horizontalGap;
    double startX = (maxWidth - totalWidth) / 2 + margin; // center horizontally

    for (final node in list) {
      node.x = startX + nodeWidth / 2;
      node.y = margin + gen * levelHeight;
      startX += nodeWidth + horizontalGap;
    }
  }
}

/// ---- SVG GENERATION ----

String buildSvg(List<FamilyNode> nodes, List<Edge> edges) {
  if (nodes.isEmpty) {
    return '<svg xmlns="http://www.w3.org/2000/svg" width="800" height="600"></svg>';
  }

  const double nodeWidth = 160.0;
  const double nodeHeight = 60.0;
  const double radius = 12.0;

  final maxX = nodes.map((n) => n.x).reduce((a, b) => a > b ? a : b);
  final maxY = nodes.map((n) => n.y).reduce((a, b) => a > b ? a : b);

  final width = maxX + nodeWidth;
  final height = maxY + nodeHeight + 40.0;

  final nodeMap = {for (var n in nodes) n.id: n};

  final sb = StringBuffer();
  sb.writeln(
      '<svg xmlns="http://www.w3.org/2000/svg" width="$width" height="$height" '
      'viewBox="0 0 $width $height" font-family="serif">');

  // Edges with curved paths
  for (final e in edges) {
    final from = nodeMap[e.fromId];
    final to = nodeMap[e.toId];
    if (from == null || to == null) continue;

    final x1 = from.x;
    final y1 = from.y + nodeHeight / 2;
    final x2 = to.x;
    final y2 = to.y - nodeHeight / 2;

    String strokeColor = '#555';
    String strokeWidth = '1.5';
    String strokeDasharray = '';

    if (e.fromId == 'Śrī Kṛṣṇa' || e.toId.contains('Viṣṇu')) {
      strokeColor = '#ffd700';
      strokeWidth = '2';
      strokeDasharray = 'stroke-dasharray="5,3"';
    }

    // Use quadratic bezier for smoother curves
    final midY = (y1 + y2) / 2;
    sb.writeln(
        '<path stroke="$strokeColor" stroke-width="$strokeWidth" fill="none" $strokeDasharray d="M $x1 $y1 Q $x1 $midY $x2 $y2" />');
  }

  // Nodes
  for (final n in nodes) {
    final rectX = n.x - nodeWidth / 2;
    final rectY = n.y - nodeHeight / 2;

    String nodeClass = 'node';
    String labelClass = 'label';

    // Supreme
    if (n.label == 'Śrī Kṛṣṇa') {
      nodeClass = 'node-supreme';
      labelClass = 'label-supreme';
    }
    // Viṣṇu expansions
    else if (n.label.contains('Viṣṇu') ||
             n.label == 'Mahā-Viṣṇu' ||
             n.label == 'Garbhodakaśāyī Viṣṇu' ||
             n.label == 'Kṣīrodakaśāyī Viṣṇu') {
      nodeClass = 'node-vishnu';
    }
    // Brahmā and direct descendants (Prajapatis)
    else if (n.label == 'Lord Brahmā' ||
             n.label == 'Marīci' ||
             n.label == 'Atri' ||
             n.label == 'Aṅgirā' ||
             n.label == 'Pulaha' ||
             n.label == 'Pulastya' ||
             n.label == 'Kratu' ||
             n.label == 'Vasiṣṭha' ||
             n.label == 'Bhṛgu' ||
             n.label == 'Dakṣa' ||
             n.label == 'Kaśyapa' ||
             n.label == 'Candra') {
      nodeClass = 'node-brahma';
    }
    // Pāṇḍavas and their children
    else if (['Yudhiṣṭhira', 'Bhīma', 'Arjuna', 'Nakula', 'Sahadeva',
              'Abhimanyu', 'Ghaṭotkaca', 'Prativindhya', 'Sutasoma',
              'Śrutakīrti', 'Śatānīka', 'Śrutakarma', 'Parikṣit'].contains(n.label)) {
      nodeClass = 'node-pandava';
    }
    // Kauravas (Dhṛtarāṣṭra and his sons)
    else if (['Dhṛtarāṣṭra', 'Duryodhana', 'Duḥśāsana'].contains(n.label)) {
      nodeClass = 'node-kaurava';
    }

    sb.writeln(
        '<rect class="$nodeClass" x="$rectX" y="$rectY" width="$nodeWidth" height="$nodeHeight" rx="$radius" ry="$radius" />');

    final safeLabel = _escapeXml(n.label);
    sb.writeln(
        '<text class="$labelClass" x="${n.x}" y="${n.y + 4}">$safeLabel</text>');
  }

  sb.writeln('</svg>');
  return sb.toString();
}

/// Very small XML escape for labels.
String _escapeXml(String input) {
  return input
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;')
      .replaceAll('"', '&quot;')
      .replaceAll("'", '&apos;');
}