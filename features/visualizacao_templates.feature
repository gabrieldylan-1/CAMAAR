Feature: Visualizar templates criados
  Para gerenciar modelos próprios
  Como administrador
  Quero visualizar os templates que criei para poder editá-los ou removê-los

  Background:
    Given o administrador "Ana" está autenticado
    And existem os templates abaixo no sistema:
      | título                    | criado_por |
      | Pesquisa Satisfação 2024 | Ana        |
      | Checklist Financeiro     | Ana        |
      | Aviso Geral RH           | Bruno      |

  @happy_path
  Scenario: Administrador lista apenas os templates que criou
    Given Ana acessa o menu "Templates"
    When solicita visualizar seus modelos
    Then a lista exibe "Pesquisa Satisfação 2024" e "Checklist Financeiro"
    And templates criados por outros administradores não são mostrados

  @happy_path
  Scenario: Administrador navega até a edição a partir da lista
    Given Ana está na lista de templates
    When seleciona "Pesquisa Satisfação 2024" e clica em Editar
    Then o sistema abre a tela de edição correspondendo ao template escolhido

  @happy_path
  Scenario: Administrador acessa opção de exclusão a partir da lista
    Given Ana está na lista de templates
    When expande as ações do template "Checklist Financeiro"
    Then visualiza o botão de excluir disponível para modelos próprios

  @sad_path
  Scenario: Administrador sem templates vê mensagem orientativa
    Given "Carlos" está autenticado e não possui templates criados
    When acessa o menu "Templates"
    Then a lista aparece vazia
    And o sistema exibe mensagem “Você ainda não criou templates. Clique em ‘Novo Template’ para começar.”

  @sad_path
  Scenario: Falha ao carregar lista de templates
    Given Ana acessa o menu "Templates"
    When ocorre erro de comunicação com o servidor
    Then a lista não é carregada
    And uma mensagem informa “Não foi possível carregar seus templates, tente novamente mais tarde.”
    And o botão “Tentar novamente” fica disponível
