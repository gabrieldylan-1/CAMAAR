Feature: Criar template de formulário
  Eu como Administrador
  Quero criar um template de formulário contendo as questões do formulário
  A fim de gerar formulários de avaliações para avaliar o desempenho das turmas

  Background:
    Given estou autenticado como "admin"
    And estou com o modal de template aberto

  @happy_path
  Scenario: Admin adiciona questão objetiva e questão aberta
    When defino o nome do template como "Feedback 2024"
    And adiciono a questão 1 com:
      | tipo     | Radio                       |
      | texto    | Como avalia o professor?    |
      | opcoes   | Muito bom,Bom,Razoável,Ruim |
    And adiciono a questão 2 com:
      | tipo  | Texto                      |
      | texto | Sugestões para a disciplina |
    And salvo o template pelo modal
    Then devo ver a mensagem "Template salvo"
    And devo ver duas questões listadas no preview

  @happy_path
  Scenario: Admin adiciona nova questão através do botão +
    When adiciono a questão 1 com:
      | tipo  | Texto |
      | texto | Feedback geral |
    And clico para adicionar nova questão
    And adiciono a questão 2 com:
      | tipo  | Radio |
      | texto | Qualidade do material |
      | opcoes | Excelente,Boa,Ruim |
    And salvo o template pelo modal
    Then devo ver duas questões listadas no preview

  @sad_path
  Scenario: Admin tenta salvar sem nome do template
    When adiciono a questão 1 com:
      | tipo  | Texto |
      | texto | Feedback geral |
    And salvo o template pelo modal
    Then devo ver a mensagem "Informe o nome do template"
    And o modal deve permanecer aberto

  @sad_path
  Scenario: Admin tenta salvar questão do tipo radio sem opções
    When defino o nome do template como "Avaliação"
    And adiciono a questão 1 com:
      | tipo  | Radio |
      | texto | Qual sua satisfação? |
    And salvo o template pelo modal
    Then devo ver a mensagem "Inclua opções para perguntas objetivas"
    And nenhuma questão deve ser adicionada

  @sad_path
  Scenario: Usuário não admin abre o modal diretamente
    Given estou autenticado como "aluno"
    When estou com o modal de template aberto
    Then devo ver a mensagem "Acesso restrito"
    And o modal deve ser fechado automaticamente
