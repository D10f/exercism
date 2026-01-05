# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    return @age >= 60 ? 10.00 : 15.00
  end

  def watch_scary_movie?
    return @age >= 18
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    return @member ? '🍿' : raise(NotMovieClubMemberError)
  end
end
