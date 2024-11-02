class Animal < ApplicationRecord

      #Garante que os atributos não sejam nulos.
      validates :nome, presence: true
      validates :sexo, presence: true
      validates :especie, presence: true
      validates :raca, presence:true
end
