class AddVeterinarioToConsultas < ActiveRecord::Migration[7.2]
  def change
    add_reference :consulta, :veterinario, null: true, foreign_key: true
  end
end
