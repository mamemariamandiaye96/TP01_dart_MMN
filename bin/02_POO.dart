import 'dart:convert';

import 'package:supdeco_dart_tp01/contracts/notifiable.dart';
import 'package:supdeco_dart_tp01/models/enseignant.dart';
import 'package:supdeco_dart_tp01/models/etudiant.dart';
import 'package:supdeco_dart_tp01/models/personne.dart';

void main() {
  // 1. Instanciation
  final Etudiant awa = Etudiant(
    prenom: 'Awa',
    nom: 'Diop',
    age: 23,
    matricule: 'M1-001',
    email: 'awa@supdeco.sn',
    moyenne: 13.5,
  );

  const Enseignant fatou = Enseignant(
    prenom: 'Fatou',
    nom: 'Sarr',
    age: 41,
    departement: 'Génie logiciel',
  );

  final Etudiant moussa = Etudiant.inscription(
    prenom: 'Moussa',
    nom: 'Ndiaye',
    age: 25,
    matricule: 'M1-004',
  );

  // 2. Polymorphisme
  print('--- Polymorphisme : Personne ---');
  final List<Personne> personnes = [awa, fatou];
  for (final personne in personnes) {
    print(personne.sePresenter());
  }

  print('\n--- Polymorphisme : Notifiable ---');
  final List<Notifiable> notifiables = [awa];
  for (final element in notifiables) {
    print(element.notifier());
  }

  // 3. Sérialisation et désérialisation JSON
  print('\n--- Sérialisation JSON ---');
  final String jsonString = jsonEncode(awa.toJson());
  final Map<String, Object?> jsonMap =
      jsonDecode(jsonString) as Map<String, Object?>;
  final Etudiant copieAwa = Etudiant.fromJson(jsonMap);

  print('Copie reconstituée : $copieAwa');
  print('Année universitaire : ${Etudiant.anneeUniversitaire}');
  print('Moyenne initiale de ${moussa.nomComplet} : ${moussa.moyenne}');
}
