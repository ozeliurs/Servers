# Authelia

## Setup

```bash
cp .env.example .env
nano .env
```

## Add users

```bash
docker run authelia/authelia:latest authelia hash-password 'yourpassword'
```