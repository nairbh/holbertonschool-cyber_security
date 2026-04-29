# Tâche 11 — Tendances NVD : « linux kernel » en 2026 (mini rapport)

*J’ai utilisé l’**API NVD 2.0** (`keywordSearch=linux kernel` + plages de dates `pubStartDate` / `pubEndDate`) le **29 avril 2026**. Si tu relis ce blog dans six mois les chiffres bougent — refais la même requête.*

---

## Méthodo

Site web NVD : tu peux filtrer à la main ; moins chiant en script : `https://services.nvd.nist.gov/rest/json/cves/2.0` avec keywords et dates de **publication** CVE.

J’ai pris le mot-clé **linux kernel** (comme le sujet), année **2026**.

---

## Chiffres bruts (au moment du check)

| Période | CVE publiés (keyword linux kernel) |
|---------|--------------------------------------|
| **T1 2026** (jan–mars) | **653** |
| **jan** 2026 | 248 |
| **fév** 2026 | 223 |
| **mars** 2026 | 182 |
| **avr** 2026 (jusqu’au 29 inclus) | 379 *— mois pas fini, chiffre intermédiaire* |

Le **T1** est la somme jan+fév+mars cohérente avec le total T1 retourné par l’API sur la plage 01/01–31/03.

---

## Lecture rapide (pas de science exacte)

- Volume **élevé** sur ce mot-clé : le noyau et l’écosystème drivers = surface énorme, donc beaucoup d’entrées « kernel » dans les textes NVD.  
- **Janvier** un peu au-dessus de **mars** dans mon split — possible batch de divulgations / mises à jour de textes NVD, je n’invente pas la météo derrière.  
- **Avril** part fort (même partiel) : à revoir fin de mois pour comparer apple à apple.

---

## Pattern honnête

Pas de « baisse magique de la cybersécurité du monde » à conclure : surtout que le **keyword** attrape du bruit. Pour un vrai travail risque il faudrait filtrer **CPE** `linux:linux_kernel` ou équivalent plutôt que full-text seul.

---

*Série `cve_cwe_nvd_blogs` — Tâche 11*
