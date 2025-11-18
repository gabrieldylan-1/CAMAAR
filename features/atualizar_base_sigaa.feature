Feature: Atualizar base de dados com dados do SIGAA
  Para manter os cadastros corretos
  Como administrador
  Quero sincronizar a base existente com os dados atuais do SIGAA

  Background:
    Given o administrador "Ana" está autenticado
    And existe uma base local previamente carregada
    And Ana possui credenciais válidas para acessar o SIGAA

  @happy_path
  Scenario: Administrador atualiza a base com sucesso
    Given Ana acessa o menu "Integrações > SIGAA"
    When dispara a ação "Atualizar base"
    And informa as credenciais do SIGAA
    Then o sistema conecta ao SIGAA
    And importa os registros atualizados
    And apresenta mensagem "Base sincronizada com sucesso"
    And gera log da execução com quantidade de registros alterados

  @happy_path
  Scenario: Atualização parcial com resumo de mudanças
    Given Ana inicia a atualização do SIGAA
    When alguns registros são atualizados e outros mantidos
    Then o processo termina com status “Concluído”
    And o resumo mostra inserções, alterações e itens sem mudanças
    And Ana pode baixar o relatório detalhado

  @sad_path
  Scenario: Falha de autenticação no SIGAA
    Given Ana inicia a atualização
    When informa credenciais inválidas
    Then o sistema interrompe o processo
    And exibe “Usuário ou senha do SIGAA inválidos”
    And nenhuma alteração é aplicada na base local

  @sad_path
  Scenario: Erro durante importação de dados
    Given Ana inicia a atualização e a conexão com o SIGAA ocorre normalmente
    When ocorre erro ao processar os registros
    Then o sistema sinaliza “Falha ao atualizar a base. Tente novamente.”
    And oferece a opção de baixar o log de erro
    And a base permanece no estado anterior
