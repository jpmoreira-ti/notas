require 'pry'
require 'rubocop'
require 'remote_table'
require 'addressable/uri'
require 'httparty'
require 'fast_excel'

URL = YAML.load_file("#{File.expand_path('../', File.dirname(__FILE__))}/config/urls.yml")
DATA_CSV = "#{File.expand_path('../', File.dirname(__FILE__))}/data/notas.csv"
DATA_EXCEL = "#{File.expand_path('../', File.dirname(__FILE__))}/data/notas.xlsx"
LETRAS = YAML.load_file("#{File.expand_path('../', File.dirname(__FILE__))}/data/letras.yml")
