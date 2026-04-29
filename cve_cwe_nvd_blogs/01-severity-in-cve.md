# Tâche 1 — La sévérité d’un CVE, ça change quoi pour une boîte ?

---

## Le fil directeur

Un CVE **seul** c’est surtout un nom. La **sévérité** (souvent via CVSS sur le NVD, ou score éditeur, ou « critical » dans ton scanner) c’est ce qui décide si tu déclenches un patch **ce soir** ou **dans trois mois** quand tout le monde a le temps.

Si tu ignores la sévérité ou tu traites tout pareil, tu crames du temps sur du bruit. Si tu fais confiance aveuglé au nombre sans regarder ton contexte (exploit public ? internet-facing ? données sensibles ?), tu te fais avoir dans l’autre sens.

---

## Organisation : comment ça fout le bazar dans les priorités ?

Une orga a rarement une file infinie de devs/secu pour tout patch day one. Elle doit **rang** : qu’est-ce qui casse la caisse ou la conformité tout de suite, qu’est-ce qui attend.

La sévérité (low / medium / high / critical, ou équivalent CVSS) sert à **trier**. Ce n’est pas une vérité absolue : « critical » sur un vieux NAS en labo n’a pas le même poids que le même score sur ton edge public.

---

## Exemples rapides (comment j’imagine la réponse)

**Low** — Typiquement difficile à exploiter ou impact mineur dans ton modèle de menace. Tu planifies avec le patch du mois ; tu notes pour la remédiation groupe, pas une war room à minuit.

**Medium** — Slipping dans la roadmap : sprint suivant ou fenêtre maintenance, avec suivi SLA interne selon tes règles.

**High** — Là ça chauffe : équipe infra/app priorisée sous X jours, tests de non-régression accélérés, parfois contournement temporaire (WAF rule, désactivation fonction) en attendant le correctif définitif.

**Critical** — Souvent combiné exploit connu ou surface exposée : patch ASAP, vérif inventaire pour savoir où c’est déployé, comité crise si tu touches prod ou données réglementées. Parfois coupure fonctionnelle plutôt que compromission.

---

## Ce que j’en retiens

La sévérité **cadre** la discussion ; **ton contexte** (exposition, actifs, backup, détections) **tranche**. Le CVE te dit *quoi* ; la sévérité + contexte te disent *quand* et *à quel point tu paniques*.

---

*Série `cve_cwe_nvd_blogs` — Tâche 1*
