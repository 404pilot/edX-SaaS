# Define a method sum which takes an array of integers as an argument and returns the sum of its elements. For an empty array it should return zero.
def sum(integers)
	if integers.empty?
		0
	else
		integers.reduce(:+)
	end
end

# Define a method max_2_sum which takes an array of integers as an argument and returns the sum of its two largest elements. For an empty array it should return zero. For an array with just one element, it should return that element.
def max_2_sum(integers)
	if !integers or integers.empty?
		0
	elsif integers.length == 1
		integers[0]
	else
		integers.sort.last(2).reduce(:+)
	end
end

# Define a method sum_to_n? which takes an array of integers and an additional integer, n, as arguments and returns true if any two distinct elements in the array of integers sum to n. An empty array or single element array should both return false.
def sum_to_n?(integers,i)
	if integers.empty? or integers.length==1
		false
	else
		integers.uniq.combination(2).any? {|x| x.reduce(:+) == i}
	end
end

# test
raise "Wrong" unless sum([]) == 0
raise "Wrong" unless sum([1,2,3]) == 6

raise "Wrong" unless max_2_sum(nil) == 0
raise "Wrong" unless max_2_sum([]) == 0
raise "Wrong" unless max_2_sum([2])== 2
raise "Wrong" unless max_2_sum([1,3,2]) == 5
raise "Wrong" unless max_2_sum([1,7,6,5,7]) == 14

raise "Wrong" unless !sum_to_n?([], 1)
raise "Wrong" unless !sum_to_n?([1],1)
raise "Wrong" unless sum_to_n?([1,2,3],5)
raise "Wrong" unless !sum_to_n?([2,3,3,5],6)
raise "Wrong" unless sum_to_n?([2,3,3,4],6)