FROM n8nio/n8n:latest

USER root
ENTRYPOINT []

# Criar pasta de community nodes e garantir permissões
RUN mkdir -p /home/node/.n8n/nodes \
  && chown -R node:node /home/node/.n8n

# Instalar o community node no local correto
USER node
WORKDIR /home/node/.n8n/nodes
RUN npm init -y && npm install n8n-nodes-upload-post

WORKDIR /home/node/packages/cli

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
