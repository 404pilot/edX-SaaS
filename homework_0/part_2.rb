# Define a method hello(name) that takes a string representing a name and returns the string "Hello, " concatenated with the name.

def hello(name)
	"Hello, #{name}"
end

raise "Wrong" unless hello("test") == "Hello, test"

# Define a method starts_with_consonant?(s) that takes a string and returns true if it starts with a consonant and false otherwise. (For our purposes, a consonant is any letter other than A, E, I, O, U.) NOTE: be sure it works for both upper and lower case and for nonletters!

def starts_with_consonant?(s)
	if s.empty?
		false
	else
		#s.upcase.start_with?("A","E","I","O","U")
		#s.upcase[/\A[AEIOU]/]
		!!s[/\A[a-z]/i] and !s[/\A[aeiou]/i]
	end
end

raise "Wrong" unless !starts_with_consonant?("")
raise "Wrong" unless !starts_with_consonant?("1")
raise "Wrong" unless !starts_with_consonant?("a")
raise "Wrong" unless !starts_with_consonant?("a bsd")
raise "Wrong" unless !starts_with_consonant?("Eabsd")
raise "Wrong" unless starts_with_consonant?("b")
raise "Wrong" unless starts_with_consonant?("bae")

#Define a method binary_multiple_of_4?(s) that takes a string and returns true if the string represents a binary number that is a multiple of 4. NOTE: be sure it returns false if the string is not a valid binary number!

def binary_multiple_of_4?(s)
	if s.empty? or !s[/\A[01]+$/]
		false
	else
		s.to_i(2)%4 == 0
	end
end

raise "Wrong" unless !binary_multiple_of_4?("")
raise "Wrong" unless !binary_multiple_of_4?("a")
raise "Wrong" unless !binary_multiple_of_4?("11a")
raise "Wrong" unless binary_multiple_of_4?("0")
raise "Wrong" unless binary_multiple_of_4?("100")
raise "Wrong" unless !binary_multiple_of_4?("101")