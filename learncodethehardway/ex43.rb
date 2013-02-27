class Game

  MSG_CENTRAL_CORRIDOR=%q{
    The Gothons of Planet Percal #25 have invaded your ship and destroyed
    your entire crew.  You are the last surviving member and your last
    mission is to get the neutron destruct bomb from the Weapons Armory,
    put it in the bridge, and blow the ship up after getting into an 
    escape pod.
    \n
    You're running down the central corridor to the Weapons Armory when
    a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume
    flowing around his hate filled body.  He's blocking the door to the
    Armory and about to pull a weapon to blast you.
  }

  MSG_SHOOT=%q{
    Quick on the draw you yank out your blaster and fire it at the Gothon.
    His clown costume is flowing and moving around his body, which throws
    off your aim.  Your laser hits his costume but misses him entirely.  This
    completely ruins his brand new costume his mother bought him, which
    makes him fly into an insane rage and blast you repeatedly in the face until
    you are dead.  Then he eats you.
  }

  MSG_DODGE=%q{
    Like a world class boxer you dodge, weave, slip and slide right
    as the Gothon's blaster cranks a laser past your head.
    In the middle of your artful dodge your foot slips and you
    bang your head on the metal wall and pass out.
    You wake up shortly after only to die as the Gothon stomps on
    your head and eats you.
  }

  MSG_TELL_A_JOKE=%q{
    Lucky for you they made you learn Gothon insults in the academy.
    You tell the one Gothon joke you know:
    Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr.
    The Gothon stops, tries not to laugh, then busts out laughing and can't move.
    While he's laughing you run up and shoot him square in the head
    putting him down, then jump through the Weapon Armory door.
  }

  MSG_LASER_WEAPON_ARMORY= %q{
    You do a dive roll into the Weapon Armory, crouch and scan the room
    for more Gothons that might be hiding.  It's dead quiet, too quiet.
    You stand up and run to the far side of the room and find the
    neutron bomb in its container.  There's a keypad lock on the box
    and you need the code to get the bomb out.  If you get the code
    wrong 10 times then the lock closes forever and you can't
    get the bomb.  The code is 3 digits.
  }

  MSG_DOES_NOT_COMPUTE=%q{
    DOES NOT COMPUTE
  }

  MSG_FAIL_GUESS=%q{
    BZZZZEDDD
  }

  MSG_OK_CODE=%q{
    The container clicks open and the seal breaks, letting gas out.
    You grab the neutron bomb and run as fast as you can to the
    bridge where you must place it in the right spot.
  }

  MSG_FAIL_CODE=%q{
    The lock buzzes one last time and then you hear a sickening
    melting sound as the mechanism is fused together.
    You decide to sit there, and finally the Gothons blow up the
    ship from their ship and you die.
  }

  MSG_BRIDGE=%q{
  You burst onto the Bridge with the neutron destruct bomb
  under your arm and surprise 5 Gothons who are trying to
  take control of the ship.  Each of them has an even uglier
  clown costume than the last.  They haven't pulled their
  weapons out yet, as they see the active bomb under your
  arm and don't want to set it off.
  }

  MSG_THROW_THE_BOMB=%q{
    In a panic you throw the bomb at the group of Gothons
    and make a leap for the door.  Right as you drop it a
    Gothon shoots you right in the back killing you.
    As you die you see another Gothon frantically try to disarm
    the bomb. You die knowing they will probably blow up when
    it goes off.
  }

  MSG_SLOWLY_PLACE_THE_BOMB=%q{
    You point your blaster at the bomb under your arm
    and the Gothons put their hands up and start to sweat.
    You inch backward to the door, open it, and then carefully
    place the bomb on the floor, pointing your blaster at it.
    You then jump back through the door, punch the close button
    and blast the lock so the Gothons can't get out.
    Now that the bomb is placed you run to the escape pod to
    get off this tin can.
  }

  MSG_ESCAPE_POD=%q{
    You rush through the ship desperately trying to make it to
    the escape pod before the whole ship explodes.  It seems like
    hardly any Gothons are on the ship, so your run is clear of
    interference.  You get to the chamber with the escape pods, and
    now need to pick one to take.  Some of them could be damaged
    but you don't have time to look.  There's 5 pods, which one
    do you take?
  }

  def initialize(start)
    @quips=[
      "You died. You kinda such at this.",
      "Nice job, you died ...jackass.",
      "Such a luser.",
      "I have a small puppy that's better at this."
    ]

    @actions_corridor={
      :shoot => "shoot!",
      :dodge => "dodge!",
      :joke => "tell a joke"
    }

    @actions_bridge={
      :throw => "throw the bomb",
      :place => "slowly place the bomb"
    }

    @start = start
  end

  def prompt(available_actions)
    total_actions=available_actions.values.join(", ")
     
    print "> acciones posibles: #{total_actions}: "
  end

  def play()
    next_room = @start

    while true
      puts "\n"+("-" * 8)
      room = method(next_room)
      next_room = room.call()
    end
  end

  def death()
    puts @quips[rand(@quips.length())]
    Process.exit(1)
  end

  def central_corridor()
    
    puts MSG_CENTRAL_CORRIDOR

    prompt(@actions_corridor)
    action = gets.chomp()

    if action ==  @actions_corridor[:shoot]
      puts MSG_SHOOT
      return :death

    elsif action == @actions_corridor[:dodge]
      puts MSG_DODGE
      return :death

    elsif action == @actions_corridor[:joke]
      puts MSG_TELL_A_JOKE
      return :laser_weapon_armory

    else
      puts MSG_DOES_NOT_COMPUTE
      return :central_corridor
    end
  end

  def laser_weapon_armory()
    puts MSG_LASER_WEAPON_ARMORY

    code = "%s%s%s" % [rand(9)+1, rand(9)+1, rand(9)+1]
    print "[keypad]> "
    guess = gets.chomp()
    guesses = 1

    while guess != code and guesses < 10
      puts MSG_FAIL_GUESS
      guesses += 1
      print "[keypad]> "
      guess = gets.chomp()
    end

    if guess == code
      puts MSG_OK_CODE
      return :the_bridge
    else
      puts MSG_FAIL_CODE
      return :death
    end
  end

  def the_bridge()
    puts MSG_BRIDGE

    prompt(@actions_bridge)
    action = gets.chomp()

    if action == @actions_bridge[:throw]
      puts MSG_THROW_THE_BOMB
      return :death

    elsif action == @actions_bridge[:place]
      puts MSG_SLOWLY_PLACE_THE_BOMB
      return :escape_pod
    else
      puts MSG_DOES_NOT_COMPUTE
      return :the_bridge
    end
  end

  def escape_pod()
    puts MSG_ESCAPE_POD

    good_pod = rand(5)+1
    print "[pod #]>"
    guess = gets.chomp()

    if guess.to_i != good_pod
      puts "You jump into pod %s and hit the eject button." % guess
      puts "The pod escapes out into the void of space, then"
      puts "implodes as the hull ruptures, crushing your body"
      puts "into jam jelly."
      return :death
    else
      puts "You jump into pod %s and hit the eject button." % guess
      puts "The pod easily slides out into space heading to"
      puts "the planet below.  As it flies to the planet, you look"
      puts "back and see your ship implode then explode like a"
      puts "bright star, taking out the Gothon ship at the same"
      puts "time.  You won!"
      Process.exit(0)
    end
  end
end

a_game = Game.new(:central_corridor)
a_game.play()


