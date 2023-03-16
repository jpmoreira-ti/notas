# frozen_string_literal: true

require_relative 'lib/env'
require_relative 'service/pism'
require_relative 'commons/arquivos'

letras = %w[C D E F G H I J K L M N O P Q R S T U W X Y Z]
@alunos = OpenStruct.new
@dados = {}
@conta_aluno = 0

letras.each do |i|
  @alunos.response = Pism.consulta_aluno(i)
  next unless @alunos.response.code.eql?(200)

  dados = @alunos.response.split('data')[22][4..-2572].to_s
  alunos = dados.nil? ? '' : dados.split(',')

  Arquivos.carrega_csv(alunos)

  (0..alunos.count - 1).each do |j|
    next unless alunos[j].nil? ? 'N/A' : alunos[j].split(':')[0][2..-2].to_s.eql?('nome')

    @conta_aluno += 1
    @dados = { nome: alunos[j].nil? ? 'N/A' : alunos[j].split(':')[1][1..-2].to_s, inscricao: alunos[j + 1].nil? ? 'N/A' : alunos[j + 1].split(':')[1][1..-2].to_s, nota_ponderada: alunos[j + 2].nil? ? 'N/A' : alunos[j + 2].split(':')[1].to_f }
    puts @dados
    Arquivos.carrega_excel(i, @dados, @conta_aluno)
  end
end
