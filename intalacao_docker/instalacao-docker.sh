#!/bin/bash

# Removendo versões antigas do docker
sudo apt-get remove docker docker-engine docker.io containerd runc

# Instalando via repositório
# Atualiza os repositórios do ubuntu
sudo apt-get update

# Instala algumas dependências
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Estabelece conexão com o repositório docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Configura o arquivo de repositórios
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualiza os repositórios e instala o docker
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
