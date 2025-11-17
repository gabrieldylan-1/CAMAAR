Given("acesso o painel de resultados") do
  pending "Abra a seção /admin/resultados"
end

When("clico no card {string} do semestre {string}") do |disciplina, semestre|
  pending "Clique no card correspondente a #{disciplina} #{semestre}"
end

Then("devo ver o download do arquivo {string} iniciado") do |arquivo|
  pending "Cheque se o browser iniciou download do arquivo #{arquivo}"
end

Then("devo ver os downloads dos arquivos:") do |table|
  pending <<~MSG
    Verifique download para cada arquivo listado: #{table.raw.flatten[1..]}
  MSG
end

When("ocorre um erro na geração do CSV") do
  pending "Simule exceção na geração/exportação"
end

Then("o download não deve ser iniciado") do
  pending "Confirme que nenhum arquivo foi entregue"
end

Given("não existem resultados cadastrados") do
  pending "Garanta banco vazio para resultados"
end

Then("nenhum card deve ser exibido") do
  pending "Valide que a grade está vazia"
end
