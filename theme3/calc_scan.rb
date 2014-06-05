require_relative 'calc_rule.tab.rb'
class TinyCC
  def parse(str)
    @q = []
    until str.empty?
      case str
      when /\A\s+/
      when /\A\d+/
        @q.push [:CONSTANT, $&.to_i]
	  when /\Aint/
	    @q.push [:RESERVED, $&]
	  when /\Aif/
	    s = $&
	    @q.push [s,s]
	  when /\Areturn/
		s = $&
		puts "hoge"
		@q.push [s,s]
      when /\Awhile/
	    s = $&
		@q.push [s,s]
      when /\Aelse/
	    s = $&
		@q.push [s,s]
	  when /\A==/
		s = $&
		@q.push [s, s]
	  when /\A\!=/
	    s = $&
	    @q.push [s, s]
      when /\A<=/
	    s = $&
	    @q.push [s, s]
	  when /\A>=/
		s = $&
		@q.push [s, s]
	  when /\A[a-zA-Z]\w*/
	    @q.push [:IDENTIFIER, $&]
      when /\A.|\n/o
        s = $&
        @q.push [s, s]
	  when /\A==|!=|>=|/o
	    s = $&
		@q.push[s, s]
      end
      str = $'
    end
    @q.push [false, '$end']
	puts @q
    do_parse
  end

  def next_token
    @q.shift
  end

end


parser = TinyCC.new
puts
puts 'type "Q" to quit.'
puts
#while true
  puts
  print '? '
  #str = gets.chop!
  str = File.open("test.c").read
  puts str
#  break if /\z/i =~ str
  begin
    puts "= #{parser.parse(str)}"
	#parser.parse(str)
  rescue ParseError
    puts $!
	p @q
  end
#end
