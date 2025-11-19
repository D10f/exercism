class LogLineParser
  
  def initialize(line)
    @line = line
  end

  private def split_message
    level, msg = @line.split(":")
    return level.gsub(/[\[\]]/, ''), msg.strip()
  end

  def message
    split_message()[1]
  end

  def log_level
    split_message()[0].downcase
  end

  def reformat
    level, msg = split_message
    return "#{msg} (#{level.downcase})"
  end
end
