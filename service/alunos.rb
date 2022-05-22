# frozen_string_literal: true

module API
  module Rest
    class Pism
      include HTTParty

      headers 'Content-Type' => 'application/json'
      default_timeout 240

      def consulta_aluno(uri)
        base_uri = uri
        self.class.get(base_uri, body: {})
      end
    end
  end
end
