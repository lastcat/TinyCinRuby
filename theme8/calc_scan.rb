require_relative 'make_asm.rb'
require_relative 'calc_rule.tab.rb'

class TinyCC
  def parse(str)
	@stack = []
    @cur_lev = 0
	@last_alloc = 0
	@top_alloc = 0
	@param_add = 4

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
	#puts "This is stack"
	#puts @stack
  end

  def next_token
    @q.shift
  end

  def lookup_sym(name)
    #puts name
    #puts @stack.to_s 
    return @stack.select{|x| x[0]==name}
  end

  def stack_pop
    @stack.reject! do |e|
	  release_loc if (e[2]==@cur_lev)
	  e[2]==@cur_lev
    end
	@cur_lev -= 1
	#ここだとタイミングごとだ　release_loc
  end

  def allocate_loc
    @last_alloc -= 4
	@top_alloc = @last_alloc if(@last_alloc < @top_alloc)
	return @last_alloc
  end

  def release_loc
    @last_alloc += 4
  end
  
  def make_decl( name )
  obj = lookup_sym(name)
  if(obj!=[])
    #case obj[0][1]
	case obj.last[1]
	  when "vAR"
	    if(obj.last[2] == @cur_lev)
		  puts("redirection of #{name}")
		end
		when "FUN","UNDEFFUN"
		  if(obj.last[2] == @cur_lev)
		    puts("#{obj.name} redeclared as defferent kind of symbol")
		  end
		when "PARM"
		  puts("declaration of #{name} shadow a parameter")
     end
  end
    #allocate_locは局所変数のときだけやで
	 if(@cur_lev == 0)
	   rel_add = 0
	 else 
	   rel_add = allocate_loc
	 end
	 n = [name,"VAR",@cur_lev,rel_add]
	 @stack.push(n)
	 return n
  end

  def make_param( name )
    obj = lookup_sym(name)
	if(obj!=[])
	  #case obj[0][1]
	  case obj.last[1]
	  when "PARM"
		  puts("redeclaration of #{name}")
	  end
	end
	@param_add += 4
	#パラメーターはallocate_loc使わへんで
    n = [name,"PARM",@cur_lev,@param_add]
	@stack.push(n)
	return n
  end

  def make_fun_def( name,param_list )
    obj = lookup_sym(name)
	if(obj!=[])
      #case obj[0][1]
	  case obj.last[1]
	    when "VAR"
		  puts("#{name} redelared as different kind of symbol")
		when "FUN"
		  puts("redefinition of #{name}")
		when "UNDEFFUN"
		  #obj[0][2]="FUN"
		  obj.last[2]="FUN"
	  end
	end
    n = [name,"FUN",@cur_lev,param_list.length]
	@stack.push(n)
	return n
  end

  def ref_var( name )
    obj = lookup_sym(name)
	if(obj!=[])
	  #case obj[0][1]
	  case obj.last[1]
	    when"FUN","UNDEFFUN"
		  puts("function #{name} is used as variable")
	  end
	  #return obj[0]
	  return obj.last
	else
	  puts("#{name} undeclared variable")
	  n = [name,"VAR",@cur_lev]
	  @stack.push(n)
	  return n
	end
	#n = [name,"VAR",@cur_lev]
	#@stack.push(n)#たぶんおかしい
	#return n
  end
	
  def ref_fun( name ,param_list)
    #puts @stack.to_s
    obj = lookup_sym(name)
	if(obj!=[])
	  #case obj[0][1]
	  case obj.last[1]
	    when "VAR","PARM"
		  puts ("variable #{name} is used as function")
		  #return obj[0]
		  #return obj.last
		when "FUN","UNDEFFUN"
		  if (param_list != obj[0][3])
		    puts("number of arguments wrong!")
		  end
		   n = [name,"UNDEFFUN",@cur_lev]
		  #return obj[0]
		  #puts obj.last
		  #return obj.last
      end
	else
	  puts("#{name} undeclared function")
	  n = [name,"UNDEFFUN",@cur_lev]
	  #globalize(n)
	  @stack.push(n)
	end
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
    #puts "= #{parser.parse(str)}"
	#parser.parse(str)
	make_asm(parser.parse(str))
  rescue ParseError
    puts $!
	p @q
  end
#end
