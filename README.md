# CAMAAR
Sistema para avaliação de atividades acadêmicas remotas do CIC

## Identificação do grupo
* 211055497 - Gabriel Dylan 

## Execução do projeto
O projeto foi desenvolvido utilizando a linguagem de programação Ruby 3.4.4 e o framework Rails 8.0.2. Para constituir o ambiente de desenvolvimento, devem ser executados os seguintes comandos (no diretório camaar):
* bundle install : instala as gems especificadas no arquivo Gemfile
* rails db:setup : cria o banco de dados; estrutura suas tabelas conforme especificações dos arquivos db/migrate/*.rb; popula a base com as seeds indicadas no arquivo db/seeds.rb
* rails s : inicia o servidor web da aplicação em ambiente local
* bundle exec cucumber : executa os testes do Cucumber (BDD)
* bundle exec rspec : executa os testes do RSpec (TDD)

### Execução com Docker (produção em SQLite)
No diretório `camaar`:
```bash
# build
docker build -t camaar .

# subir o container (desliga SSL forçado para uso em http://localhost:3000)
export RAILS_MASTER_KEY="$(cat config/master.key)"
docker run -d --name camaar \
  -p 3000:80 \
  -e RAILS_MASTER_KEY="$RAILS_MASTER_KEY" \
  -e FORCE_SSL=false \
  -v camaar_storage:/rails/storage \
  -v camaar_logs:/rails/log \
  camaar

# rodar seeds
docker exec -it camaar ./bin/rails db:seed
```
Acesse `http://localhost:3000`. Para zerar tudo: `docker rm -f camaar && docker volume rm camaar_storage camaar_logs`.

Para viabilizar a realização de testes de interface, podem ser utilizados os seguintes perfis, especificados como seeds:

| Tipo                            | E-mail                  | Senha        |
|---------------------------------|-------------------------|--------------|
| Administrador                   | admin@unb.br            | Admin@1234! |
| Aluno com senha provisória  | aluno.teste@exemplo.com | Senha@1234!  |
| Aluno com senha definitiva  | teste@unb.br            | Senha@1234!  |

*A senha do admin pode ser sobrescrita pela variável de ambiente `SENHA_ADMIN_CAMAAR`.

### Refatoração, documentação e complementação (Rubycritic, SimpleCov, RDoc)
Na sprint-3, por meio de comentários ao código, foi viabilizada a geração de documentação pela gem RDoc. Além disso, submeteu-se o código da sprint-2 à avaliação das ferramentas Rubycritic e SimpleCov, a fim de identificar oportunidades, respectivamente, de refatoração de controladores e de ampliação da cobertura de testes.

A ferramenta Rubycritic identificou dois controladores com complexidade/método superior a 20: AdminController e RespostaFormulariosController. O TemplatesController também foi apontado como componente de alta complexidade, embora a complexidade/método estivesse abaixo do limite (9,7). A ferramenta SimpleCov indicou cobertura de testes abaixo de 90% para as seguintes classes: TemplatesController, ApplicationController e ApplicationHelper.

A tabela comparativa abaixo descreve as alterações realizadas, na sprint-3, a partir das indicações das ferramentas Rubycritic e SimpleCov:

|             Classe            | Sprint | Complexidade/método | Cobertura de testes |
|-------------------------------|--------|---------------------|---------------------|
| AdminController               |   2    |        26,60        |                     |
| AdminController               |   3    |        15,80        |                     |
| ApplicationController         |   2    |                     |       85,00%        |
| ApplicationController         |   3    |                     |      100,00%        |
| RespostaFormulariosController |   2    |        25,00        |                     |
| RespostaFormulariosController |   3    |        17,80        |                     |
| TemplatesController           |   2    |         9,70        |       30,56%        |
| TemplatesController           |   3    |         4,20        |       97,78%        |
| ApplicationHelper             |   2    |                     |       60,00%        |
| ApplicationHelper             |   3    |                     |       93,75%        |


Ao final da sprint-2, visualizava-se o seguinte panorama em relação aos testes: o resultado final era aprovado pela totalidade dos 46 testes RSpec e por 27 dos 31 testes Cucumber criados. Já ao final na sprint-3, observa-se o seguinte cenário: a cobertura do RSpec subiu para 86 testes (97.61%); a cobertura do Cucumber se manteve em 31 testes; o código é aprovado em todos os testes.


## Política de branching
Para cada sprint foi criada uma branch (sprint-1, sprint-2 e sprint-3). 


## Funcionalidades implementadas
Descrevem-se abaixo, a partir das rotas correpondentes, as principais funcionalidades da aplicação.

#### get /
Função - Processa requisição na raiz, direcionando à tela de login ou à tela de formulários pendentes, conforme se cuide de usuário autenticado ou não

Origem - Utilização do navegador pelo usuário

#### get /login (SessoesController#new)
Função - Apresenta tela de login, que exige e-mail e senha

Origem - Redirecionamento de qualquer requisição feita por usuário não autenticado

#### post /login (SessoesController#create)
Função - Cria sessão de usuário, em caso de autenticação bem-sucedida

Origem - Tela de login

#### delete /logout (SessoesController#destroy)
Função - Encerra sessão de usuário

Origem - Clique em botão de logout no menu superior

#### post /login_para_teste (SessoesControllet#login_para_teste)
Função - Permite criar sessão de usuário a partir do parâmetro e-mail, exclusivamente em ambiente de teste

Origem - Chamada em testes RSpec

#### get /senha/redefinir (SenhasController#edit)
Função - Apresenta tela de redefinição de senha

Origem - Tentativa de login de usuário com senha provisória ou utilização de link enviado por e-mail a usuário com senha provisória

####  patch /senha/redefinir (SenhasController#update)
Função - Atualiza senha do usuário, tornando-a definitiva

Origem - Tela de redefinição de senha

#### get /admin (AdminController#index)
Função - Apresenta as ações disponíveis aos usuários com perfil de administrador (importar dados; editar templates; enviar formulários; visualizar respostas de formulários)

Origem - Clique na opção "Gerenciamento" do menu lateral

#### post /admin/importar_dados (AdminController#importar_dados)
Função - Importa dados dos JSONs para o banco de dados e envia aos usuários criados e-mail com senha provisória e link com token para redefinição de senha

Origem - Tela de Gerenciamento

#### get /letter_opener (gem Letter Opener Web)
Função - Apresenta painel com e-mails enviados aos usuários criados

Origem - Utilização do navegador

#### get /formularios (FormulariosController#index)
Função - Apresenta todos os formulários não respondidos pelo usuário autenticado

Origem - Redirecionamento após autenticação de usuário ou utilização do menu superior

#### get /formularios/new (FormulariosController#new)
Função - Apresenta tela de envio de formulários para turmas

Origem - Tela de gerenciamento do administrador

#### post /formularios (FormulariosController#create)
Função - Envia formulário para turmas

Origem - Tela de envio de formulários do administrador 

#### get /resposta_formularios (RespostaFormulariosController#index)
Função - Apresenta todos os formulários que já foram respondidos ou, quando informado como parâmetro o número identificador de um formulário específico, gera um CSV com o conteúdo de todas as respostas correspondentes

Origem - Tela de gerenciamento do administrador ou, no caso do CSV, tela de resultados

#### get /resposta_formularios/new (RespostaFormulariosController#new)
Função - Apresenta tela de resposta a formulário

Origem - Tela de formulários pendentes de resposta do usuário

#### post /resposta_formularios (RespostaFormulariosController#create)
Função - Formaliza resposta a formulário

Origem - Tela de resposta a formulário

#### get /templates (TemplatesController#index)
Função - Apresenta todos os templates já criados

Origem - Tela de gerenciamento do administrador 

#### get /templates/new (TemplatesController#new)
Função - Apresenta formulário de criação de template

Origem - Tela de templates do administrador

#### post /templates (TemplatesController#create)
Função - Cria um template

Origem - Tela de criação de templates

#### get /templates/:id/edit (TemplatesController#edit)
Função - Apresenta tela de edição de template anteriomente criado

Origem - Tela de templates do administrador

#### patch /templates/:id (TemplatesController#update)
Função - Atualiza dados de um template editado

Origem - Tela de edição de templates

#### delete /templates/:id (TemplatesController#destroy)
Função - Apaga template da base de dados

Origem - Tela de templates do administrador
