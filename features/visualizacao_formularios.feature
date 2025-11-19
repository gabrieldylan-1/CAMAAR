Feature: Visualizar formulários pendentes para responder
  Para escolher qual questionário completar
  Como participante de uma turma
  Quero ver os formulários ainda não respondidos nas turmas em que estou matriculado

  Background:
    Given o participante "Lucas" está autenticado
    And Lucas está matriculado nas turmas:
      | turma    | formulário        | status_resposta |
      | CIC0197  | Avaliação Final 1 | não respondido  |
      | CIC0197  | Avaliação Final 2 | respondido      |
      | CIC0200  | Feedback 1        | não respondido  |

  @happy_path
  Scenario: Participante lista apenas formulários não respondidos
    Given Lucas acessa o menu "Formulários para responder"
    When solicita visualizar os formulários pendentes
    Then a lista exibe "Avaliação Final 1" e "Feedback 1" com suas respectivas turmas e prazos
    And o formulário "Avaliação Final 2" não aparece por já estar respondido

  @happy_path
  Scenario: Participante inicia o preenchimento a partir da lista
    Given Lucas está na lista de formulários pendentes
    When seleciona "Avaliação Final 1" e clica em "Responder"
    Then o sistema abre o formulário correspondente para preenchimento

  @sad_path
  Scenario: Participante não possui formulários pendentes
    Given a participante "Marina" está autenticada e já respondeu todos os formulários de suas turmas
    When ela acessa o menu "Formulários para responder"
    Then a lista aparece vazia
    And o sistema exibe a mensagem "Você está em dia! Aguarde novos formulários das suas turmas."

  @sad_path
  Scenario: Falha ao carregar formulários pendentes
    Given Lucas acessa o menu "Formulários para responder"
    When ocorre um erro de comunicação com o servidor
    Then o sistema informa "Não foi possível carregar os formulários pendentes. Tente novamente."
    And exibe o botão "Recarregar"

  @sad_path
  Scenario: Participante tenta responder formulário que já venceu
    Given Lucas vê o formulário "Avaliação Final 1" com prazo expirado
    When tenta abrir o formulário
    Then o sistema bloqueia o acesso
    And mostra a mensagem "Este formulário não está mais disponível para resposta."
