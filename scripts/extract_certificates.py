import json
import base64
from pathlib import Path

import subprocess


# Read Traefik ACME JSON
ca_file = Path(__file__).parent.parent / "docker-compose/traefik/letsencrypt/acme.json"
acme = json.loads(ca_file.read_text())

# Select certificates from a specific resolver
certificates = acme["cloudflare"]["Certificates"]

for certificate in certificates:
    certificate_data = base64.b64decode(certificate["certificate"])
    key_data = base64.b64decode(certificate["key"])

    domain_folder = ca_file.parent / f"certificates/{certificate['domain']['main']}"
    domain_folder.mkdir(parents=True, exist_ok=True)

    certificate_data = certificate_data.decode("utf-8").split("\n\n")[0].encode("utf-8")

    # Export certificate and key to file
    with open(domain_folder/"certificate.pem", "wb") as certfile:
        certfile.write(certificate_data)

    with open(domain_folder/"key.pem", "wb") as keyfile:
        keyfile.write(key_data)

    # Export certificate and key to .crt and .key files
    subprocess.run(["openssl", "x509", "-inform", "pem", "-in", str(domain_folder/"certificate.pem"), "-out", str(domain_folder/"certificate.crt")])
    subprocess.run(["openssl", "rsa", "-inform", "pem", "-in", str(domain_folder/"key.pem"), "-out", str(domain_folder/"key.key")])