# Tâche 5 — CWE vs CVE : même univers, pas le même job

---

## CWE c’est quoi ?

**CWE** (*Common Weakness Enumeration*) classe des **faiblesses** (design, code) avec des IDs du genre **CWE-79** (XSS classique). C’est un vocabulaire : « quelle erreur générique on reproduit ».

Tu peux avoir **plusieurs CVE pour une même CWE** (plusieurs produits plantent pareil).

---

## CVE on connaît

**CVE** = occurrence **publique** d’un souci identifié (« cette faille précise dans X version Y »).

Donc en crado : **CVE = l’incident nommé**. **CWE = la tâche de fond** sur le genre d’erreur.

---

## Pourquoi les deux ?

Sans CVE le monde ne se met pas d’accord sur **un cas**. Sans CWE tu ne fais pas remonter le courant jusqu’aux **patterns** qui reviennent en revue de code ou en formations.

Petit tableau perso :

| | CVE | CWE |
|-|-----|-----|
| Grain | incident précis | famille de défaut |
| À quoi ça sert | patch, prio, réglementaire | prévention, taxonomie, stats |

Je confonds plus les deux depuis que j’écris ce genre de phrases — j’essaie pas en tout cas.

---

*Série `cve_cwe_nvd_blogs` — Tâche 5*
