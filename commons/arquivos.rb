class Arquivos
  def self.carrega_csv(param)
    File.delete(DATA_CSV) if File.exist?(DATA_CSV)
    File.open(DATA_CSV, 'w+') do |out|
      out.puts param
      out.close
    end
  end

  def self.carrega_excel(letra, dados)
    workbook = FastExcel.open(DATA_CONVERTED, constant_memory: true)
    workbook.default_format.set(
      font_size: 0, # user's default
      font_family: 'Arial'
    )
    worksheet = workbook.add_worksheet(letra)
    worksheet.append_row(%w[nome inscricao nota_ponderada])
    worksheet.append_row([dados[:nome], dados[:inscricao], dados[:nota_ponderada]])
    workbook.close
  end
end
