Given("acesso o modal de envio de formulários") do
  pending "Clique no botão Enviar Formulários para abrir o modal"
end

When("seleciono o template {string}") do |template|
  pending "Escolha #{template} no dropdown"
end

When("seleciono as turmas:") do |table|
  pending <<~MSG
    Marque cada turma listada: #{table.rows_hash}
  MSG
end

When("confirmo o envio dos formulários") do
  pending "Clique no botão Enviar do modal"
end

Then("cada turma deve receber o link de avaliação") do
  pending "Valide registros de disparo para cada turma"
end

Then("exatamente uma turma deve aparecer como {string}") do |status|
  pending "Cheque o badge/status '#{status}' na listagem"
end

When("tento confirmar o envio sem escolher template") do
  pending "Não selecione template e tente salvar"
end

Then("o botão de enviar deve permanecer desabilitado") do
  pending "Confirme atributo disabled"
end

When("não seleciono nenhuma turma") do
  pending "Garanta que nenhuma checkbox esteja marcada"
end

Then("nenhum envio deve ser criado") do
  pending "Verifique ausência de registros de envio"
end

When("ocorre um erro no serviço de email") do
  pending "Simule falha na integração"
end

Then("devo poder tentar enviar novamente mantendo as seleções") do
  pending "Verifique que o modal mantém template e turmas marcadas"
end

When("acesso o modal de envio de formulários") do
  pending "Abra diretamente a rota/modal via UI"
end

Then("o modal deve ser fechado") do
  pending "Confirme que o modal não está mais visível"
end
