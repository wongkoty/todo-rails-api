class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.boolean :done
      t.references :list, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
