# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SONGS = ['All Star', 'Somebody Told Me', 'Down With the Sickness', 'Dads']
ALBUMS = ['spacelounge', 'Hot Fuzz', 'Dads Single', 'Asylum']
USERNAMES = %w[ballen lluthor bwayne ckent tstark]
PLAYLISTS = %w[road workout evil_themes party]
PASSWORD = 'secret'

ALBUMS.each { |a| Album.create(name: a) }
SONGS.each { |s| Song.create(name: s, album_id: Album.pluck(:id).sample) }
USERNAMES.each { |un| User.create(username: un, password: PASSWORD) }
PLAYLISTS.each do |pl|
  playlist = User.all.sample.playlists.create(name: pl)
  3.times { playlist.songs << Song.all.sample }
end


