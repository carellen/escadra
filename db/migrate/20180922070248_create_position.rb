class CreatePosition < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :title
      t.jsonb :attributes
      t.references :company, foreign_key: true

      t.index [:title, :company_id], unique: true
    end
  end
end
