abstract class Personne {
  final String prenom;
  final String nom;
  final int age;

  const Personne({required this.prenom, required this.nom, required this.age});

  String get nomComplet => '$prenom $nom';

  String sePresenter();
}
