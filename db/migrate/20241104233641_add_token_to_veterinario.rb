class AddTokenToVeterinario < ActiveRecord::Migration[7.2]
  def change
    add_column :veterinarios, :token, :string
  end
end
