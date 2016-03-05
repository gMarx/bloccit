module RandomData

  def self.random_paragraph
    sentences = []
    rand(4..6).times do
      sentences << random_sentence
    end

    sentences.join(' ')
  end

  def self.random_sentence
    words = []
    rand(5..9).times do
      words << random_word
    end
    words.join(' ').capitalize << '.'
  end

  def self.random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(5..9)].join
  end

  def self.random_name
    first_name = random_word.capitalize
    last_name = random_word.capitalize
    "#{first_name} #{last_name}"
  end

  def self.random_email
    "#{random_word}@#{random_word}.#{random_word}"
  end
end
