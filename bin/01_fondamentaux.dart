void main() {
  //Types constates collections
  const seuilAdmission = 10.0;
  final List<double> notes = [14, 8.5, 16];
  final double moyenne =
      notes.reduce((a, b) => a + b) / notes.length; //calcul de la moyenne

  // Null safety et record
  String? email; // verifier le mail est null
  final String contact = email ?? 'email pas renseiigné';
  final ({String prenom, double moyenne}) etudiant = (
    prenom: 'Awa',
    moyenne: moyenne,
  );

  // Switch expression
  final String mention = switch (etudiant.moyenne) {
    >= 16 => 'Très Bien',
    >= 14 => 'Bien',
    >= 12 => 'Assez Bien',
    >= seuilAdmission => 'Passable',
    _ => 'Ajourné',
  };

  //Affichage
  print('Prénom: ${etudiant.prenom}');
  print('Moyenne: ${etudiant.moyenne.toStringAsFixed(2)}');
  print('Mention: $mention');
  print('Contact: $contact');
}
