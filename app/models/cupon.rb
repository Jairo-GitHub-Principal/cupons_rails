class Cupon < ApplicationRecord
     attr_accessor :nova_data_de_criacao
    def valido?
       return false if validade.nil?

        horas_passadas = ((Time.current - created_at) / 1.hour).round # subtrai a data atual da data de criação, e arredonda para baixo ou para cima
        horas_validade = validade * 24

        horas_passadas <= horas_validade
        
    end

     def dias_restantes
        return 0 if validade.nil?

        horas_passadas = ((Time.current - created_at) / 1.hour).round
        horas_validade = validade * 24

        horas_restantes = horas_validade - horas_passadas
        dias = (horas_restantes / 24.0).ceil

        dias > 0 ? dias : 0
    end
end
