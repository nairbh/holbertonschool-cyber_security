# Tâche 12 — Snippet Python / sqlite : quels CWE ?

**Code fourni :**

```python
import sqlite3 
def get_user(username): 
    conn = sqlite3.connect('users.db') 
    cursor = conn.cursor() 
    query = "SELECT * FROM users WHERE username='" + username + "';" 
    cursor.execute(query) 
    user = cursor.fetchone() 
    conn.close() 
    return user
```

---

## CWE identifié principal

**CWE-89** — *Improper Neutralization of Special Elements used in an SQL Command* (SQL injection classique).

Pourquoi : `username` est **concaténé** dans la chaîne SQL. Un attaquant met `admin' OR '1'='1` ou pire `'; DROP TABLE users;--` selon moteur / quoting.

---

## Taxonomie (où ça se range)

Dans l’arbre CWE tu restes souvent sous la branche **injection** / **API abuse** — le parent direct le plus cité pour ce pattern c’est **CWE-89** (parfois lié à **CWE-564** SQL injection côté Hibernate etc. mais ici c’est du sqlite3 brut).

---

## Scénario d’attaque (pas original mais efficace)

Utilisateur contrôle `username` via param HTTP → pas d’échappement → lecture arbitraire table `users` (mots de passe hashés, emails), parfois écriture si la requête ou le schéma le permettent (moins courant en SELECT seul mais les variantes UPDATE/DELETE en prod existent).

---

## Mitigations (ce que j’écrirais en PR)

1. **Requêtes paramétrées** : `cursor.execute("SELECT * FROM users WHERE username = ?", (username,))`  
2. Valider le format attendu (longueur, charset) si pseudo user.  
3. Principe du moindre privilège sur le fichier DB côté OS (la requête propre reste le gros morceau).

Pas de try/except magique qui « répare » l’injection : faut **ne plus construire** la requête en string si l’entrée est hostile.

---

*Série `cve_cwe_nvd_blogs` — Tâche 12*
