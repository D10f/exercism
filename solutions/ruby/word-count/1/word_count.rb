class Phrase

  DELIMITERS   = /[^a-zA-Z0-9'\\]+/
  CONTRACTIONS = /(?:ain|aren|can|couldn|didn|doesn|don|he|here|he|how|i|isn|it|let|ma|mustn|she|shouldn|that|there|they|wasn|we|weren|what|when|where|who|won|wouldn|y|you)'(?:all|am|d|ll|m|re|s|t|ve)/

  attr_reader :word_count

  def initialize(phrase)
    self.word_count = Hash.new(0)
    phrase.downcase.split(DELIMITERS) { |word| normalize(word.strip) }
  end
  
  private

  attr_writer :word_count

  def normalize(str)
    key = str.gsub(/\\([nstr])/, '\1')
             .gsub(/^['"](.*)['"]$/, '\1')
    key = key.gsub('\'', '') if not str.match(CONTRACTIONS)

    return if key.empty?

    word_count[key] += 1
  end
end
