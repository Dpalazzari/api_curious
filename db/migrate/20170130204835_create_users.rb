class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :token
      t.string :avatar
      t.string :location
      t.integer :public_repos
      t.integer :public_gists
      t.integer :private_gists

      t.timestamps
    end
  end
end
