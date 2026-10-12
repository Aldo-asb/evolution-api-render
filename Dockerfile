FROM evoapicloud/evolution-api:v2.3.7

WORKDIR /evolution

# Deleta o .env padrão da imagem oficial que força o postgres:5432
RUN rm -f /evolution/.env

# Força o Prisma a usar a variável do Render e inicia a API
ENTRYPOINT ["/bin/bash", "-c", "export DATABASE_URL=\"$DATABASE_CONNECTION_URI\" && npm run db:deploy && npm run start:prod"]
