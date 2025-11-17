Feature: Gerenciamento de templates de avaliação
  Para manter modelos de avaliação consistentes
  Como administrador autenticado
  Quero criar, editar e excluir templates através do painel de gerenciamento

  Background:
    Given estou autenticado como "admin"
    And acesso o painel de templates


  @happy_path
  Scenario: Admin exclui um template não utilizado
    Given existe o template "Template Antigo"
    When excluo o template "Template Antigo"
    And confirmo a exclusão
    Then o card "Template Antigo" não deve mais existir
    And devo ver a mensagem "Template removido"


  @sad_path
  Scenario: Usuário não admin tenta acessar templates
    Given estou autenticado como "aluno"
    When acesso o painel de templates
    Then devo ver a mensagem "Acesso restrito a administradores"
    And devo ser redirecionado para o painel inicial
