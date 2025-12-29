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

# Voltar ao working dir padrão
WORKDIR /home/node

# Copiar o entrypoint para um local onde podemos dar chmod sem stress
USER root
COPY ./entrypoint.sh /home/node/entrypoint.sh
RUN chmod +x /home/node/entrypoint.sh \
  && chown node:node /home/node/entrypoint.sh

USER node
CMD ["/home/node/entrypoint.sh"]
