Feature: Painel de gerenciamento exclusivo do admin
  Para administrar avaliações e templates do CAMAAR
  Como administrador autenticado
  Quero acessar as ações de importar dados, editar templates, enviar formulários e visualizar resultados

  Background:
    Given que estou autenticado como "admin"
    And acesso o menu "Gerenciamento"

  @sad_path
  Scenario: Aluno tenta acessar o painel de gerenciamento
    Given estou autenticado como "aluno"
    When tento acessar a rota de gerenciamento
    Then devo ver a mensagem "Acesso restrito a administradores"
    And devo ser redirecionado para a lista de avaliações
