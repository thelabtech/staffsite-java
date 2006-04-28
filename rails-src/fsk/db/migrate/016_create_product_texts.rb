class CreateProductTexts < ActiveRecord::Migration
  def self.up
    create_table :product_texts do |t|
      t.column :description, :text
      t.column :product_id, :integer
    end
  end

  def self.down
    drop_table :product_texts
  end
end
