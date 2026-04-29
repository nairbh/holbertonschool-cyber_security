# Tâche 7 — Des CWE qui reviennent et comment je prioriserais (à la louche)

---

## Exemples + impact vite fait

**CWE-89** Injection SQL — vol base, takeover possible. Souvent périmètre très large si tout passe par cette requête.

**CWE-79** XSS — vol de jeton/session côté navigateur ou défiguration selon où c’est stocké/reflected.

**CWE-22** Path traversal — lecture fichiers sensibles hors répertoire, parfois écriture suivant bug.

**CWE-798** credentials hardcodés — clé API dans le `.py` puis push github = jeu fini si le repo leak.

**CWE-352** CSRF sur actions critiques — changements d’état sans nonce correct.

Liste pas complète mais tu vois l’éventail.

---

## Prioriser dans un projet (ma logique pas universelle)

Surface **exposée net** avant interne fermé VPN.

Ensuite données **légales**/perso même en interne (ça pique vite en audit).

Ensuite combo **sans auth nécessaire** pour exploiter avant trucs qui nécessitent déjà un compte.

Enfin rapport **effort / risque** (parfois un patch lib une ligne mieux que trois semaines refactor XSS peu probable).

Pas de tableau magique universel ; ton infra décide aussi.

---

*Série `cve_cwe_nvd_blogs` — Tâche 7*
