FROM evoapicloud/evolution-api:v2.3.7

WORKDIR /evolution

# Remove o .env padrão da imagem oficial
RUN rm -f /evolution/.env

# Mapeia a variável do Render (DATABASE_CONNECTION_URI) para DATABASE_URL que o Prisma espera
ENTRYPOINT ["/bin/bash", "-c", "export DATABASE_URL=\"$DATABASE_CONNECTION_URI\" && npm run db:deploy && npm run start:prod"]
