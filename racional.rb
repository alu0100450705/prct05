# Implementar en este fichero la clase para crear objetos racionales

require "./gcd.rb"

class Fraccion

attr_reader :num, :den # Num = numerador , den = denominador

  def initialize(num, den)
    @num, @den = num, den
  end;

 # devuelve una cadena con la representación del racional
def to_s
	if @num % @den == 0
			"#{@num/@den}"
		else
			"#{@num}/#{@den}"
		end
end

# devuelve un nuevo racional que suma al objeto que invoca el que le pasan como parámetro
def suma (frac2)

	
	aux = (@num * frac2.den) + (@den * frac2.num)
	aux2 = (@den * frac2.den)	
	Fraccion.new(aux/gcd(aux,aux2), aux2/gcd(aux,aux2))
	
	
end

# devuelve un nuevo racional que resta al objeto que invoca el que le pasan como parámetro
def resta (frac2)

	aux = (@num * frac2.den) - (@den * frac2.num)
	aux2 = (@den * frac2.den)
	Fraccion.new(aux/gcd(aux,aux2), aux2/gcd(aux,aux2))
	
end

# devuelve un nuevo racional que multiplica al objeto que invoca el que le pasan como parámetro
def producto (frac2)
	aux = @num * frac2.num
	aux2 = @den * frac2.den
	Fraccion.new(aux/gcd(aux,aux2), aux2/gcd(aux,aux2) )
end 

# devuelve un nuevo racional que multiplica al objeto que invoca el que le pasan como parámetro
def division (frac2)
	aux= @num * frac2.den
	aux2= @den * frac2.num
	Fraccion.new(aux/gcd(aux,aux2), aux2/gcd(aux,aux2))
end 

	
end

if ARGV.size == 4
	f1 = Fraccion.new(ARGV[0].to_i, ARGV[1].to_i)
	f2 = Fraccion.new(ARGV[2].to_i, ARGV[3].to_i)
	puts "A = #{f1}"
	puts "b = #{f2}"

	puts "El resultado de la suma es: #{f1.suma(f2)}"
	puts "El resultado de la resta es: #{f1.resta(f2)}"
	puts "El resultado del producto es: #{f1.producto(f2)}"
	puts "El resultado de la division es: #{f1.division(f2)}"

else

	puts "Pasa 4 numeros por ARGV para formar los racionales con el formato ruby racional.rb X1 X2 Y1 Y2"
end

