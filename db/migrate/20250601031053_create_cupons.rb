class CreateCupons < ActiveRecord::Migration[7.1]
  def change
    create_table :cupons do |t|
      t.string :description
      t.string :url_image
      t.string :code_id

      t.timestamps
    end
  end
end
