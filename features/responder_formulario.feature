Feature: Responder formulário da turma
  Para avaliar minha turma
  Como participante matriculado
  Quero preencher e enviar o questionário correspondente

  Background:
    Given o participante "Lucas" está autenticado
    And Lucas está matriculado na turma "Gestão 2024"
    And o formulário "Avaliação da Turma Gestão 2024" está disponível para resposta

  @happy_path
  Scenario: Participante preenche e envia avaliação com sucesso
    Given Lucas acessa o menu "Formulários"
    When seleciona "Avaliação da Turma Gestão 2024"
    And responde todas as perguntas obrigatórias
    And envia o formulário
    Then o sistema confirma “Avaliação enviada com sucesso”
    And o formulário passa a constar como respondido para Lucas

  @happy_path
  Scenario: Participante salva rascunho e retoma mais tarde
    Given Lucas abriu o formulário
    When responde parcialmente e escolhe “Salvar rascunho”
    Then o sistema armazena as respostas parciais
    And ao voltar ao formulário, as respostas preenchidas permanecem lá

  @sad_path
  Scenario: Participante tenta enviar sem completar perguntas obrigatórias
    Given Lucas está respondendo o formulário
    When deixa campos obrigatórios em branco e clica em “Enviar”
    Then o sistema bloqueia o envio
    And destaca os campos faltantes com a mensagem “Preencha este campo”

  @sad_path
  Scenario: Participante tenta responder formulário fora do prazo
    Given o prazo do formulário expirou
    When Lucas tenta acessá-lo
    Then o sistema informa “Formulário indisponível, prazo encerrado”
    And impede o início da resposta

  @sad_path
  Scenario: Falha de conexão ao enviar o formulário
    Given Lucas completou todas as respostas
    When clica em “Enviar” e ocorre falha de rede
    Then o sistema mostra “Não foi possível enviar. Verifique sua conexão e tente novamente”
    And o questionário permanece como não enviado até nova tentativa
