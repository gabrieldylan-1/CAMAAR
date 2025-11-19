# frozen_string_literal: true

# Passos gerados a partir de importar_dados_sigaa.feature. Substitua os pendings pela automação real.

Given('o administrador {string} está autenticado') do |ana|
  pending('TODO: implementar passo: Given o administrador "Ana" está autenticado')
end

And('os JSONs de turmas, matérias e participantes exportados do SIGAA estão disponíveis no repositório') do
  pending('TODO: implementar passo: And os JSONs de turmas, matérias e participantes exportados do SIGAA estão disponíveis no repositório')
end

And('a base atual pode conter registros parciais') do
  pending('TODO: implementar passo: And a base atual pode conter registros parciais')
end

Given('Ana acessa o menu {string}') do |integra_es_sigaa|
  pending('TODO: implementar passo: Given Ana acessa o menu "Integrações > SIGAA"')
end

When('seleciona os arquivos JSON fornecidos no repositório') do
  pending('TODO: implementar passo: When seleciona os arquivos JSON fornecidos no repositório')
end

And('inicia a importação') do
  pending('TODO: implementar passo: And inicia a importação')
end

Then('o sistema valida os dados') do
  pending('TODO: implementar passo: Then o sistema valida os dados')
end

And('insere novas turmas, matérias e participantes que ainda não existem') do
  pending('TODO: implementar passo: And insere novas turmas, matérias e participantes que ainda não existem')
end

And('apresenta resumo com quantos itens foram adicionados e ignorados por já existirem') do
  pending('TODO: implementar passo: And apresenta resumo com quantos itens foram adicionados e ignorados por já existirem')
end

Given('Ana carrega o JSON de participantes que referenciam turmas e matérias') do
  pending('TODO: implementar passo: Given Ana carrega o JSON de participantes que referenciam turmas e matérias')
end

When('essas turmas e matérias não existem na base') do
  pending('TODO: implementar passo: When essas turmas e matérias não existem na base')
end

Then('o processo cria primeiro as turmas e matérias correspondentes') do
  pending('TODO: implementar passo: Then o processo cria primeiro as turmas e matérias correspondentes')
end

And('só então cadastra cada participante vinculado') do
  pending('TODO: implementar passo: And só então cadastra cada participante vinculado')
end

Given('Ana tenta importar um arquivo JSON ausente de campos obrigatórios') do
  pending('TODO: implementar passo: Given Ana tenta importar um arquivo JSON ausente de campos obrigatórios')
end

When('o processo detecta inconsistências') do
  pending('TODO: implementar passo: When o processo detecta inconsistências')
end

Then('a importação é abortada') do
  pending('TODO: implementar passo: Then a importação é abortada')
end

And('o sistema informa quais arquivos ou registros estão inválidos') do
  pending('TODO: implementar passo: And o sistema informa quais arquivos ou registros estão inválidos')
end

And('nenhum dado parcial é aplicado à base') do
  pending('TODO: implementar passo: And nenhum dado parcial é aplicado à base')
end

Given('Ana seleciona os JSONs para importação') do
  pending('TODO: implementar passo: Given Ana seleciona os JSONs para importação')
end

When('ocorre falha ao ler um dos arquivos (permissão/corrupção)') do
  pending('TODO: implementar passo: When ocorre falha ao ler um dos arquivos (permissão/corrupção)')
end

Then('o sistema exibe “Não foi possível carregar o arquivo <nome>. Verifique e tente novamente.”') do
  pending('TODO: implementar passo: Then o sistema exibe “Não foi possível carregar o arquivo <nome>. Verifique e tente novamente.”')
end

And('a importação completa não é iniciada') do
  pending('TODO: implementar passo: And a importação completa não é iniciada')
end

Given('Ana analisou o resumo de registros a importar') do
  pending('TODO: implementar passo: Given Ana analisou o resumo de registros a importar')
end

When('decide cancelar') do
  pending('TODO: implementar passo: When decide cancelar')
end

Then('nenhum dado do SIGAA é gravado na base') do
  pending('TODO: implementar passo: Then nenhum dado do SIGAA é gravado na base')
end

And('o sistema registra o cancelamento e mantém a base sem alterações') do
  pending('TODO: implementar passo: And o sistema registra o cancelamento e mantém a base sem alterações')
end
