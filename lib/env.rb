require 'pry'
require 'pry-nav'
require 'rubocop'
require 'httparty'
require 'active_support'
require 'spreadsheet'

DATA_CSV = "#{File.expand_path('../', File.dirname(__FILE__))}/data/NotasPism1.csv"
DATA_CONVERTED = "#{File.expand_path('../', File.dirname(__FILE__))}/data/NotasPism1.xls"
