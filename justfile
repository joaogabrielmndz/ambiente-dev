default:
    @just --list

# Inicia os contêineres e reconstrói a imagem se necessário
up:
    docker compose up -d --build

# Para os contêineres
down:
    docker compose down

# Executa o Composer dentro do contêiner 'app'
# Exemplo: just composer require monolog/monolog
composer *ARGS:
    docker compose exec app composer {{ARGS}}

# Instala as dependências do composer.json
install:
    docker compose exec app composer install

# Atualiza as dependências do composer.json
update:
    docker compose exec app composer update