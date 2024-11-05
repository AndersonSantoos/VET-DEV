class RemoveTokenFromVeterinarios < ActiveRecord::Migration[7.2]
  def change
    remove_column :veterinarios, :token, :string
  end
end
