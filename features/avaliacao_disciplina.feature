Feature: Avaliação de disciplina no fim do semestre
  Para dar feedback sobre a disciplina e o professor
  Como avaliador (aluno ou administrador)
  Quero preencher o formulário de avaliação com perguntas objetivas e abertas

  Background:
    Given que estou na avaliação da disciplina "Arquitetura de Computadores" do semestre "2024/1"
    And a avaliação possui perguntas obrigatórias e campos abertos opcionais

  @happy_path
  Scenario Outline: Avaliador responde todas as perguntas obrigatórias e envia feedback
    Given que estou autenticado como "<perfil>"
    When seleciono as opções "Muito bom", "Satisfatório" e "Bom" para as perguntas objetivas
    And preencho os campos abertos com meus comentários
    And avanço para finalizar a avaliação
    Then devo ver a mensagem "Obrigado pelo feedback!"
    And a avaliação deve ser marcada como concluída

    Examples:
      | perfil |
      | aluno  |
      | admin  |

  @happy_path
  Scenario Outline: Avaliador pula campos opcionais e envia somente perguntas obrigatórias
    Given que estou autenticado como "<perfil>"
    When seleciono as opções "Satisfatório", "Satisfatório" e "Satisfatório" para as perguntas objetivas
    And deixo os campos abertos em branco
    And avanço para finalizar a avaliação
    Then devo ver a mensagem "Obrigado pelo feedback!"
    And os comentários opcionais devem permanecer vazios

    Examples:
      | perfil |
      | aluno  |
      | admin  |

  @sad_path
  Scenario Outline: Avaliador tenta enviar sem responder uma pergunta obrigatória
    Given que estou autenticado como "<perfil>"
    When seleciono somente duas respostas objetivas
    And avanço para finalizar a avaliação
    Then devo permanecer na tela de avaliação
    And devo ver o aviso "Responda todas as perguntas obrigatórias"
    And o botão de envio deve ficar desabilitado até que todas as respostas estejam preenchidas

    Examples:
      | perfil |
      | aluno  |
      | admin  |

  @sad_path
  Scenario Outline: Sessão expira durante o preenchimento
    Given que estou autenticado como "<perfil>"
    And minha sessão expirou
    When avanço para finalizar a avaliação
    Then devo ser redirecionado para o login
    And devo ver a mensagem "Sua sessão expirou. Faça login novamente"

    Examples:
      | perfil |
      | aluno  |
      | admin  |

  @sad_path
  Scenario Outline: Erro de rede na submissão
    Given que estou autenticado como "<perfil>"
    When seleciono respostas válidas para todas as perguntas
    And ocorre uma falha de comunicação com o servidor
    Then devo ver a mensagem "Não foi possível enviar agora"
    And devo poder tentar enviar novamente sem perder as respostas preenchidas

    Examples:
      | perfil |
      | aluno  |
      | admin  |

  @sad_path
  Scenario Outline: Avaliador tenta enviar avaliação duplicada
    Given que estou autenticado como "<perfil>"
    And já existe uma avaliação concluída para a disciplina "Arquitetura de Computadores" no semestre "2024/1"
    When seleciono respostas válidas para todas as perguntas
    And avanço para finalizar a avaliação
    Then devo ver a mensagem "Você já enviou esta avaliação"
    And nenhuma nova submissão deve ser registrada

    Examples:
      | perfil |
      | aluno  |
      | admin  |
