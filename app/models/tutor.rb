class Tutor < ApplicationRecord

        #Garante que os atributos sejam únicos.
        validates :cpf, uniqueness: true

        #Garante que os atributos não sejam nulos.
        validates :nome, presence: true
        validates :email, presence: true
        validates :cpf, presence: true
end
