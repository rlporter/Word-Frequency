class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with']

  def initialize(filename)
    #read the file provided
    wordfreq = File.read(filename)
    #remove punctuation & normalize to lc
    normalize_text = wordfreq.downcase.gsub(/[^A-Za-z0-9\s]/i, '')
    #remove stop words
    words = normalize_text.gsub!('STOP_WORDS', '')
  end
#iterate thru file and count times word is used
  def frequency(word)
    counts = Hash.new (0)
    words.each do |word|
      counts[word] += 1
      words.each_with_object(Hash.new(0)) { |word,count| count[word] += 1 }

end
  end

  def frequencies
    sorted_words = words.sort_by {|word, count| count}
  end

  def top_words(number)

  end

  def print_report
  end
end

if __FILE__ == $0
  filename = ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      wf = Wordfreq.new(full_filename)
      wf.print_report
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end
end
