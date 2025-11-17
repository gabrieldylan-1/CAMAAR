Feature: Envio de formulários de avaliação
  Para distribuir avaliações aos alunos
  Como administrador autenticado
  Quero selecionar um template e turmas para enviar os formulários

  Background:
    Given estou autenticado como "admin"
    And acesso o modal de envio de formulários

  @happy_path
  Scenario: Admin envia formulários para duas turmas
    When seleciono o template "Avaliação padrão 2024"
    And seleciono as turmas:
      | nome         | semestre | codigo  |
      | Estudos Em   | 2024.1   | CIC1024 |
      | Redes I      | 2024.1   | CIC2001 |
    And confirmo o envio dos formulários
    Then devo ver a mensagem "Formulários enviados com sucesso"
    And cada turma deve receber o link de avaliação

  @happy_path
  Scenario: Admin envia para apenas uma turma
    When seleciono o template "Avaliação avançada"
    And seleciono as turmas:
      | nome       | semestre | codigo  |
      | Estudos Em | 2024.1   | CIC1024 |
    And confirmo o envio dos formulários
    Then devo ver a mensagem "Formulários enviados com sucesso"
    And exatamente uma turma deve aparecer como "enviado"

  @sad_path
  Scenario: Admin esquece de selecionar template
    When tento confirmar o envio sem escolher template
    Then devo ver a mensagem "Selecione um template"
    And o botão de enviar deve permanecer desabilitado

  @sad_path
  Scenario: Admin não seleciona nenhuma turma
    When seleciono o template "Avaliação padrão 2024"
    And não seleciono nenhuma turma
    And confirmo o envio dos formulários
    Then devo ver a mensagem "Escolha ao menos uma turma"
    And nenhum envio deve ser criado

  @sad_path
  Scenario: Usuário não admin tenta acessar o envio
    Given estou autenticado como "aluno"
    When acesso o modal de envio de formulários
    Then devo ver a mensagem "Acesso restrito"
    And o modal deve ser fechado
