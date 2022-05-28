require 'pry'
require 'pry-nav'
require 'rubocop'
require 'httparty'
require 'active_support'
require 'spreadsheet'

URL = YAML.load_file("#{File.expand_path('../', File.dirname(__FILE__))}/config/urls.yml")
ENDPOINT = YAML.load_file("#{File.expand_path('../', File.dirname(__FILE__))}/config/endpoints.yml")
DATA_CSV = "#{File.expand_path('../', File.dirname(__FILE__))}/data/NotasPism1.csv"
DATA_CONVERTED = "#{File.expand_path('../', File.dirname(__FILE__))}/data/NotasPism1.xls"
