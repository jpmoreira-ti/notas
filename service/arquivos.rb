class Arquivos
  def self.carrega_csv(param)
    File.open(DATA_CSV, 'w') do |f2|
      f2.puts param
    end
  end

  def self.carrega_excel(param)
    workbook = FastExcel.open(DATA_EXCEL, constant_memory: true)
    workbook.default_format.set(
      font_size: 0, # user's default
      font_family: 'Arial'
    )
    worksheet = workbook.add_worksheet(param)
    bold = workbook.bold_format
    worksheet.set_column(0, 0, FastExcel::DEF_COL_WIDTH, bold)
    worksheet.append_row(%w[nome inscricao totalPontos], bold)
    worksheet.append_row(['Hello', (rand * 10_000_000).round(2), Time.now])
  end
end
