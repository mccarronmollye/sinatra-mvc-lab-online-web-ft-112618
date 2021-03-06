class PigLatinizer

  def piglatinize(input)
    input.split(" ").length == 1 ? piglatinize_word(input) : piglatinize_sentence(input)
  end

  private

  def consonant(char)
    !char.match(/[aAeEiIoOuU]/)
  end

  def piglatinize_word(word) # word starts with vowel
    if !consonant(word[0])
      word = word + "w"
    elsif consonant(word[0]) && consonant(word[1]) && consonant(word[2])# word starts with 3 consonants
      word = word.slice(3..-1) + word.slice(0,3)
    elsif consonant(word[0]) && consonant(word[1])# word starts with 2 consonants
      word = word.slice(2..-1) + word.slice(0,2)
    else
      word = word.slice(1..-1) + word.slice(0)# word starts with 1 consonant
    end
    word << "ay"
  end

  def piglatinize_sentence(sentence)
    sentence.split.collect { |word| piglatinize_word(word) }.join(" ")
  end




end
