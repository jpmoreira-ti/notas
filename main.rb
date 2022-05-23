# frozen_string_literal: true

require_relative 'lib/env'
require_relative 'service/alunos'
require_relative 'commons/arquivos'

letras = LETTERS['letras']
@alunos = OpenStruct.new

letras.each do |i|
  @alunos.response = API::Rest::Pism.new.consulta_aluno(i)

  next unless @alunos.response.code.eql?(200)

  dados = @alunos.response.split('data')[22][4..-2572].to_s
  alunos = dados.nil? ? '' : dados.split(',')
  Arquivos.carrega_csv(alunos)

  (0..alunos.count).each do |j|
    next unless alunos[j].nil? ? '' : alunos[j].split(':')[0][2..-2].to_s.eql?('nome')

    @dados = {}
    @dados = { nome: alunos[j].nil? ? '' : alunos[j].split(':')[1][1..-2].to_s, inscricao: alunos[j + 1].nil? ? '' : alunos[j + 1].split(':')[1][1..-2].to_s, nota_ponderada: alunos[j + 2].nil? ? '' : alunos[j + 2].split(':')[1][1..-2].to_f }
    puts @dados
    #Arquivos.carrega_excel(j, @dados)
  end
end
