unless ARGV.length == 2
	puts "usag: differences.rb old_inventory new_inventory"
end

def inventory_from(filename)
	inventory = File.open(filename)
	downcased = inventory.collect do |f|
		f.chomp.downcase
	end

	downcased.reject do |line|
		boring?(line)
	end
end

def boring?(line)
	line.split('/').include?('temp') or line.split('/').include?('recycle')
end

old_inventory = inventory_from(ARGV[0])
new_inventory = inventory_from(ARGV[1])

puts "[The following files has been added:]"
puts new_inventory - old_inventory

puts "[The following files has been deleted:]"
puts old_inventory - new_inventory
