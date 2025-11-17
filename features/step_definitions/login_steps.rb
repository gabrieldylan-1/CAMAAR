Given("que estou na tela de login") do
  pending "Implemente a navegação até a tela /login com Capybara"
end

Given("existe um {word} cadastrado com email {string} e senha {string}") do |perfil, email, senha|
  pending <<~MSG
    Cadastre (ou faça stub) o #{perfil} com email #{email} e senha #{senha}.
    Utilize os modelos reais para garantir autenticação consistente.
  MSG
end

Given("a conta excedeu o número máximo de tentativas") do
  pending "Configure o estado do usuário como bloqueado para simular lockout"
end

When("informo o email {string} e a senha {string}") do |email, senha|
  pending <<~MSG
    Preencha os campos de login com email=#{email} e senha=#{senha} usando Capybara.
  MSG
end

When("confirmo o envio do formulário") do
  pending "Clique no botão Entrar e aguarde a resposta da aplicação"
end

Then("devo ser direcionado para o painel do {word}") do |perfil|
  pending "Valide a URL/redirecionamento conforme o dashboard do perfil #{perfil}"
end

Then("devo ver a mensagem {string}") do |mensagem|
  pending "Asserte que o texto '#{mensagem}' está visível na página"
end

Then("devo continuar na tela de login") do
  pending "Certifique-se de que a URL/perfil atual continua sendo /login"
end

Then("devo ver a mensagem de erro {string}") do |mensagem|
  pending "Busque por banners/toasts exibindo '#{mensagem}'"
end

Then("os campos devem ser destacados como inválidos") do
  pending "Use seletores CSS para checar se inputs possuem classes de erro"
end
