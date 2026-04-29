# Tâche 4 — Calcul CVSS sur un scenario RCE (sans auth)

---

## Le scenario (énoncé)

Vulnérabilité **RCE** sur un logiciel serveur très répandu ; l’attaquant exécute du code à distance **sans authentification**.

Je pars de ça pour les métriques de base CVSS **v3.1** (voir doc officielle FIRST / CVSS v3 : formule équation groupe impact + exploitabilité).

---

## Métriques de base retenues (cohérentes avec « pas d’auth »)

| Métrique | Valeur | Pourquoi (résumé court) |
|----------|--------|-------------------------|
| **Attack Vector** | Network (AV:N) | attaque depuis le réseau, pas besoin physique/local |
| **Attack Complexity** | Low (AC:L) | pas de circonstances rares décrites dans le scenario |
| **Privileges Required** | None (PR:N) | pas d’auth requise = pas de compte légitime |
| **User Interaction** | None (UI:N) | la victime n’a pas besoin de cliquer |
| **Scope** | Unchanged (S:U) | cas standard « impact dans le même périmètre » (ça pourrait passer à *Changed* si la fiche détaillait un saut de trust entre composants) |

**Impact :** Confidentialité / Intégrité / Disponibilité en **High** (C:H/I:H/A:H).

---

## Vecteur CVSS v3.1

```
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H
```

Avec une **calculator** CVSS officielle FIRST : score de base **≈ 9.8** — sévérité **Critical** (grille usuells base v3.1 où le haut du panier est critical).

Réf calc : <https://www.first.org/cvss/v3.1/>

---

## Interprétation pour une org

**9.x Critical** → patch prioritaire, inventaire urgent des instances exposées, palliatif réseau le temps du correctif officiel si patch impossible tant de suite.

**Mitigations alignées avec le vecteur**

- passer sur version corrigée vendor dès publication
- désactiver le module vecteur ou la feature si bulletin le permet
- segmenter tout ce qui parle encore par erreur depuis internet

---

## Note sur une version « exemple » avec PR/UI plus forts

Si le sujet donnait aussi des exemples où **Privileges Required / User Interaction** ne sont pas *None*, le score baisse : l’attaquant doit plus de préconditions → moins plausible en masse. Le scenario dit **sans auth** ; mon vecteur reflète celui du texte principal.

---

*Série `cve_cwe_nvd_blogs` — Tâche 4*
