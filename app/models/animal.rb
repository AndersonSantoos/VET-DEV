class Animal < ApplicationRecord
      #Relacionamento
      belongs_to :tutor
      has_many :consultas

      #Garante que os atributos não sejam nulos.
      validates :nome, presence: true
      validates :sexo, presence: true
      validates :especie, presence: true
      validates :raca, presence:true
end
