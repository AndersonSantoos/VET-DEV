class Consulta < ApplicationRecord
        #Garante que os atributos não sejam nulos.
        validates :data_hora, presence: true
        validates :sintomas, presence: true
end
