
require_relative 'calc_rule.tab.rb'

class TinyCC
  def parse(str)
    @cur_lev = 0
	@stack = []
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
#	puts @q
#	@yydebug = true
    do_parse
  end

  def next_token
    @q.shift
  end

  def lookup_sym(name)
    return @stack.select{|x| x[1]==name}
  end

  def make_decl( name )
  obj = lookup_sym(name)
  if(obj!=[])
    case obj[0][:kind]
	  when "vAR"
	    if(obj.lev == cur_lev)
		  puts("redirection of #{obj.name}")
		end
		when "FUN","UNDEFFUN"
		  if(obj.lev == cur_lev)
		    puts("#{obj.name} redeclared as defferent kind of symbol")
		  end
		when "PARM"
		  puts("declaration of #{obj.name} shadow a parameter")
     end
  end
	 n = {name:name,kind:"VAR"}
	 @stack.push(n)
	 return n
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
