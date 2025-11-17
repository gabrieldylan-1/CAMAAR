Given("acesso o menu {string}") do |menu|
  pending "Use Capybara para abrir a seção de #{menu}"
end

When("seleciono a ação {string}") do |acao|
  pending "Clique no botão #{acao}"
end

When("envio o arquivo {string}") do |arquivo|
  pending "Anexe o arquivo #{arquivo} no formulário de importação"
end

Then("os registros devem ser atualizados na base") do
  pending "Verifique no banco que os dados foram importados"
end

When("altero o template {string}") do |nome|
  pending "Abra o template #{nome} e edite os campos necessários"
end

When("salvo as alterações") do
  pending "Clique em Salvar no editor de templates"
end

Then("o template deve refletir as novas perguntas") do
  pending "Confirme que as mudanças aparecem no preview"
end

When("escolho a turma {string}") do |turma|
  pending "Selecione #{turma} na lista de turmas"
end

When("confirmo o envio") do
  pending "Clique em confirmar e aguarde o status"
end

Then("os alunos devem receber a avaliação") do
  pending "Cheque registros de convites/envelopes gerados"
end

Then("devo ver o painel de resultados com os indicadores consolidados") do
  pending "Valide cards, gráficos e indicadores exibidos"
end

Given("estou autenticado como {string}") do |perfil|
  pending "Realize login simulando o perfil #{perfil}"
end

When("tento acessar a rota de gerenciamento") do
  pending "Visite /admin/gerenciamento"
end

Then("devo ver a mensagem {string}") do |mensagem|
  pending "Asserte que o texto '#{mensagem}' aparece na tela"
end

Then("devo ser redirecionado para a lista de avaliações") do
  pending "Verifique que a rota atual é /avaliacoes"
end

Then("nenhum dado deve ser alterado") do
  pending "Garanta que não houve novas importações"
end

When("altero o template {string} removendo todas as perguntas obrigatórias") do |nome|
  pending "Remova as perguntas mínimas do template #{nome}"
end

Then("o template original deve permanecer inalterado") do
  pending "Compare com versão anterior"
end

When("ocorre uma falha no serviço de email") do
  pending "Simule exception na integração de email"
end

Then("os formulários devem aparecer como {string}") do |status|
  pending "Cheque o status '#{status}' na UI/banco"
end

When("ocorre um erro de processamento") do
  pending "Simule falha no backend ao carregar resultados"
end

Then("devo poder tentar novamente") do
  pending "Verifique se existe botão/link de retry"
end
