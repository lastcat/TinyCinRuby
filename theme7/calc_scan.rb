
require_relative 'calc_rule.tab.rb'

class TinyCC
  def parse(str)
    @stack = []
	@cur_lev = 0
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

  def pop_object(lev)
    @stack.reject!{|x| x[2]==lev}
  end

  def lookup_sym(name)
    return @stack.select{|x| x[1]==name}
  end

#0:型 1:名前 2:lev 3:kind 4:offset
#多重定義を一つの前提にしてるけどもしかしたらselectの結果についてeachする必要があるかもしれない<-これな
#未定義関数の宣言発見時の処理をまだやってない　資料のglobalize_sym()
#それ終わったら一回チェックしてみるかなぁ
  def make_decl(name)
    n = lookup_sym(name)
	if(n!=[])
	  case n[0][3]
	    when "VAR"
	      if(n[0][1]==@cur_lev)
	        puts("redeclaration of #{n[0][0]}")
          end
		  @stack.reject!{|x| x[3]=="VAR"}
		  n = [name,@cur_lev,"VAR",0]
	    when "FUN", "UNDEFFUN"
	      if(n[0][1]==@cur_lev)
	        puts("#{n[0][0]} redeclared as different kind of symbol")
	      end
		  @stack.reject!{|x| x[3]=="VAR"}
	      n = [name, @cur_lev, "VAR", 0]
	    when "PARM"
	      puts("declaration of #{n[0][0]} shadow a parameter")
		  @stack.reject!{|x| x[3] == "PARM"}
		  n = [ name, @cur_lev, "VAR", 0]
      end
	else
	  n = [name, @cur_lev, "VAR", 0]
    end
	@stack.push(n)
	return n
  end



  def make_param_decl(name)
    n = lookup_sym(name)
    if(n!=[])
	  case n[0][3]
	    when "VAR","FUN","UNDEFFUN"
		  @stack.reject!{|x| x[3] == "VAR" || x[3] == "FUN" || x[3] == "UNDEFFUN"}
	      n = [name, @cur_lev, "PARM", 0]
	    when "PARM"
	      puts("redeclaration of #{n[0][0]}")
		  return n
	  end
	else
      n = [name,@cur_lev,"PARM", 0]
    end
	@stack.push(n)
	return n
  end


  def make_fun_def(name)
    n = lookup_sym(name[1])
    if(n!=[])
	  case n[0][2]
	    when "VAR"
	      puts("#{n[1]} redelclared as defferent kind of symbol")
		  @stack.reject!{|x| x[3]=="VAR"}
		  n = [name[1], @cur_lev, "FUN", 0]
	    when "FUN"
	      puts("redfinition of #{n[1]}")
		  @stack.reject!{|x| x[3] == "FUN"}
		  n = [name[1], @cur_lev, "FUN", 0]
	    when "UNDEFFUN"
		  @stack.reject!{|x| x[3] == "UNDEFFUN"}
		  n = [name[1],@cur_lev,"FUN",0]
      end
	else
	  n = [name[1], @cur_lev, "FUN", 0]
	end
	@stack.push(n)
	return (n + name[2] + name[3]).unshift("int")
  end

  def ref_var(name)
    n = lookup_sym(name)
    if(n!=[])
	  case n[0][2]
	    when "VAR","PARM","FUN","UNDEFFUN"
	      puts("function #{n[0][1]} is used as variable")
	  end
	  else
	    puts("#{n[1]} undeclared variable")
		n = [name, @cur_lev, "VAR", 0]
	end
	@stack.push(n)
	return n
  end

  def ref_fun(name)
    n = lookup_sym(name)
    if(n!=[])
	  case n[0][2]
	    when "VAR","PARM"
	      puts("variable #{n[0][1]} is used as function")
	    when "FUN","UNDEFFUN"
	  end
    else
	  puts("#{n[1]} undeclared function")
	  n = [name, @cur_lev, "UNDEFFUN", 0]
	end
	@stack.push(n)
	return n
  end

  def indent(str)
    puts str.inspect.split('[').join.split(']')
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
	#parser.indent(parser.parse(str))
	#parser.parse(str)
  rescue ParseError
    puts $!
	p @q
  end
#end
