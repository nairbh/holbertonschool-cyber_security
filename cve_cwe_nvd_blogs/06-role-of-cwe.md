# Tâche 6 — CWE et dev sécurité (la théorie qui colle un peu au terrain)

---

## Rôle en pratique

Le CWE donne un **langage partagé** pour dire « là c’est de l’injection / du mauvais contrôle d’accès / du path traversal » avant que ça soit un CVE officiel quelque part.

Dans une vision SDLC cliché mais utile — exigences → design → code → tests → mise en prod → patch — le CWE aide surtout **revue**, **Formation**, **triage scanners** (« on a 120 findings mais 80 fois du CWE-79 »).

---

## Comment les devs peuvent le mettre sans se la jouer

Dans une merge request ou un ticket tu peux coller « **possible CWE-89** — passer en requête param » : plus court que trois paragraphes de guideline interne pour ceux qui connaissent déjà les acronyms.

Tu branches **SAST** / **Sonar**/équivalent pour grouper par CWE et voir ce qui revient le plus sur ton repo (souvent injection + secrets en dur + dépendances pourries — les classiques).

---

## Code quality

Éviter une faiblesse CWE ne remplace pas les tests automatiques mais **réduit la surface**. Moins de dette stupide ⇒ moins d’hotsfix à trois heures du mat ça aide le karma du projet.

Pas encore gravé dans mon CV LinkedIn tout ça mais le chemin se tient.

---

*Série `cve_cwe_nvd_blogs` — Tâche 6*
