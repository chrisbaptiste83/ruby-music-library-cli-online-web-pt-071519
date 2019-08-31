class Song  

attr_accessor :name 
attr_reader :artist, :genre 
@@all =[]

def initialize(name, artist=nil, genre=nil) 
 self.artist = artist 
@name = name 
self.genre = genre 

end 

def self.all 
@@all 
end 

def save 
@@all << self 
end 

def self.destroy_all 
  @@all.clear 
end 

def self.create(name)
song = Song.new(name)
@@all << song
song 
end 

def artist=(artist) 
  @artist=artist
  artist.add_song(self) if artist
end 

def genre=(genre) 
  @genre= genre
  genre.add_song(self) if genre
end 

def self.find_by_name(name) 
  self.all.find do |song| song.name == name 
  end 
end 

def self.find_or_create_by_name(name) 
  self.find_by_name(name) || self.create(name)
end 

def self.new_from_filename(filename) 
   split_file = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(split_file[0])
    genre = Genre.find_or_create_by_name(split_file[2])
    self.new(split_file[1], artist, genre)
  end 
  
def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end 
  
end 
 
   