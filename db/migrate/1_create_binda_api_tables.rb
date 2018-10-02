class CreateBindaApiTables < ActiveRecord::Migration[5.0]
  def change
    create_table :binda_api_users do |t|
      t.string :name, null: false
      t.string :api_key, index: true, unique: true
      t.timestamps
    end

    create_table :binda_api_authorizations do |t|
      t.belongs_to :api_user
      t.belongs_to :structure
      t.timestamps
    end
  end
end

