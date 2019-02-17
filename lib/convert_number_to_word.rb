require 'date'

class ConvertNumberToWord

  def calculate_possibilities(digits)
    start_time = Time.now()
    return [] if digits.nil? || digits.length != 10 || digits.split('').select{|a|(a.to_i == 0 || a.to_i == 1)}.length > 0
    data = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}

    dictionary = {}

    file_path = "../public/input.txt"
    File.foreach( file_path ) do |word|
      dictionary[word.length] = dictionary.fetch(word.length, []) << word.chop.to_s.downcase
    end

    keys = digits.chars.map{|digit|data[digit]}

    results = {}
    total_number = keys.length - 1
    for i in (2..total_number - 2)
      first_array = keys[0..i]
      next if first_array.length < 3
      second_array = keys[i + 1..total_number]
      next if second_array.length < 3
      first_set = first_array.shift.product(*first_array).map(&:join) 
      next if first_set.nil?
      second_set = second_array.shift.product(*second_array).map(&:join)
      next if second_set.nil?
      results[i] = [(first_set & dictionary[i+2]), (second_set & dictionary[total_number - i +1])] 
    end

    resultant_words = []
    results.each do |key, probabilities|
      next if probabilities.first.nil? || probabilities.last.nil?
      probabilities.first.product(probabilities.last).each do |probability_words|
        resultant_words << probability_words
      end
    end

    resultant_words << (keys.shift.product(*keys).map(&:join) & dictionary[11]).join(", ")
    end_time = Time.now()
    puts "Time taken to run #{end_time.to_f - start_time.to_f}"
    resultant_words
  end

end

first_word = ConvertNumberToWord.new().calculate_possibilities("6686787825")
second_word = ConvertNumberToWord.new().calculate_possibilities("2282668687")
print first_word
print second_word
