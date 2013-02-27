class Pod

  def initialize()

    @dialogue_msg={}

    @dialogue_msg[:entry] = <<-ENTRY
    You rush through the ship desperately trying to make it to
    the escape pod before the whole ship explodes.  It seems like
    hardly any Gothons are on the ship, so your run is clear of
    interference.  You get to the chamber with the escape pods, and
    now need to pick one to take.  Some of them could be damaged
    but you don't have time to look.  There's 5 pods, which one
    do you take?
    ENTRY

  end

  def execute()
    puts @dialogue_msg[:entry]
    good_pod = rand(5)+1
    puts "trampa #{good_pod}"
    print "[pod #]>"
    guess = gets.chomp()

    if guess.to_i != good_pod
      @dialogue_msg[:bad_guess] = <<-BAD_GUESS 
      You jump into pod #{guess} and hit the eject button
      The pod escapes out into the void of space, then
      implodes as the hull ruptures, crushing your body
      into jam jelly.
      BAD_GUESS

      puts @dialogue_msg[:bad_guess]
      return :death
    else

      @dialogue_msg[:good_guess] = <<-GOOD_GUESS
      You jump into pod #{guess} and hit the eject button.
      The pod easily slides out into space heading to
      the planet below.  As it flies to the planet, you look
      back and see your ship implode then explode like a
      bright star, taking out the Gothon ship at the same
      time.  You won!
      GOOD_GUESS

      puts @dialogue_msg[:good_guess]
      return :win
    end
  end
end


