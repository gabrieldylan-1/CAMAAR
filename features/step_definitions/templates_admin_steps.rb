Given("acesso o painel de templates") do
  pending "Navegue para /admin/templates"
end

When("clico em {string}") do |acao|
  pending "Clique no botão #{acao}"
end

When("preencho o popup com os dados:") do |table|
  pending <<~MSG
    Preencha campos do modal com: #{table.rows_hash}
  MSG
end

When("salvo o template") do
  pending "Clique em Salvar no modal"
end

Then("devo ver o card {string}") do |nome|
  pending "Verifique se o card #{nome} aparece na grade"
end

Then("devo ver a mensagem {string}") do |mensagem|
  pending "Asserte presença do texto '#{mensagem}'"
end

Given("existe o template {string}") do |nome|
  pending "Garanta via fixture que o template #{nome} existe"
end

When("seleciono o template {string} para edição") do |nome|
  pending "Clique no card #{nome} e abra o modal de edição"
end

When("atualizo o popup com os dados:") do |table|
  pending <<~MSG
    Atualize apenas os campos fornecidos: #{table.rows_hash}
  MSG
end

Then("o card {string} deve exibir a descrição {string}") do |nome, descricao|
  pending "Valide o texto da descrição renderizado no card"
end

When("excluo o template {string}") do |nome|
  pending "Clique no ícone de deletar do card #{nome}"
end

When("confirmo a exclusão") do
  pending "Confirme no modal de alerta"
end

Then("o card {string} não deve mais existir") do |nome|
  pending "Garanta que o card sumiu da grade"
end

Then("o popup deve permanecer aberto") do
  pending "Verifique que o modal ainda está visível"
end

Then("os dados originais devem permanecer inalterados") do
  pending "Compare os valores com o estado anterior"
end

Given("existe o template {string} associado a formulários enviados") do |nome|
  pending "Crie associação do template #{nome} a formulários"
end

Then("o card {string} deve continuar visível") do |nome|
  pending "Cheque que o card #{nome} ainda está na grade"
end

Then("devo ser redirecionado para o painel inicial") do
  pending "Assegure que a rota atual é /avaliacoes"
end
