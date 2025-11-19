Feature: Importar novos participantes do SIGAA
  Para garantir acesso ao CAMAAR
  Como administrador
  Quero importar participantes de turmas e enviar solicitação de definição de senha

  Background:
    Given o administrador "Ana" está autenticado
    And possui credenciais válidas para consultar o SIGAA
    And há novos participantes na turma "Metodologias Ativas 2024" ainda sem acesso ao CAMAAR

  @happy_path
  Scenario: Administrador importa participantes e dispara solicitação de senha
    Given Ana acessa o menu "Importar usuários do SIGAA"
    When seleciona a turma "Metodologias Ativas 2024" e inicia a importação
    Then o sistema lista os novos participantes encontrados
    And ao confirmar, envia e-mails com link para definição de senha
    And registra o status “Solicitação enviada” para cada participante

  @sad_path
  Scenario: Falha ao acessar dados do SIGAA
    Given Ana tenta importar participantes
    When ocorre erro de autenticação ou comunicação com o SIGAA
    Then o sistema exibe “Não foi possível acessar o SIGAA. Verifique credenciais ou tente mais tarde.”
    And nenhuma solicitação de senha é disparada

  @sad_path
  Scenario: Erro ao enviar e-mail de definição de senha
    Given a importação retornou usuários válidos
    When o envio de e-mail falha para alguns participantes
    Then o sistema informa quais usuários não receberam a solicitação
    And oferece ação “Reenviar” para tentar novamente

  @sad_path
  Scenario: Administrador cancela importação antes de confirmar
    Given Ana visualiza a prévia de participantes importados
    When decide cancelar a operação
    Then a importação é abortada
    And nenhuma solicitação de senha é enviada
