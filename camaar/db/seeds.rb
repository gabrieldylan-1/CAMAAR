# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

##### SEED PARA FEATURE/DADOS #####

# Criação ou atualização do usuário admin (idempotente)
admin = Usuario.find_or_initialize_by(email: 'admin@unb.br')
admin.assign_attributes(
  nome: 'ADMIN',
  formacao: 'DOUTORADO',
  ocupacao: 'docente',
  num_usuario: 83807519422,
  e_admin: true,
  esta_ativo: true,
  password: ENV.fetch('SENHA_ADMIN_CAMAAR', 'Admin@1234!'),
  departamento: 'DEPTO CIÊNCIAS DA COMPUTAÇÃO'
)

if admin.save
  puts "Usuário admin pronto! (id=#{admin.id})"
else
  puts "Falha ao criar/atualizar o usuário admin: #{admin.errors.full_messages.join(', ')}"
end

##### SEEDS PARA FEATURE/LOGIN #####

aluno = Usuario.find_or_initialize_by(email: 'aluno.teste@exemplo.com')
aluno.assign_attributes(
  nome: 'Aluno de Teste',
  formacao: 'GRADUAÇÃO',
  ocupacao: 'discente',
  num_usuario: 11223344556,
  matricula: 123456789,
  departamento: 'DEPTO CIÊNCIAS DA COMPUTAÇÃO',
  curso: 'Ciência da Computação',
  password: 'Senha@1234!',
  password_confirmation: 'Senha@1234!',
  e_admin: false,
  esta_ativo: false
)

aluno.save!
puts "Usuário comum pronto! (id=#{aluno.id})"

##### SEEDS PARA FEATURE/RESPOSTA #####

# dados de teste para formulario
# 0) template padrao (idempotente)
tm = Template.find_or_initialize_by(nome: 'Template Padrao')
tm.data_versao ||= Date.current
tm.save!
puts "Template: #{tm.id} (v#{tm.data_versao})"

# 1) usuario de teste
u = Usuario.find_or_initialize_by(email: 'teste@unb.br')
u.assign_attributes(
  nome:            'prof unb teste',
  formacao:        'graduacao',
  ocupacao:        'docente',
  num_usuario:     99_999_999_999,
  matricula:       '20250001',
  departamento:    'CIENCIAS DA COMPUTACAO',
  password_digest: BCrypt::Password.create('Senha@1234!'),
  esta_ativo:      true,
  e_admin:         false
)
u.save!(validate: false)
puts "usuario de teste: #{u.id}"

# 2) disciplina
d = Disciplina.find_or_create_by!(codigo: 'DISC-01') do |disc|
  disc.nome = 'Estrutura de Dados'
end

# 3) turma
t = Turma.find_or_create_by!(codigo: 'T1', semestre: '2025-1') do |turma|
  turma.horario    = 'Seg 10:00-12:00'
  turma.disciplina = d
end

# 4) associacao usuario turma
unless u.turmas.include?(t)
  u.turmas << t
end

# 5) formulario
f = Formulario.find_or_create_by!(turma: t) do |form|
  form.data_criacao = Time.current
end
puts "Formulario: #{f.id} (Turma #{t.codigo})"

# 6) questoes
Questao.find_or_create_by!(formulario: f, template: tm, num_questao: 1) do |q|
  q.tipo      = 'Texto'
  q.enunciado = 'Como voce avalia este teste?'
end

q2 = Questao.find_or_create_by!(formulario: f, template: tm, num_questao: 2) do |q|
  q.tipo      = 'Radio'
  q.enunciado = 'Voce gostou do formulario?'
end

# 7) opcoes de multipla escolha
[
  { questao: q2, num_opcao: 1, texto_opcao: 'Sim' },
  { questao: q2, num_opcao: 2, texto_opcao: 'Nao' }
].each do |attrs|
  Opcao.find_or_create_by!(attrs)
end

# adiciona mais formularios pra responder (idempotente: garante pelo menos 6 no total)

# carregue as instancias de turma e template
turma    = Turma.first
template = Template.first

formularios_da_turma = Formulario.where(turma: turma)

(formularios_da_turma.count...6).each do |i|
  formulario = Formulario.create!(
    turma:        turma,
    data_criacao: Time.current + i.days
  )

  # questao de texto
  Questao.create!(
    formulario:  formulario,
    template:    template,
    num_questao: 1,
    tipo:        'Texto',
    enunciado:   "pergunta aberta #{i + 1}"
  )

  # questao de radio
  questao_radio = Questao.create!(
    formulario:  formulario,
    template:    template,
    num_questao: 2,
    tipo:        'Radio',
    enunciado:   "pergunta multipla #{i + 1}"
  )

  # opcoes para a questao de radio
  %w[opcao_a opcao_b].each_with_index do |texto, idx|
    Opcao.create!(
      questao:    questao_radio,
      num_opcao:  idx + 1,
      texto_opcao: texto
    )
  end

  puts "formulario ##{formulario.id} criado com 2 questoes"
end

# exiba quantos formularios existem na turma
total = Formulario.where(turma: turma).count
puts "total de formularios na turma #{turma.id}: #{total}"

puts 'fluxo de seed para formularios carregado com sucesso'


##### SEEDS PARA FEATURE/TEMPLATE #####

# Criação de templates de exemplo
exemplos = [
  { nome: 'Avaliação Docente 2024.1', data_versao: Time.now },
  { nome: 'Feedback de Curso - Computação', data_versao: Time.now - 1.day },
  { nome: 'Pesquisa de Satisfação', data_versao: Time.now - 2.days }
]

exemplos.each do |attrs|
  Template.find_or_create_by!(nome: attrs[:nome]) do |t|
    t.data_versao = attrs[:data_versao]
  end
end

# Criação de template para testes cucumber
unless Template.exists?(nome: 'Formulário de opinião')
  template2 = Template.create!(nome: 'Formulário de opinião')
  template2.questaos.create!(num_questao: 1, tipo: 'Texto', enunciado: 'O que você achou da disciplina?')
  template2.questaos.create!(num_questao: 2, tipo: 'Texto', enunciado: 'Sugestões para o professor')
end

puts 'Templates de exemplo criados!'

#### SEEDS PARA FEATURE/FORMULARIO ####

# Cria 2 respostas para 1 formulário (criado acima)

# cria uma resposta ao formulário f
resposta = RespostaFormulario.create!(
  formulario: f,
  data_resposta: Time.current
)

# adiciona resposta à questão 1 (num_questao: 1)
resposta.resposta_questaos.create!(
  num_questao: 1,
  texto_resposta: 'Bom'
)

# adiciona resposta à questão 2 (num_questao: 2)
resposta.resposta_questaos.create!(
  num_questao: 2,
  texto_resposta: 'Sim'
)

puts "Resposta criada para o formulário ##{f.id}: [Bom, Sim]"
