class PrescricaoMedica < ApplicationRecord
    #Garante que os atributos não sejam nulos.
    validates :descricao, presence:true
end
