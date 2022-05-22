# frozen_string_literal: true

require_relative 'lib/env'
require_relative 'service/alunos'
require_relative 'service/arquivos'

letras = LETRAS['letras']
@aluno = OpenStruct.new

letras.each do |i|
  url = "#{URL['pism1']}/#{i}.html"
  @uri = Addressable::URI.parse(url).to_s
  @aluno.response = API::Rest::Pism.new.consulta_aluno(@uri)

  next unless @aluno.response.code.eql?(200)

  aluno = @aluno.response.to_s
  text = aluno.split('data')[22][4..-2550]

  Arquivos.carrega_csv(text)
  Arquivos.carrega_excel(i)
end
