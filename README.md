A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.
# Supdeco — Dart / TP 01 : Fondamentaux et Programmation Orientée Objet

## Objectif du projet
Ce travail pratique a pour objectif de maîtriser les bases du langage Dart (types, null safety, records, switch expressions, collections) ainsi que les principes de la programmation orientée objet (classes abstraites, héritage, interfaces, encapsulation, validation d'invariants métier et sérialisation JSON).

## Structure des fichiers
Le projet respecte cette arborescence qui  sépare les modèles (`lib/`) des scripts exécutables (`bin/`) :

* `pubspec.yaml` & `analysis_options.yaml` : Configuration du package (SDK Dart `>=3.8.0 <4.0.0`) et règles d'analyse statique (`lints`).
* `lib/contracts/notifiable.dart` : Interface `Notifiable` définissant le contrat `notifier()`.
* `lib/models/personne.dart` : Classe mère abstraite `Personne` (`prenom`, `nom`, `age`, `nomComplet`, `sePresenter()`).
* `lib/models/enseignant.dart` : Classe concrète héritant de `Personne` avec l'attribut `departement`.
* `lib/models/etudiant.dart` : Classe concrète étendant `Personne` et implémentant `Notifiable` (gestion de `matricule`, `email`, `_moyenne`, `anneeUniversitaire`, validation `RangeError`, et conversion JSON).
* `bin/supdeco_dart_tp01.dart` : Point d'entrée principal confirmant l'initialisation du projet.
* `bin/01_fondamentaux.dart` : Calcul de moyenne sur une liste, gestion de la null safety (`??`), record nommé et `switch expression` pour l'attribution des mentions.
* `bin/02_poo.dart` : Instanciation des objets (dont le constructeur nommé `Etudiant.inscription`), polymorphisme (`List<Personne>`, `List<Notifiable>`) et cycle `jsonEncode`/`jsonDecode`.
* `bin/03_verifications.dart` : Contrôle des invariants métier avec `verifier()`, interception de `RangeError` lors de l'affectation d'une note invalide (`21/20`) et test d'intégrité `toJson()`/`fromJson()`.
* `bin/04_promotion.dart` : Filtrage des étudiants admis (`where()`), tri décroissant (`..sort()` et `compareTo()`) et déstructuration d'un record positionnel.

## Commandes d'exécution
Depuis la racine du projet, j'ai exécuté les commandes suivantes :

# Installation des dépendances, formatage et analyse statique
dart pub get
dart format .
dart analyze

# Exécution des scripts du TP
dart run bin/supdeco_dart_tp01.dart
dart run bin/01_fondamentaux.dart
dart run bin/02_poo.dart
dart run bin/03_verifications.dart
dart run bin/04_promotion.dart
```

## Principaux résultats eus 
* **Point d'entrée (`supdeco_dart_tp01.dart`)** : Affiche `TP1 Dart : projet initialise.`.
* **Fondamentaux (`01_fondamentaux.dart`)** : Calcule la moyenne de `[14, 8.5, 16]` (`12.83`), attribue la mention `Assez bien` et affiche `email non renseigné` pour Awa .
* **POO et Sérialisation (`02_poo.dart`)** : Démontre le polymorphisme sur *Awa Diop* et *Fatou Sarr*, affiche l'année `2026-2027` et la moyenne initiale `0.0` de *Moussa Ndiaye* après reconstruction JSON.
// 
* **Vérifications (`03_verifications.dart`)** : Valide tous les contrôles (`OK`) sur le profil fictif *Ali Fall (M1-002)*, confirme le rejet de `21/20` via `RangeError` et le maintien de la moyenne à `12.0` après sérialisation.
* **Promotion (`04_promotion.dart`)** : Affiche le bilan de la promotion fictive :
  ```text
  Admis : 2 / 3
  Mariama Sow (17/20)
  Awa Diop (13/20)
  ```
