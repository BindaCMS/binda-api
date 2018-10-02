class CreateBindaApiTables < ActiveRecord::Migration[5.0]
  def change
    create_table :binda_api_users do |t|
      t.string :name, null: false
      t.string :api_key, index: true, unique: true
      t.timestamps
    end

    create_table :binda_api_authorizations do |t|
      t.integer :api_user_id, index: true
      t.integer :structure_id, index: true
      t.timestamps
    end
  end
end

