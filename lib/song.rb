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
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name_string)
    song = self.new
    song.name = name_string
    song
  end

  def self.create_by_name(name_string)
    song = self.new_by_name(name_string)
    @@all << song
    song
  end

  def self.find_by_name(name_string)
    result =@@all.find {|song| song.name.include?(name_string)}
    result
  end

  def self.find_or_create_by_name(name_string)
    song = self.find_by_name(name_string)
    if song
       song
    else
      self.create_by_name(name_string)
    end
  end

  def self.alphabetical
    @@all.sort_by!{|song| song.name}
  end

  def self.new_from_filename(file_name)
    #binding.pry
    mp3_arr = file_name.split(" - ")
    mp3_arr[1] =mp3_arr[1].delete_suffix('.mp3')
    song = self.new
    song.name = mp3_arr[1]
    song.artist_name = mp3_arr[0]

    song
  end

  def self.create_from_filename(file_name)

    @@all << self.new_from_filename(file_name)

  end

  def self.destroy_all

    @@all.clear

  end


end
