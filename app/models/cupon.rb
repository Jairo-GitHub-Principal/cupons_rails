class Cupon < ApplicationRecord
    def valido?
       return false if validade.nil?

        horas_passadas = ((Time.current - created_at) / 1.hour).round # subtrai a data atual da data de criação, e arredonda para baixo ou para cima
        horas_validade = validade * 24

        horas_passadas <= horas_validade
        
    end
end
