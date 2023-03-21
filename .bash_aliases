alias dc='docker-compose'

# p: git pull && docker-compose pull
# u: docker-compose up -d --force-recreate --remove-orphans
# l: docker-compose logs -f

alias p='git pull && docker-compose pull'
alias ul='docker-compose up -d --force-recreate --remove-orphans && docker-compose logs -f'
alias pu='git pull && docker-compose pull && docker-compose up -d --force-recreate --remove-orphans'
alias pul='git pull && docker-compose pull && docker-compose up -d --force-recreate --remove-orphans && docker-compose logs -f'