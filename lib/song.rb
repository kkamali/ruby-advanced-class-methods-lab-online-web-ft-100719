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
    song = self.new 
    song.name = name 
    song
  end 
  
  def self.create_by_name(name)
    song = self.new
    song.name = name 
    self.all << song 
    song
  end
  
  def self.find_by_name(name)
    self.all.each{|song| return song if song.name == name}
    nil 
  end 
  
  def self.find_or_create_by_name(name) 
    found = find_by_name(name)
    if found == nil
      return create_by_name(name)
    else 
      return found 
    end 
  end
  
  def self.alphabetical 
    self.all.sort_by{|song| song.name }
  end 
  
  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song = self.new 
    song_name = song_array[1].slice!(".mp3")
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end
  
  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    self.all << song 
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
