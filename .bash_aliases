alias dc='docker-compose'
alias dup='docker-compose up -d'
alias pd='git pull && docker-compose up -d --force-recreate'
alias pul='docker-compose pull && docker-compose up -d && docker-compose logs -f'