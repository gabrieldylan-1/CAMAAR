# CAMAAR

## Requisitos
- Docker e Docker Compose

## Como executar
1. Construa os containers e suba o servidor Rails:
   ```bash
   docker compose up --build
   ```
   Isso instala as gems, prepara o banco Postgres (`camaar_development`) e expõe a aplicação em `http://localhost:3000`.

2. No primeiro carregamento execute as migrations e seeds dentro do container caso você adicione novas estruturas:
   ```bash
   docker compose run --rm web bundle exec rails db:create db:migrate db:seed
   ```

## Testes BDD com Cucumber
Execute os cenários de aceitação com:
```bash
docker compose run --rm web bundle exec cucumber
```
Os arquivos de teste ficam em `features/`

## Estrutura principal
- `app/` — código Rails (controllers, modelos, views e assets).
- `features/` — especificações Cucumber e passos (`step_definitions`).
- `Dockerfile` / `docker-compose.yml` — infraestrutura para desenvolvimento.
- `config/` — configurações do framework, banco de dados e inicializadores.

