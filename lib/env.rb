require 'pry'
require 'rubocop'
require 'remote_table'
require 'addressable/uri'
require 'httparty'
require 'fast_excel'
require 'active_support'

URL = YAML.load_file("#{File.expand_path('../', File.dirname(__FILE__))}/config/urls.yml")
ENDPOINT = YAML.load_file("#{File.expand_path('../', File.dirname(__FILE__))}/config/endpoints.yml")
DATA_CSV = "#{File.expand_path('../', File.dirname(__FILE__))}/data/notas.csv"
DATA_CONVERTED = "#{File.expand_path('../', File.dirname(__FILE__))}/data/notas_finais.xlsx"
LETTERS = YAML.load_file("#{File.expand_path('../', File.dirname(__FILE__))}/commons/letras.yml")
