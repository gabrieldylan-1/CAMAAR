Feature: Gerar relatório do administrador 
  Eu como Administrador
  Quero baixar um arquivo csv contendo os resultados de um formulário
  A fim de avaliar o desempenho das turmas

  Background:
    Given estou autenticado como "admin"
    And acesso o painel de resultados

  @happy_path
  Scenario: Admin baixa o resultado de uma disciplina específica
    When clico no card "Arquitetura de Computadores" do semestre "2024/1"
    Then devo ver o download do arquivo "arquitetura-2024-1.csv" iniciado
    And devo ver a mensagem "Download iniciado"

  @sad_path
  Scenario: Admin tenta baixar resultado e serviço está indisponível
    When clico no card "Arquitetura de Computadores" do semestre "2024/1"
    And ocorre um erro na geração do CSV
    Then devo ver a mensagem "Não foi possível gerar o CSV"
    And o download não deve ser iniciado

  @sad_path
  Scenario: Painel sem resultados disponíveis
    Given não existem resultados cadastrados
    When acesso o painel de resultados
    Then devo ver a mensagem "Nenhum resultado disponível"
    And nenhum card deve ser exibido

  @sad_path
  Scenario: Usuário não admin tenta acessar resultados
    Given estou autenticado como "aluno"
    When acesso o painel de resultados
    Then devo ver a mensagem "Acesso restrito a administradores"
    And devo ser redirecionado para o painel inicial
