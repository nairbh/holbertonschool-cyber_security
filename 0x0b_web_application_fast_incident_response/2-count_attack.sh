#!/bin/bash

# 🔹 Étape 1 : Extraire les 1000 dernières lignes du fichier auth.log
# Pourquoi ? Pour limiter l'analyse aux événements récents, plus pertinents.
tail -n 1000 auth.log > 1000.log

# 🔹 Définir le fichier de log à analyser (variable utilisée ensuite)
log_file=1000.log

# 🔹 Étape 2 : Extraire toutes les lignes contenant "Failed password"
# Cela correspond aux tentatives de connexion échouées

failed_passwords=$(grep 'Failed password' "$log_file")

# 🔹 Étape 3 : Extraire toutes les lignes contenant "Accepted password"
# Cela correspond aux connexions réussies

accepted_passwords=$(grep 'Accepted password' "$log_file")

# 🔹 Étape 4 : Extraire les noms d’utilisateurs dans les tentatives échouées
# Dans les logs SSH, l'utilisateur est généralement à la 9e colonne
# Exemple :
# "Failed password for root from 192.168.1.1 ..." → $9 = root

failed_users=$(echo "$failed_passwords" | awk '{print $9}' | sort | uniq)

# 🔹 Étape 5 : Extraire les noms d’utilisateurs pour les connexions réussies
# Même logique que ci-dessus

accepted_users=$(echo "$accepted_passwords" | awk '{print $9}' | sort | uniq)

# 🔹 Étape 6 : Comparer les deux listes et trouver les utilisateurs communs
# `comm -12` affiche les lignes communes entre les deux listes triées
# Ce sont les utilisateurs qui ont eu à la fois des échecs et une réussite

common_users=$(comm -12 <(echo "$failed_users") <(echo "$accepted_users"))

# 🔹 Étape 7 : Afficher le ou les utilisateurs potentiellement compromis

echo "$common_users"
