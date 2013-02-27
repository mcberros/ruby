class Armory

  def initialize()

    @dialogue_msg={}

    @dialogue_msg[:entry] = <<ENTRY
    You do a dive roll into the Weapon Armory, crouch and scan the room
    for more Gothons that might be hiding.  It's dead quiet, too quiet.
    You stand up and run to the far side of the room and find the
    neutron bomb in its container.  There's a keypad lock on the box
    and you need the code to get the bomb out.  If you get the code
    wrong 10 times then the lock closes forever and you can't
    get the bomb.  The code is 3 digits.
ENTRY

    @dialogue_msg[:fail_guess] = %{BZZZZEDDD}

    @dialogue_msg[:ok_code] = <<OK_CODE
    The container clicks open and the seal breaks, letting gas out.
    You grab the neutron bomb and run as fast as you can to the
    bridge where you must place it in the right spot.
OK_CODE

    @dialogue_msg[:fail_code] = <<FAIL_CODE
    The lock buzzes one last time and then you hear a sickening
    melting sound as the mechanism is fused together.
    You decide to sit there, and finally the Gothons blow up the
    ship from their ship and you die.
FAIL_CODE

  end

  def execute()
    puts @dialogue_msg[:entry]
    code = "%s%s%s" % [rand(9)+1, rand(9)+1, rand(9)+1]
    puts "trampa #{code}"
    print "[keypad]> "
    guess = gets.chomp()
    guesses = 1

    while guess != code and guesses < 10
      puts @dialogue_msg[:fail_guess]
      guesses += 1
      print "[keypad]> "
      guess = gets.chomp()
    end

    if guess == code
      puts @dialogue_msg[:ok_code]
      return :bridge
    else
      puts @dialogue_msg[:fail_code]
      return :death
    end
  end
end



