=begin
Keywords

* alias
* and
* BEGIN
* begin
* break
* case
* class
* def
* defined?
* do
* else
* elsif
* END
* end
* ensure
* false
* for
* if
* in
module
* next
nil
* not
* or
* redo
* rescue
* retry
return
self
* super
* then
* true
undef
* unless
* until
* when
* while
* yield

=end

def bloque_begin
  x=1
  y=0
  
  begin
    z=x/y
  rescue => exception
    y=1
    puts exception.to_s
    #retry
  else
    puts "z=#{z}"
  ensure
    puts "x=#{x}, y=#{y}"
  end
end

bloque_begin

def hola_tres
  yield
  yield
  yield
end
hola_tres { puts "hola" }

def prueba_or_unless_until_while
  x=0
  while true
    if x==0
      puts x
      x +=1
    elsif x>0 or x<3
      x +=1
    else
      break
    end
  end

  (0..3).each do |x|
    unless x==3
      puts x
    end
  end

  x=0
  until x==3
    puts x
    x += 1
  end

end

prueba_or_unless_until_while

class Papa
  def saluda
    puts "Hola hijo"
  end
end

class Hijo < Papa
  def saluda
    super
    puts "Hola papa"
  end
end

p = Papa.new
p.saluda
h= Hijo.new
h.saluda

def prueba
  if not defined? (numbers)
    puts "no definido array"
    numbers=[1,2]
  elsif defined? (numbers)
    puts "definido array"
  end

  puts "bloque if then"
  if 1<2 then
    puts "1 es mayor que 2"
  end

  puts "bloque for"
  for i in (0..3)
    if (i==0) == true
      puts "#{i}"
    elsif i>0 and i<3
      puts "Hola #{i}"
    else
      break
    end
  end

  puts "bloque do"
  (0..5).each do |i|
    if i==0
      next
    elsif i>0 and i<3
      puts "Hola #{i}"
    else
      break
    end
  end

  puts "bloque case"
  (0...6).each do |x|
    case x
      when 0,1,2
        next
      when 3
        puts "#{x}"
      else
        break  
    end
  end
end

alias alias_prueba prueba

def suma_tres_numeros
  array = [1, 2, 3, 4]
  
  array.collect! do |n|
    n ** 2
  end
  array.inspect
end

puts suma_tres_numeros

prueba
alias_prueba


BEGIN {
  puts "Antes de Hola mundo"
}


END {
  puts "Despues de hola mundo"
}

