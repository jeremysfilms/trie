class Trie
	attr_accessor :data
	def initialize
		@data = {}
	end

	def add_word(word)
		turtle = @data
		word.split('').each { |letter|
		turtle[letter] = turtle[letter] || {}
		turtle = turtle[letter]
		}
		turtle['isword'] = true
	end
	
	def find(prefix)
		rv = []
		turtle = @data
		prefix.split('').each { |letter|
			turtle = turtle[letter]
			return rv unless turtle
		}

		_find_helper(turtle,prefix.split(''),rv)

	end

	def _find_helper(folder, chars, rv)
		if folder['isword']
			rv << chars.join
		end

		folder.each{ |key, value| 
			next if key == 'isword'
			_find_helper(folder[key],chars+[key],rv)
		}
		return rv
	end

end