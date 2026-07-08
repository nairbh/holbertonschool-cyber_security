# 0x00 What the Shell

## Task 2 — Escape the Blacklist
Le mot "flag" est filtré. Contournement via globbing (?) qui laisse le shell résoudre le nom réel avant que le filtre ne le voie.

Commande : cat /home/user/fl?g

Flag : CTF{who_needs_espace_when_u_have_bash_HASH : f0ae33cb23a39fb9df6c52868b754366}

## Task 3 — Bypassing Blacklist Restrictions
L'espace est filtré. Contournement en collant la redirection < directement à la commande, sans espace.

Commande : cat</home/user/flag


