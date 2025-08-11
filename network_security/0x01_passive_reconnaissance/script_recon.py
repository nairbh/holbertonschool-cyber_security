import subprocess

def parse_subdomains(file_path):
    subdomains = set()
    with open(file_path, 'r') as f:
        for line in f:
            # On suppose un format avec sous-domaine en début de ligne (ex: sub.domain.com)
            if line.strip() and '.' in line:
                candidate = line.strip().split()[0]
                if candidate.endswith('holbertonschool.com'):
                    subdomains.add(candidate)
    return list(subdomains)

def scan_subdomains(subdomains):
    for sub in subdomains:
        print(f"Scan rapide de {sub}...")
        subprocess.run(['nmap', '-Pn', '-sV', '-p', '80,443', sub])

if __name__ == "__main__":
    subs = parse_subdomains('subdomains.txt')
    print(f"{len(subs)} sous-domaines détectés.")
    scan_subdomains(subs)

