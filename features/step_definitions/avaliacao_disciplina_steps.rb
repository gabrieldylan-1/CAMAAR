Given("que estou na avaliação da disciplina {string} do semestre {string}") do |disciplina, semestre|
  pending <<~MSG
    Navegue até a tela de avaliação exibindo "#{disciplina}" e "#{semestre}".
  MSG
end

Given("a avaliação possui perguntas obrigatórias e campos abertos opcionais") do
  pending "Configure fixtures/mocks das perguntas antes de carregar a página"
end

Given("que estou autenticado como {string}") do |perfil|
  pending "Autentique-se como #{perfil} antes de acessar a avaliação"
end

When("seleciono as opções {string}, {string} e {string} para as perguntas objetivas") do |op1, op2, op3|
  pending "Use Capybara para marcar cada rádio correspondente"
end

When("preencho os campos abertos com meus comentários") do
  pending "Preencha textareas/inputs com comentários usando Capybara"
end

When("avanço para finalizar a avaliação") do
  pending "Clique no botão roxo de avançar/submit e aguarde a resposta"
end

Then("devo ver a mensagem {string}") do |mensagem|
  pending "Cheque por banners/toasts exibindo '#{mensagem}'"
end

Then("a avaliação deve ser marcada como concluída") do
  pending "Verifique no banco (ou via API) o status submitted:true"
end

When("deixo os campos abertos em branco") do
  pending "Assegure-se de não interagir com os campos opcionais"
end

Then("os comentários opcionais devem permanecer vazios") do
  pending "Confirme que nenhum texto foi enviado para os campos opcionais"
end

When("seleciono somente duas respostas objetivas") do
  pending "Marque apenas dois rádios deixando o terceiro sem seleção"
end

When("seleciono respostas válidas para todas as perguntas") do
  pending "Selecione todas as alternativas obrigatórias do formulário"
end

Then("devo permanecer na tela de avaliação") do
  pending "Garanta que a URL e o cabeçalho continuem sendo da avaliação"
end

Then("devo ver o aviso {string}") do |mensagem|
  pending "Procure mensagens de validação na página"
end

Then("o botão de envio deve ficar desabilitado até que todas as respostas estejam preenchidas") do
  pending "Valide atributo disabled do botão"
end

Given("minha sessão expirou") do
  pending "Expire manualmente o token/cookie antes do submit"
end

Then("devo ser redirecionado para o login") do
  pending "Confirme que a rota atual é /login"
end

Then("devo poder tentar enviar novamente sem perder as respostas preenchidas") do
  pending "Verifique que os inputs mantêm os valores após o erro"
end

Then("nenhuma nova submissão deve ser registrada") do
  pending "Confirme que um novo registro não foi criado no banco"
end

Given("já existe uma avaliação concluída para a disciplina {string} no semestre {string}") do |disciplina, semestre|
  pending <<~MSG
    Crie registros indicando que o aluno já respondeu "#{disciplina}" em "#{semestre}".
  MSG
end

When("ocorre uma falha de comunicação com o servidor") do
  pending "Simule erro 500/timeout na requisição de submissão"
end
