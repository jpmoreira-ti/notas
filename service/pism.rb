# frozen_string_literal: true

class Pism
  include HTTParty

  headers 'Content-Type' => 'application/json'
  default_timeout 240

  def self.consulta_aluno(endpoint)
    base_uri = "http://www4.vestibular.ufjf.br/2023/notaspism1/#{endpoint}.html"
    get(base_uri, body: {})
  end
end
