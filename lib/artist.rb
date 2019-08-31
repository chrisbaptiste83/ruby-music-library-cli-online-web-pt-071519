class Artist 
    extend Concerns::Findable
    attr_accessor :name 
    attr_reader :songs
    @@all =[] 
   
    
    def initialize(name) 
    @name = name 
    @songs=[]
    end 
    
    def self.all 
    @@all 
    end 
    
    def songs 
      @songs 
    end 
    
    def save 
    @@all << self 
    self
    end 
    
    def self.destroy_all 
      @@all.clear 
    end 
    
    def add_song(song) 
      song.artist = self unless song.artist 
      @songs << song unless @songs.include?(song)
    end 
    
    def self.create(name)
        artist = Artist.new(name)
        @@all << artist
        artist
        end 


   def genres 
    songs.collect do |song| song.genre 
    end.uniq 
   end 

    
    end 
 