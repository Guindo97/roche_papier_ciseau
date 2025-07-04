import 'dart:io';
import 'dart:math';

void main() {
  print("********* Bienvenue dans le jeu de Roche-Papier-Ciseaux ********** \n");
  print(
      "Voici les règles du jeu : La pierre bat les ciseaux, les ciseaux battent le papier et le papier bat la pierre. Si les deux joueurs jouent le même symbole, il y a égalité \n");

  int nombreTours = 0;
  const String roche = "\u270A"; // Poing
  const String papier = "\u270B"; // Main ouverte
  const String ciseaux = "\u270C"; // Ciseaux
  int nPointUtilisateur = 0;
  int nPointCPU = 0;
  int nPointEgal = 0;

  print("Veuillez entrer le nombre de tours à jouer :");

  // Lecture du nombre de tours
  String? inputTours = stdin.readLineSync();
  if (inputTours != null) {
    nombreTours = int.tryParse(inputTours) ?? 0;
  }

  for (int index = 1; index <= nombreTours; index++) {
    print("Entrer votre choix (R-oche, P-apier, C-iseaux) : Tour $index");
    String? choixUtilisateur = stdin.readLineSync()?.toUpperCase();

    if (choixUtilisateur == null || !['R', 'P', 'C'].contains(choixUtilisateur)) {
      print("Choix invalide...");
      continue;
    }

    // Affichage du choix de l'utilisateur
    switch (choixUtilisateur) {
      case "R":
        print("Vous avez choisi roche : $roche");
        break;
      case "P":
        print("Vous avez choisi papier : $papier");
        break;
      case "C":
        print("Vous avez choisi ciseaux : $ciseaux");
        break;
    }

    // Génération du choix de l'ordinateur
    List<String> options = ["R", "P", "C"];
    String choixCPU = options[Random().nextInt(3)];
    if (choixCPU == "R") {
      print("L'ordinateur a choisi : $roche");
    } else if (choixCPU == "P") {
      print("L'ordinateur a choisi : $papier");
    } else {
      print("L'ordinateur a choisi : $ciseaux");
    }

    // Détermination du gagnant
    if ((choixUtilisateur == "R" && choixCPU == "C") ||
        (choixUtilisateur == "C" && choixCPU == "P") ||
        (choixUtilisateur == "P" && choixCPU == "R")) {
      print("Le joueur a gagné !");
      nPointUtilisateur++;
    } else if (choixUtilisateur == choixCPU) {
      print("Égalité !");
      nPointEgal++;
    } else {
      print("L'ordinateur a gagné !");
      nPointCPU++;
    }
  }

  // Résultats finaux
  print("\nLe joueur a remporté : $nPointUtilisateur / $nombreTours");
  print("L'ordinateur a remporté : $nPointCPU / $nombreTours");
  print("Vous avez fait une égalité de : $nPointEgal / $nombreTours");

  if (nPointUtilisateur > nPointCPU) {
    print("Le joueur a gagné la partie !");
  } else if (nPointUtilisateur == nPointCPU) {
    print("Égalité !");
  } else {
    print("L'ordinateur a gagné la partie !");
  }
}
