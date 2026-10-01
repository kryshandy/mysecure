# mySecure

mySecure est une application Flutter d'audit Wi-Fi destinée à un usage personnel et professionnel autorisé. Elle centralise les projets, les évaluations de sécurité, les réseaux détectés et la génération de rapports.

## Fonctionnalités

- gestion de projets et d'évaluations persistées localement avec Drift ;
- analyse et présentation des réseaux Wi-Fi détectés ;
- suivi des constats, niveaux de risque et recommandations ;
- génération et partage de rapports HTML, JSON, CSV, Markdown et PDF ;
- paramètres locaux, contrôles d'autorisation et garde-fous Android ;
- couche native Rust préparée pour les opérations spécialisées.

## Prérequis

- Flutter compatible avec Dart `^3.12.2` ;
- Android SDK avec `compileSdk 36` pour la cible Android ;
- Rust/Cargo uniquement pour compiler la couche native optionnelle.

## Démarrage

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Vérifications

```bash
flutter analyze
flutter test
flutter build apk --debug
```

Les scripts `build_apk.ps1` et `build_apk.sh` automatisent la génération d'un APK de publication. Les fichiers locaux, bases de données, clés de signature et artefacts de compilation sont exclus de Git.

## Cadre d'utilisation

Utilisez mySecure uniquement sur des équipements et réseaux dont vous êtes propriétaire ou pour lesquels vous disposez d'une autorisation explicite.
