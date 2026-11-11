import 'package:supdeco_dart_tp01/models/etudiant.dart';

void main() {
  //creeer promotion

  final promotion = <Etudiant>[
    Etudiant(
      prenom: 'Awa',
      nom: 'Diop',
      age: 21,
      matricule: ' M1-001',
      moyenne: 13.0,
    ),
    Etudiant(
      prenom: 'Ali',
      nom: 'Fall',
      age: 24,
      matricule: 'M1-002',
      moyenne: 8.0,
    ),
    Etudiant(
      prenom: 'Mariama',
      nom: 'Sow',
      age: 22,
      matricule: 'M1-003',
      moyenne: 17.0,
    ),
  ];

  final admis = promotion.where((etudiant) => etudiant.estAdmis).toList()
    ..sort((a, b) => b.moyenne.compareTo(a.moyenne));
  // record positionnel
  final statistiques = (promotion.length, admis.length);
  // destruction du recors positionnel
  final (effectif, nombreAdmis) = statistiques;

  print('Admis: $nombreAdmis / $effectif');

  for (final etudiant in admis) {
    print('${etudiant.nomComplet} (${etudiant.moyenne.toStringAsFixed(0)}/20)');
  }
}
