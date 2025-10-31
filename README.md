# Configuração e Execução do Projeto

Este repositório contém a configuração para rodar um container com suporte a PostgreSQL e Redis. Abaixo estão as instruções para configurar e subir o container.

## Pré-requisitos

- Docker instalado na máquina.
- Docker Compose (opcional, mas recomendado).

## Passos para Configuração

1. **Clone o repositório**:
   ```bash
   git clone [(https://github.com/RosnerTech/evolution-api.git)]
   cd seu-repositorio
   
## Configure as variáveis de ambiente:

2. **Configure as variáveis de ambiente**:
Renomeie o arquivo .env.exemplo para .env:
   ```bash
   mv .env.exemplo .env
 *Observação: Substitua SEU_USUARIO, SUA_SENHA, SEU_BD, SUA_KEY e outros valores conforme necessário.*

3. **Subir o container**:
Execute o seguinte comando para construir e subir o container:
   ```bash
   docker-compose up -d
Isso irá iniciar os serviços configurados no docker-compose.yml.

4. **Verificar se está funcionando**:
Para verificar se os containers estão rodando, use o comando:
   ```bash
   docker ps
Você deve ver os containers do PostgreSQL e Redis em execução.

## Estrutura do Projeto
- **PostgreSQL: Banco de dados principal.**
- **Redis: Cache para melhorar o desempenho.**
- **Variáveis de Ambiente: Configurações personalizadas no arquivo .env.**
  
## Contribuição
- **Se encontrar algum problema ou tiver sugestões, sinta-se à vontade para abrir uma issue ou enviar um pull request.**
