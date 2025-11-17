Given("estou com o modal de template aberto") do
  pending "Abra o modal de criação/edição"
end

When("estou com o modal de template aberto") do
  pending "Abra o modal de criação/edição"
end

When("defino o nome do template como {string}") do |nome|
  pending "Preencha o campo de nome com #{nome}"
end

When("adiciono a questão {int} com:") do |numero, table|
  pending <<~MSG
    Preencha campos da questão #{numero} com #{table.rows_hash}
  MSG
end

When("clico para adicionar nova questão") do
  pending "Clique no botão + do modal"
end

When("salvo o template pelo modal") do
  pending "Clique em Criar/Salvar no modal"
end

Then("devo ver duas questões listadas no preview") do
  pending "Confirme que duas questões são renderizadas"
end

Then("nenhuma questão deve ser adicionada") do
  pending "Verifique que o preview continua vazio"
end

Then("o modal deve ser fechado automaticamente") do
  pending "Confirme que o modal não está mais visível"
end
