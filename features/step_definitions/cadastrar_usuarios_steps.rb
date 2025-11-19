# frozen_string_literal: true

# Passos gerados a partir de cadastrar_usuarios.feature. Substitua os pendings pela automação real.

Given('o administrador {string} está autenticado') do |ana|
  pending('TODO: implementar passo: Given o administrador "Ana" está autenticado')
end

And('possui credenciais válidas para consultar o SIGAA') do
  pending('TODO: implementar passo: And possui credenciais válidas para consultar o SIGAA')
end

And('há novos participantes na turma {string} ainda sem acesso ao CAMAAR') do |metodologias_ativas_2024|
  pending('TODO: implementar passo: And há novos participantes na turma "Metodologias Ativas 2024" ainda sem acesso ao CAMAAR')
end

Given('Ana acessa o menu {string}') do |importar_usu_rios_do_sigaa|
  pending('TODO: implementar passo: Given Ana acessa o menu "Importar usuários do SIGAA"')
end

When('seleciona a turma {string} e inicia a importação') do |metodologias_ativas_2024|
  pending('TODO: implementar passo: When seleciona a turma "Metodologias Ativas 2024" e inicia a importação')
end

Then('o sistema lista os novos participantes encontrados') do
  pending('TODO: implementar passo: Then o sistema lista os novos participantes encontrados')
end

And('ao confirmar, envia e-mails com link para definição de senha') do
  pending('TODO: implementar passo: And ao confirmar, envia e-mails com link para definição de senha')
end

And('registra o status “Solicitação enviada” para cada participante') do
  pending('TODO: implementar passo: And registra o status “Solicitação enviada” para cada participante')
end

Given('Ana tenta importar participantes') do
  pending('TODO: implementar passo: Given Ana tenta importar participantes')
end

When('ocorre erro de autenticação ou comunicação com o SIGAA') do
  pending('TODO: implementar passo: When ocorre erro de autenticação ou comunicação com o SIGAA')
end

Then('o sistema exibe “Não foi possível acessar o SIGAA. Verifique credenciais ou tente mais tarde.”') do
  pending('TODO: implementar passo: Then o sistema exibe “Não foi possível acessar o SIGAA. Verifique credenciais ou tente mais tarde.”')
end

And('nenhuma solicitação de senha é disparada') do
  pending('TODO: implementar passo: And nenhuma solicitação de senha é disparada')
end

Given('a importação retornou usuários válidos') do
  pending('TODO: implementar passo: Given a importação retornou usuários válidos')
end

When('o envio de e-mail falha para alguns participantes') do
  pending('TODO: implementar passo: When o envio de e-mail falha para alguns participantes')
end

Then('o sistema informa quais usuários não receberam a solicitação') do
  pending('TODO: implementar passo: Then o sistema informa quais usuários não receberam a solicitação')
end

And('oferece ação “Reenviar” para tentar novamente') do
  pending('TODO: implementar passo: And oferece ação “Reenviar” para tentar novamente')
end

Given('Ana visualiza a prévia de participantes importados') do
  pending('TODO: implementar passo: Given Ana visualiza a prévia de participantes importados')
end

When('decide cancelar a operação') do
  pending('TODO: implementar passo: When decide cancelar a operação')
end

Then('a importação é abortada') do
  pending('TODO: implementar passo: Then a importação é abortada')
end

And('nenhuma solicitação de senha é enviada') do
  pending('TODO: implementar passo: And nenhuma solicitação de senha é enviada')
end
