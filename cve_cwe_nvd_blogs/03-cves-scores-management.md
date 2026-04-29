# Tâche 3 — CVE + scores : en faire quoi concrètement ?

---

## Pourquoi coupler CVE et CVSS (ou autre score)

Le **CVE** te pointe vers **une** issue. Le **CVSS** (souvent vu sur le NVD) te donne une **base** de gravité reproductible. Ce n’est pas la Bible : c’est un point de départ pour **comparer** des vulns et alimenter outils, tableaux de bord, SLAs.

Les orgas qui s’en sortent mieux utilisent CVE + métrique **avec** données terrain : exposition, mise à jour disponible, assets critiques, exploits dans la nature.

---

## Stratégies bêtes mais utiles

**Ingestion centralisée** — Scanner vuln (`nessus`, `openvas`, équivalent cloud…) + flux NVD/cert → CMDB/asset inventory pour savoir où ça tape.

**Politiques SLA par bande CVSS ou par équipe critique** — Exemple : critique > 9 sur prod publique = sous 7 j ; medium = fenêtre trimestrielle. À toi d’ajuster suivant tes moyens.

**Supplémentation** — CVE du NVD dit « high » mais **EPSS** dit probabilité d’exploitation faible ? Tu peux descendre la prio. L’inverse aussi.

**Patch windows** — Grouper les correctifs par risque et par redémarrage accepté, plutôt que 50 tickets « CVE random ».

**Exceptions tracées** — Compensating control documenté (segmentation, ACL) quand tu ne peux pas patch tout de suite.

---

## Piège classique

Se battre pour le **score** au lieu du **risque réel**. Un CVSS « medium » sur ton contrôleur de domaine vaut parfois plus qu’un « high » sur une VM de test.

---

*Série `cve_cwe_nvd_blogs` — Tâche 3*
