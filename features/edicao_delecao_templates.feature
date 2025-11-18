Feature: Manutenção de templates próprios
  Para organizar melhor os modelos
  Como administrador
  Quero editar ou deletar templates que criei sem impactar formulários existentes

  Background:
    Given que o administrador "Ana" está autenticado
    And que existe o template "Pesquisa Satisfação 2024" criado por Ana
    And existem formulários publicados baseados nesse template
    And existe também o template "Comunicado Financeiro" criado por outro administrador

  @happy_path
  Scenario: Administrador edita um template criado por ele sem afetar formulários
    Given Ana acessa a lista de templates
    When ela seleciona "Pesquisa Satisfação 2024" e altera campos permitidos
    And salva o template atualizado
    Then a nova versão do template fica disponível para futuros formulários
    And os formulários já publicados permanecem inalterados

  @happy_path
  Scenario: Administrador remove um template criado por ele
    Given Ana acessa a lista de templates
    When ela solicita a exclusão do template "Pesquisa Satisfação 2024"
    And confirma a operação
    Then o template deixa de aparecer para novos formulários
    And os formulários existentes criados a partir dele continuam disponíveis

  @sad_path
  Scenario: Administrador tenta editar template que não criou
    Given Ana acessa os detalhes do template "Comunicado Financeiro"
    When tenta alterar qualquer campo
    Then o sistema bloqueia a ação
    And exibe mensagem informando que apenas o criador original pode editar

  @sad_path
  Scenario: Exclusão cancelada por existência de formulários em andamento
    Given Ana solicita excluir "Pesquisa Satisfação 2024"
    And o sistema detecta formulários em andamento usando esse template
    Then a exclusão é impedida
    And Ana recebe orientação para arquivar ou migrar os formulários antes de remover o template

  @sad_path
  Scenario: Falha por perda de conexão ao salvar alterações
    Given Ana está editando "Pesquisa Satisfação 2024"
    When ocorre uma falha de conexão ao confirmar as mudanças
    Then o sistema informa o erro
    And mantém o template na última versão válida sem alterações parciais
