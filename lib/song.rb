require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
  song = self.create
  song.name = name
  song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song_name|
      song_name.name == name
    end
  end


  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name)

    if found_song
      found_song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by(&:name)
  end

  def self.new_from_filename(file_name)
    artist_name = file_name.split(" ").delete_at(0)
    name = file_name.split(" - ").slice(-1).gsub(".mp3", "")

    song = self.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
