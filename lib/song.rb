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
    false
  end 
  
  def self.find_or_create_by_name(name)
    if find_by_name(name) != false 
      return find_by_name(name)
    end
    create_by_name(name)
  end
end
