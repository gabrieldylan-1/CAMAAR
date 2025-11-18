Feature: Definição de senha a partir do e-mail de cadastro
  Para acessar o sistema
  Como usuário
  Quero definir minha senha usando o link recebido no e-mail de solicitação de cadastro

  Background:
    Given o usuário "Marina" recebeu um e-mail com link de definição de senha válido por 24 horas
    And seu cadastro está ativo mas sem senha definida

  @happy_path
  Scenario: Usuário define senha pela primeira vez via link válido
    Given Marina acessa o link recebido no e-mail
    When informa a nova senha e confirma com a mesma combinação
    Then o sistema salva a senha com sucesso
    And apresenta a mensagem "Senha definida. Você já pode acessar o sistema"
    And a usuária é direcionada para a tela de login

  @happy_path
  Scenario: Usuário volta depois e utiliza o mesmo link ainda válido
    Given Marina definiu a senha corretamente há poucos minutos
    When acessa novamente o link
    Then o sistema informa que a senha já foi definida
    And oferece o acesso direto à tela de login

  @sad_path
  Scenario: Senhas não coincidem
    Given Marina acessa o link válido
    When informa “NovaSenha123” e confirma com “NovaSenha321”
    Then a senha não é salva
    And surge o aviso “A confirmação precisa ser igual à nova senha.”
