class CreateUserPlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :user_playlists do |t|
      t.references :user, foreign_key: true
      t.references :playlist, foreign_key: true
    end
  end
end
