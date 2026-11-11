import '../contracts/notifiable.dart';
import 'personne.dart';

class Etudiant extends Personne implements Notifiable {
  static const String anneeUniversitaire = '2026-2027';

  final String matricule;
  final String? email;
  double _moyenne;

  Etudiant({
    required super.prenom,
    required super.nom,
    required super.age,
    required this.matricule,
    this.email,
    double moyenne = 0,
  }) : _moyenne = moyenne {
    _validerMoyenne(moyenne);
  }

  Etudiant.inscription({
    required String prenom,
    required String nom,
    required int age,
    required String matricule,
    String? email,
  }) : this(
         prenom: prenom,
         nom: nom,
         age: age,
         matricule: matricule,
         email: email,
         moyenne: 0,
       );

  static void _validerMoyenne(double valeur) {
    if (!valeur.isFinite || valeur < 0 || valeur > 20) {
      throw RangeError(
        'La moyenne doit etre infini compris doit etre compris entre 0 et 20 inclus.',
      );
    }
  }

  double get moyenne => _moyenne;

  set moyenne(double nouvelleMoyenne) {
    _validerMoyenne(nouvelleMoyenne);
    _moyenne = nouvelleMoyenne;
  }

  bool get estAdmis => _moyenne >= 10;

  @override
  String sePresenter() {
    return 'Je suis $nomComplet ($age ans), étudiant [$matricule] - Année $anneeUniversitaire.';
  }

  @override
  String notifier() {
    final contact = email ?? 'aucun email renseigné';
    final statut = estAdmis ? 'Admis(e)' : 'Ajourné(e)';
    return 'Notification envoyée à  $nomComplet ($contact) : moyenne ${_moyenne.toStringAsFixed(2)}/20 ($statut).';
  }

  @override
  String toString() {
    return 'Etudiant(matricule: $matricule, nomComplet: $nomComplet, age: $age, email: $email, moyenne: $_moyenne)';
  }

  Map<String, Object?> toJson() {
    return {
      'prenom': prenom,
      'nom': nom,
      'age': age,
      'matricule': matricule,
      'email': email,
      'moyenne': _moyenne,
    };
  }

  factory Etudiant.fromJson(Map<String, Object?> json) {
    final rawMoyenne = json['moyenne'];
    if (rawMoyenne is! num) {
      throw const FormatException(
        'le champ "moyenne" doit etre une valeur numérique.',
      );
    }
    return Etudiant(
      prenom: json['prenom'] as String,
      nom: json['nom'] as String,
      age: json['age'] as int,
      matricule: json['matricule'] as String,
      email: json['email'] as String?,
      moyenne: rawMoyenne.toDouble(),
    );
  }
}
