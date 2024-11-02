class Veterinario < ApplicationRecord

    #Garante que os atributos sejam únicos.
    validates :email, uniqueness: true
    validates :crmv, uniqueness:true

    #Garante que os atributos não sejam nulos.
    validates :nome, presence: true
    validates :email, presence: true
    validates :crmv, presence:true
end
