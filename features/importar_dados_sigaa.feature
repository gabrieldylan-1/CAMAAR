Feature: Importar dados do SIGAA usando JSONs do repositório
  Para manter a base completa
  Como administrador
  Quero importar turmas, disciplinas e participantes do SIGAA apenas quando não existirem localmente

  Background:
    Given o administrador "Ana" está autenticado
    And os JSONs de turmas, matérias e participantes exportados do SIGAA estão disponíveis no repositório
    And a base atual pode conter registros parciais

  @happy_path
  Scenario: Importação inclui apenas registros inexistentes
    Given Ana acessa o menu "Integrações > SIGAA"
    When seleciona os arquivos JSON fornecidos no repositório
    And inicia a importação
    Then o sistema valida os dados
    And insere novas turmas, matérias e participantes que ainda não existem
    And apresenta resumo com quantos itens foram adicionados e ignorados por já existirem

  @happy_path
  Scenario: Importação contempla dependências entre entidades
    Given Ana carrega o JSON de participantes que referenciam turmas e matérias
    When essas turmas e matérias não existem na base
    Then o processo cria primeiro as turmas e matérias correspondentes
    And só então cadastra cada participante vinculado

  @sad_path
  Scenario: Falha na validação do JSON
    Given Ana tenta importar um arquivo JSON ausente de campos obrigatórios
    When o processo detecta inconsistências
    Then a importação é abortada
    And o sistema informa quais arquivos ou registros estão inválidos
    And nenhum dado parcial é aplicado à base

  @sad_path
  Scenario: Erro de comunicação ou leitura dos arquivos
    Given Ana seleciona os JSONs para importação
    When ocorre falha ao ler um dos arquivos (permissão/corrupção)
    Then o sistema exibe “Não foi possível carregar o arquivo <nome>. Verifique e tente novamente.”
    And a importação completa não é iniciada

  @sad_path
  Scenario: Administrador cancela o processo antes de confirmar
    Given Ana analisou o resumo de registros a importar
    When decide cancelar
    Then nenhum dado do SIGAA é gravado na base
    And o sistema registra o cancelamento e mantém a base sem alterações
