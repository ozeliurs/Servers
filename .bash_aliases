alias dc='docker-compose'

# p: git pull && docker-compose pull
# d: docker-compose up -d --force-recreate --remove-orphans
# u: docker-compose up -d
# l: docker-compose logs -f

alias p='git pull && docker-compose pull'
alias pd='git pull && docker-compose pull && docker-compose up -d --force-recreate --remove-orphans'
alias pdu='git pull && docker-compose pull && docker-compose up -d --force-recreate --remove-orphans && docker-compose up -d'
alias pdul='git pull && docker-compose pull && docker-compose up -d --force-recreate --remove-orphans && docker-compose up -d && docker-compose logs -f'