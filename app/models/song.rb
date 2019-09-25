class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes=(content)
    note = Note.find_or_create_by(content: content)
    if !self.notes.include?(note)
      self.notes << note
    end
  end

  # def note_contents=(contents)
  #   contents.each do |content|
  #     c = Note.find_or_create_by(content: content)
  #     if !self.notes.include?(c)
  #       self.notes << Note.create(content: content)
  #     end
  #   end
  # end

  # def note_contents
  #   self.notes ? self.notes.content : nil
  # end
end
