FROM evoapicloud/evolution-api:v2.3.7

WORKDIR /evolution

# Remove o .env padrão da imagem oficial
RUN rm -f /evolution/.env

# Define explicitamente a DATABASE_URL usando a variável do Render
ENV DATABASE_URL=$DATABASE_CONNECTION_URI

# Executa as migrações e inicia a aplicação
ENTRYPOINT ["/bin/bash", "-c", "npx prisma migrate deploy --schema ./prisma/postgresql-schema.prisma && npm run start:prod"]
