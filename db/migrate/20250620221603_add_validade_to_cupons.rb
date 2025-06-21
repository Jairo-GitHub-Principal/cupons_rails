class AddValidadeToCupons < ActiveRecord::Migration[7.1]
  def change
    add_column :cupons, :validade, :integer
  end
end
