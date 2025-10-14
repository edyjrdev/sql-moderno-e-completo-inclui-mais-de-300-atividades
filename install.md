sudo apt install postgresql postgresql-contrib

sudo service postgresql status
ou
sudo systemctl status postgresql

# habilitar conexão remota postgresql.conf
sudo nano /etc/postgresql/14/main/postgresql.conf

listen_addresses = '*'

sudo cat /etc/postgresql/14/main/postgresql.conf | grep listen_addresses

# pg_hba.conf
sudo nano /etc/postgresql/14/main/pg_hba.conf
host    all             all             0.0.0.0/0    md5           

sudo service postgresql restart
# ou
sudo systemctl restart postgresql

sudo -u postgres psql

ALTER USER postgres WITH PASSWORD 'sua_nova_senha';

# sair
\q

# descobrir ip do Ubuntu
ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'

172.26.36.244

Para criar uma conta de serviço (um novo usuário) no PostgreSQL com privilégios para todos os esquemas atuais e futuros, você seguirá três passos principais:

Criar o usuário (ROLE) com permissão de login.

Conceder permissões para os bancos de dados existentes.

Configurar as permissões padrão para esquemas futuros (e seus objetos) para garantir o acesso.

Execute os seguintes comandos no terminal do Ubuntu (WSL2), acessando o prompt do PostgreSQL como superusuário:

Bash

# 1. Acessar o prompt do PostgreSQL como usuário 'postgres' (superusuário)
sudo -u postgres psql
1. Criar o Usuário de Serviço
Dentro do prompt do psql, crie o novo usuário e defina uma senha.

SQL

-- Crie o novo usuário (ROLE). Use um nome descritivo, como 'servico_dbeaver'
CREATE USER servico_dbeaver WITH PASSWORD 'admin';

# root para servico
ALTER ROLE servico_dbeaver SUPERUSER;

-- Se você precisar que ele possa criar bancos de dados (opcional):
-- ALTER ROLE servico_dbeaver CREATEDB;

\c nome_do_banco;

-- Concede a permissão de CONECTAR e CRIAR ao banco de dados:
GRANT ALL PRIVILEGES ON DATABASE nome_do_banco TO servico_dbeaver;

-- Concede o direito de USAGE (acessar) em todos os esquemas atuais:
GRANT USAGE ON SCHEMA public TO servico_dbeaver;
-- Repita para outros esquemas, se houver:
-- GRANT USAGE ON SCHEMA outro_esquema TO servico_dbeaver; 

-- Concede o direito de SELECT, INSERT, UPDATE, DELETE em todas as tabelas atuais:
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO servico_dbeaver;
-- Repita para outros esquemas:
-- GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA outro_esquema TO servico_dbeaver; 

-- Opcional: Para funções e sequências (útil para `insert` com chaves primárias auto-incrementáveis):
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO servico_dbeaver;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO servico_dbeaver;

\c nome_do_banco;

-- 1. Permissão de USAGE em esquemas futuros (para poder acessá-los)
ALTER DEFAULT PRIVILEGES FOR USER postgres IN SCHEMA public
    GRANT USAGE ON SCHEMAS TO servico_dbeaver;

-- 2. Permissão em tabelas futuras
ALTER DEFAULT PRIVILEGES FOR USER postgres IN SCHEMA public
    GRANT ALL ON TABLES TO servico_dbeaver;

-- 3. Permissão em sequências futuras
ALTER DEFAULT PRIVILEGES FOR USER postgres IN SCHEMA public
    GRANT ALL ON SEQUENCES TO servico_dbeaver;

-- 4. Permissão em funções futuras
ALTER DEFAULT PRIVILEGES FOR USER postgres IN SCHEMA public
    GRANT ALL ON FUNCTIONS TO servico_dbeaver;