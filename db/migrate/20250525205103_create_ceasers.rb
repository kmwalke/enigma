class CreateCeasers < ActiveRecord::Migration[8.0]
  def change
    create_table :ceasers do |t|
      t.integer :shift
    end
  end
end
