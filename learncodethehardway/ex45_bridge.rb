class Bridge

  def initialize()

    @dialogue_msg={}

    @dialogue_msg[:other] = %{DOES NOT COMPUTE}

    @dialogue_msg[:entry] = <<-ENTRY
    You burst onto the Bridge with the neutron destruct bomb
    under your arm and surprise 5 Gothons who are trying to
    take control of the ship.  Each of them has an even uglier
    clown costume than the last.  They haven't pulled their
    weapons out yet, as they see the active bomb under your
    arm and don't want to set it off.
    ENTRY

    @dialogue_msg[:throw] = <<-THROW
    In a panic you throw the bomb at the group of Gothons
    and make a leap for the door.  Right as you drop it a
    Gothon shoots you right in the back killing you.
    As you die you see another Gothon frantically try to disarm
    the bomb. You die knowing they will probably blow up when
    it goes off.
    THROW

    @dialogue_msg[:slow]= <<-SLOW
    You point your blaster at the bomb under your arm
    and the Gothons put their hands up and start to sweat.
    You inch backward to the door, open it, and then carefully
    place the bomb on the floor, pointing your blaster at it.
    You then jump back through the door, punch the close button
    and blast the lock so the Gothons can't get out.
    Now that the bomb is placed you run to the escape pod to
    get off this tin can.
    SLOW

    @actions_user ={
      :throw => "throw the bomb",
      :slow => "slowly place the bomb"
    }
  end

  def execute()
    puts @dialogue_msg[:entry]
    print "> "
    action = gets.chomp()

    if action == @actions_user[:throw]
      puts @dialogue_msg[:throw]
      return :death
    elsif action == @actions_user[:slow]
      puts @dialogue_msg[:slow]
      return :pod
    else
      puts @dialogue_msg[:other]
      return :bridge
    end
  end  
end


