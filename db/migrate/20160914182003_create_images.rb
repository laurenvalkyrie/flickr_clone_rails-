class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.column :user_id, :integer
      t.column :caption, :string


    end
  end
end
