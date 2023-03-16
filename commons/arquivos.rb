class Arquivos
  def self.carrega_csv(param)
    data_csv = "#{File.expand_path('../', File.dirname(__FILE__))}/data/pism1/NotasPism1.csv"

    File.delete(data_csv) if File.exist?(data_csv)
    File.open(data_csv, 'w+') do |out|
      out.puts param
      out.close
    end
  end

  def self.carrega_excel(letra, dados_aluno, conta_aluno)
    data_xls = "#{File.expand_path('../', File.dirname(__FILE__))}/data/pism1/Notas_#{letra}.xls"

    Spreadsheet.client_encoding = 'UTF-8'
    format = Spreadsheet::Format.new color: :black,
                                     weight: :bold,
                                     size: 14
    book = ''
    sheet = ''
    if File.exist?(data_xls)
      book = Spreadsheet.open data_xls
      sheet = book.worksheet "Notas"
    else
      book = Spreadsheet::Workbook.new
      sheet = book.create_worksheet name: "Notas"
      sheet.row(0).concat %w[NOME INSCRICAO NOTA_PONDERADA]
      sheet.row(0).default_format = format
    end
    sheet[conta_aluno, 0] = dados_aluno[:nome]
    sheet[conta_aluno, 1] = dados_aluno[:inscricao]
    sheet[conta_aluno, 2] = dados_aluno[:nota_ponderada]
    book.write data_xls
    puts "Aluno #{conta_aluno} salvo!"
  end
end
