Feature: Autenticação na tela de login
  Para acessar as funcionalidades certas do Camaar
  Como aluno ou administrador
  Quero realizar login de maneira segura e receber mensagens claras de erro

  Background:
    Given que estou na tela de login

  @happy_path
  Scenario Outline: Usuário acessa com credenciais válidas
    Given existe um <tipo> cadastrado com email "<email>" e senha "<senha>"
    When informo o email "<email>" e a senha "<senha>"
    And confirmo o envio do formulário
    Then devo ser direcionado para o painel do <tipo>
    And devo ver a mensagem "Bem vindo ao Camaar"

    Examples:
      | tipo  | email                | senha      |
      | aluno | aluno@aluno.unb.br   | senha123   |
      | admin | admin@camaar.unb.br  | adm!n2024  |

  @sad_path
  Scenario Outline: Usuário informa senha incorreta
    Given existe um <tipo> cadastrado com email "<email>" e senha "<senha_correta>"
    When informo o email "<email>" e a senha "<senha_digitada>"
    And confirmo o envio do formulário
    Then devo continuar na tela de login
    And devo ver a mensagem de erro "Email ou senha inválidos"

    Examples:
      | tipo  | email               | senha_correta | senha_digitada |
      | aluno | aluno@aluno.unb.br  | senha123      | 321senha       |
      | admin | admin@camaar.unb.br | adm!n2024     | admin          |

  @sad_path
  Scenario: Usuário tenta acessar com email não cadastrado
    When informo o email "intruso@camaar.unb.br" e a senha "qualquer"
    And confirmo o envio do formulário
    Then devo continuar na tela de login
    And devo ver a mensagem de erro "Conta não encontrada"

  @sad_path
  Scenario: Campos obrigatórios vazios
    When informo o email "" e a senha ""
    And confirmo o envio do formulário
    Then devo ver a mensagem "Informe email e senha"
    And os campos devem ser destacados como inválidos

