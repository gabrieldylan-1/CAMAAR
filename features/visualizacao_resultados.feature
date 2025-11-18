Feature: Visualização de resultados dos formulários
  Para gerar relatórios com base nas respostas
  Como administrador
  Quero visualizar quantas respostas cada formulário já recebeu

  Background:
    Given o administrador "Ana" está autenticado
    And existem formulários criados por ela com indicadores:
      | título                     | status   | respostas |
      | Pesquisa Satisfação 2024   | ativo    | 150       |
      | Checklist Implantação      | encerrado| 80        |

  @happy_path
  Scenario: Administrador consulta resultados e vê contagem de respostas
    Given Ana acessa o menu "Resultados dos Formulários"
    When solicita visualizar os formulários criados
    Then a lista mostra cada formulário com título, status e número de respostas acumuladas
    And o botão "Gerar relatório" fica disponível para cada item

  @happy_path
  Scenario: Administrador filtra resultados antes de gerar relatório
    Given Ana está na tela de resultados
    When aplica filtro por status "Ativo"
    Then apenas formulários ativos permanecem na lista com suas contagens de respostas
    And ao clicar em "Gerar relatório" o sistema abre o fluxo de exportação correspondente

  @sad_path
  Scenario: Administrador não possui formulários
    Given o administrador "Carlos" não criou formulários ainda
    When ele acessa o menu "Resultados dos Formulários"
    Then a lista aparece vazia
    And o sistema exibe "Você ainda não tem formulários. Clique em 'Novo Formulário' para começar."
