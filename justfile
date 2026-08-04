default:
    @just --list

# Inicia os contêineres e reconstrói a imagem se necessário
up:
    @echo "copiando .env.example..."
    cp .env.example .env
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

# composer dump-autoload
dump:
    docker compose exec app composer dump-autoload

## TESTS
create_testdir:
    mkdir -p ./tests ./tests/Features ./tests/Unit

test_run *ARGS:
    docker compose exec app ./vendor/bin/phpunit {{ARGS}}
