require_relative './ex45_corridor'
require_relative './ex45_armory'
require_relative './ex45_bridge'
require_relative './ex45_pod'


class Game

  def initialize(start)
    @start = start
    @quips=[
      "You died. You kinda such at this.",
      "Nice job, you died ...jackass.",
      "Such a luser.",
      "I have a small puppy that's better at this."
      ]
  end

  def play()
    next_room = @start

    while true
      puts "\n"+("-" * 8)

      if next_room == :corridor
        room = Corridor.new()
      elsif next_room == :armory
        room = Armory.new()
      elsif next_room == :bridge
        room = Bridge.new()
      elsif next_room == :pod
        room = Pod.new()
      elsif next_room == :death
        death
      elsif next_room == :win
        win
      end
      next_room = room.execute()
    end
  end

  def death()
    puts @quips[rand(@quips.length())]
    Process.exit(1)
  end

  def win()
    Process.exit(0)
  end
end


