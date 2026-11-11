import 'package:supdeco_dart_tp01/models/etudiant.dart';

void verifier(bool condition, String intitule) {
  if (!condition) {
    throw StateError('Echec du controle: $intitule');
  }
  print('ok - $intitule');
}

void main() {
  print('---érification des invariant metier ---\n');

  final etudiant = Etudiant(
    prenom: 'Ali',
    nom: 'Fall',
    age: 24,
    matricule: 'M1-002',
  );

  //9/20 nON ADMIS

  etudiant.moyenne = 9.0;
  verifier(
    etudiant.moyenne == 9.0 && !etudiant.estAdmis,
    'Moyenne 9/20 : Etudiant non admis',
  );

  //12/20 ADMIS
  etudiant.moyenne = 12.0;
  verifier(
    etudiant.moyenne == 12.0 && !etudiant.estAdmis,
    'Moyenne 9/20 : Etudiant admis',
  );

  //21/20 RangeError interceptée

  bool rangeErrorInterceptee = false;
  try {
    etudiant.moyenne = 21.0;
  } on RangeError {
    rangeErrorInterceptee = true;
  }

  verifier(
    rangeErrorInterceptee,
    'Affectation  21/20 : RangeError interceptée',
  );
  //Maintenons 12/20 apres l'exception

  verifier(
    etudiant.moyenne == 12.0,
    'Maintien de la moyenne à 12/20 apres l exception',
  );

  // Integrite des donnees

  // 6. Intégrité des données : aller-retour toJson() / fromJson()
  final Map<String, Object?> json = etudiant.toJson();
  final Etudiant etudiantRestaure = Etudiant.fromJson(json);

  verifier(
    etudiantRestaure.moyenne == 12.0,
    'Intégrité JSON : moyenne égale à 12 après toJson()/fromJson()',
  );

  print('\nTous les contrôles des invariants métier ont réussi avec succès !');
}
