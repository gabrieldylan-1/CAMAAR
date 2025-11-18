Feature: Autenticação por e-mail ou matrícula
  Para responder formulários ou administrar o sistema
  Como usuário cadastrado
  Quero acessar com e-mail ou matrícula e senha

  Background:
    Given que os seguintes usuários já existem:
      | perfil         | nome  | email               | matricula | senha      |
      | usuario_padrao | João  | joao@empresa.com    | BB123456  | Senha#123  |
      | administrador  | Ana   | ana.admin@empresa.com | BB654321 | Admin#321  |

  @happy_path
  Scenario Outline: Usuário acessa o sistema com credencial válida
    Given que "<perfil>" deseja acessar o sistema
    When informa "<tipo_login>" "<credencial>" e a senha correta
    Then o login é autorizado
    And o usuário visualiza a tela principal para responder formulários
    And o menu lateral não exibe opções extras além das permitidas ao perfil
    Examples:
      | perfil         | tipo_login | credencial        |
      | usuario_padrao | e-mail     | joao@empresa.com  |
      | usuario_padrao | matrícula  | BB123456          |

  @happy_path @admin
  Scenario: Administrador visualiza a opção de gerenciamento após autenticar
    Given que "administrador" deseja acessar o sistema
    When informa o e-mail "ana.admin@empresa.com" e a senha correta
    Then o login é autorizado
    And o menu lateral exibe a opção "Gerenciamento"
    And o administrador pode acessar as funcionalidades de gestão do sistema

  @sad_path
  Scenario Outline: Autenticação bloqueada por credenciais inválidas
    Given que "<perfil>" deseja acessar o sistema
    When informa "<tipo_login>" "<credencial>" com a senha "<senha_tentada>"
    Then o sistema nega o acesso
    And uma mensagem informa que e-mail/matrícula ou senha estão incorretos
    And nenhuma funcionalidade do sistema é carregada
    Examples:
      | perfil         | tipo_login | credencial        | senha_tentada |
      | usuario_padrao | e-mail     | joao@empresa.com  | SenhaErrada1  |
      | usuario_padrao | matrícula  | BB123456          | SenhaErrada1  |
      | administrador  | e-mail     | ana.admin@empresa.com | AdminErrada |

  @sad_path
  Scenario: Autenticação falha quando um dos campos não é informado
    Given que qualquer usuário tenta acessar o sistema
    When submete o formulário com e-mail/matrícula ou senha em branco
    Then o sistema impede o envio
    And uma mensagem orienta a preencher todos os campos obrigatórios
