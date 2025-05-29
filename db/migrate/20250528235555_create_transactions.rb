class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.string :title
      t.decimal :amount
      t.string :category
      t.date :occurred_on
      t.text :notes

      t.timestamps
    end
  end
end
