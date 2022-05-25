class Arquivos
  def self.carrega_csv(param)
    File.delete(DATA_CSV) if File.exist?(DATA_CSV)
    File.open(DATA_CSV, 'w+') do |out|
      out.puts param
      out.close
    end
  end

  def self.carrega_excel(letra, dados_aluno, conta_aluno)
    Spreadsheet.client_encoding = 'UTF-8'
    format = Spreadsheet::Format.new color: :black,
                                     weight: :bold,
                                     size: 14
    book = ''
    sheet = ''
    if File.exist?(DATA_CONVERTED)
      book = Spreadsheet.open DATA_CONVERTED
      sheet = book.worksheet letra
      if sheet.name != letra
        book = Spreadsheet::Workbook.new
        sheet = book.create_worksheet name: letra
        sheet.row(0).concat %w[NOME INSCRICAO NOTA_PONDERADA]
        sheet.row(0).default_format = format
      end
    else
      book = Spreadsheet::Workbook.new
      sheet = book.create_worksheet name: letra
      sheet.row(0).concat %w[NOME INSCRICAO NOTA_PONDERADA]
      sheet.row(0).default_format = format
    end
    sheet[conta_aluno, 0] = dados_aluno[:nome]
    sheet[conta_aluno, 1] = dados_aluno[:inscricao]
    sheet[conta_aluno, 2] = dados_aluno[:nota_ponderada]
    book.write DATA_CONVERTED
  end
end
