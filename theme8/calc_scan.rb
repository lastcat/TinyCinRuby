require_relative 'calc_rule.tab.rb'

class TinyCC
  def parse(str)
	@stack = []
    @cur_lev = 0
	@last_alloc = 0
	@top_alloc = 0
	@param_add = 4
	@unique_rabel = 1
	@error_num = 0

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
	  when /\A&&/
	    s = $&
		@q.push [s,s]
	  when /\A\|\|/
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
	@yydebug = true
    do_parse
	#puts "This is stack"
	#puts "stack"
	#puts @stack
  end

  def next_token
    @q.shift
  end

  def return_error_num
     @error_num
  end

  def lookup_sym(name)
    #puts name
    #puts @stack.to_s 
    return @stack.select{|x| x[1]==name||x[0]==name}
  end

  def stack_pop
    @stack.reject! do |e|
	  #puts "pop this param :" + e.to_s if e[2]==0
	  if(e[2]!=0)
	    puts "pop:#{e.to_s}"
	    e[2]==@cur_lev
	  end
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
	case obj.last[2]
	  when "VAR"
	    if(obj.last[3] == @cur_lev)
		  puts("error:redirection of #{name}")
		  @error_num += 1
		end
		when "FUN","UNDEFFUN"
		  if(obj.last[3] == @cur_lev)
		    puts("error:#{obj.name} redeclared as defferent kind of symbol")
			@error_num += 1
		  end
		when "PARM"
		  puts("warn:declaration of #{name} shadow a parameter")
     end
  end
  #allocate_locは局所変数のときだけやで
=begin	 if(@cur_lev == 0)
	   rel_add = 0
	 else 
	   rel_add = allocate_loc
	 end
=end
	 n = [name,"VAR",@cur_lev,0]
	 @stack.push(n)
	 return n
  end

  def make_param( name )
    obj = lookup_sym(name)
	if(obj!=[])
	  #case obj[0][1]
	  case obj.last[1]
	  when "PARM"
		  puts("error:redeclaration of #{name}")
		  @error_num += 1
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
		  puts("error:#{name} redelared as different kind of symbol")
		  @error_num += 1
		when "FUN"
		  puts("error:redefinition of #{name}")
		  @error_num += 1
		when "UNDEFFUN"
		  #obj[0][2]="FUN"
		  obj.last[2]="FUN"
	  end
	end
	n = [name,"FUN",@cur_lev,0]
    n = [name,"FUN",@cur_lev,param_list.length] if param_list!=nil

	@stack.push(n)
	return n
  end

  def ref_var( name )
    obj = lookup_sym(name)
	if(obj!=[])
	  #case obj[0][1]
	  case obj.last[1]
	    when"FUN","UNDEFFUN"
		  puts("error:function #{name} is used as variable")
		  @error_num += 1
	  end
	  #return obj[0]
	  return obj.last
	else
	  puts("error:#{name} undeclared variable")
	  @error_num += 1
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
		  puts ("error:variable #{name} is used as function")
		  @error_num += 1
		  #return obj[0]
		  #return obj.last
		when "FUN"
		  if (param_list != obj[0][3])
		    puts("error:number of arguments wrong!#{obj[0][0]}")
			@error_num += 1
		  end
		   n = [name,"FUN",@cur_lev] 
		when "UNDEFFUN"
		   n = [name,"UNDEFFUN",@cur_lev]
		  #return obj[0]
		  #puts obj.last
		  #return obj.last
      end
	else
	  puts("warn:#{name} undeclared function")
	  n = [name,"UNDEFFUN",@cur_lev]
	  #globalize(n)
	  @stack.push(n)
	end
	  return n
  end

  def emit(inst,op1,op2)
    str = ""
    if(op1 == nil&&op2==nil)
      str = "\t#{inst}\n"
    elsif(op2 == nil)
      str = "\t#{inst}\t#{op1}\n"
    else 
      str = "\t#{inst}\t#{op1},#{op2}\n"
    end
  #puts str 
    return str
  end

  def make_function(function)
=begin
  
=end
  end

def analyze_compound(comp,statement_list)
  #仮。入れ子になってる場合はそれに応じて複数alloc_countを設定する必要がある
  @alloc_count = 0
  if(comp[0]=="comp")
    comp.shift#compoundの"comp"をpushする
	analyze_compound(comp,statement_list)
  else
    comp.each do |state_list|
	  if(!state_list.nil?)
        state_list.each do |e|
	      if(e[0]=="comp")
		    analyze_compound(e,statement_list)
		  else
		    statement_list.push(e)
		  end
	    end
	  end
	end
  end

end

def arith(statement,ret = false,cond = false)
  #statement[0]=演算子,statament[1]=非演算子,statement[2]=非演算子
  case statement[0]
    when "int"
	#局所偏変数割り振るで
	  if(statement[1].is_a?(Array))
	    #それぞれに対して番地を割り振る
		statement.shift
		statement.each do |e|
		  e[4] = allocate_loc
		  @alloc_count += 1
		  puts e.to_s
		end
	  else
		#returnで呼び出されたときように
		if(statement[3]==0)
		  @asm_code.push(emit("mov","eax","[#{statement[1]}]"))
		elsif(ret)
		  code = statement[4] > 0 ? emit("mov","eax","[ebp+#{statement[4]}]") : emit("mov","eax","[ebp#{statement[4]}]")
		  @asm_code[@asm_code.length,0] = code
		elsif(cond)
		  @asm_code.push(emit("mov","eax","[ebp#{statement[4]}]"))
		else
          statement[4] = allocate_loc
		  @alloc_count += 1
		end
	  end
    when "="
	  #code =  "mov [ebp#{statement[1][4]}] eax"
	  #PRAMには[4]がないって問題らしいんだけどこれ前まで言われなかったのかな
	  #code = statement[1][4] > 0 ? emit("mov","[ebp+#{statement[1][4]}","eax") : emit("mov","[ebp#{statement[1][4]}","eax")
	  if(statement[1][2]=="VAR")
	    code = emit("mov","[ebp#{statement[1][4]}]","eax") if(statement[1][3]!=0)
		code = emit("mov","[#{statement[1][1]}]","eax") if(statement[1][3]==0)
	  elsif(statement[1][1]=="PARM")
	    code = emit("mov","[ebp+#{statement[1][3]}]","eax")
	  end
	  arith(statement[2])
	  @asm_code.push(code)
	when "func"
	when "+"
	  tmp = allocate_loc
	  #オペランドが式になっているかどうかで頑張って分ける
	  if((statement[1][0]=="int")||(statement[1][1]=="PARM")||(statement[1][1]=="CONSTANT"))
	    case statement[1][1]
		  when "PARM"
		    code =  statement[1][3] > 0 ? emit("mov","eax","[ebp+#{statement[1][3]}]") : emit("mov","eax","[ebp#{statement[1][3]}]")
			@asm_code[@asm_code.length,0] = code
		  when "CONSTANT"
		    code =  emit("mov","eax","#{statement[1][0]}")
			@asm_code[@asm_code.length,0] = code
		  else
		    code =  emit("mov","eax" ,"[ebp#{statement[1][4]}]")
			@asm_code[@asm_code.length,0] = code
		end
	  else
	    arith(statement[1])#右オペランドのコード生成
	    code =  emit("mov", "[ebp#{tmp}]","eax")
		@asm_code[@asm_code.length,0] = code
	  end
	  if((statement[2][0]=="int")||(statement[2][1]=="PARM")||(statement[2][1]=="CONSTANT"))
	    case statement[2][1]
		  when "PARM"
		    code =  emit("add","eax","[ebp+#{statement[2][3]}]")
			@asm_code[@asm_code.length,0] = code
		  when "CONSTANT"
		    code =  emit("add","eax","#{statement[2][0]}")
			@asm_code[@asm_code.length,0] = code
		  else
	        code =  emit("add","eax","[ebp#{statement[2][4]}]")
			@asm_code[@asm_code.length,0] = code
	    end

	  else
	    @asm_code.push(emit("mov","ecx","eax"))
	    arith(statement[2])
	    @asm_code.push(emit("mov","edx","eax"))
	    @asm_code.push(emit("mov","eax","ecx"))
	    #code =  emit("sub","eax","[ebp#{tmp}]")
	    #   @asm_code[@asm_code.length,0] = code
		@asm_code.push(emit("add","eax","edx"))

	  end
	  release_loc
	when "-"
	#なんで左右逆にしてたんだっけ（とりあえず元に戻す）
	  tmp = allocate_loc
	  #オペランドが式になっているかどうかで頑張って分ける
	  if(statement.length == 2)
	    arith(statement[1])
		@asm_code.push(emit("imul","eax","-1"))
	else

	  if((statement[1][0]=="int")||(statement[1][1]=="PARM")||(statement[1][1]=="CONSTANT"))
	    case statement[1][1]
		  when "PARM"
		    code =  statement[1][3] > 0 ? emit("mov","eax","[ebp+#{statement[1][3]}]") : emit("mov","eax","[ebp#{statement[1][3]}]")
			@asm_code[@asm_code.length,0] = code
		  when "CONSTANT"
		    code =  emit("mov","eax","#{statement[1][0]}")
			@asm_code[@asm_code.length,0] = code
		  else
		    code =  emit("mov","eax" ,"[ebp#{statement[1][4]}]")
			@asm_code[@asm_code.length,0] = code
		end
	  else
	    arith(statement[1])#右オペランドのコード生成
	    #code =  emit("mov","[ebp#{tmp}]","eax")
		#@asm_code[@asm_code.length,0] = code
	  end
	  if((statement[2][0]=="int")||(statement[2][1]=="PARM")||(statement[2][1]=="CONSTANT"))
	    case statement[2][1]
		  when "PARM"
		    code =  emit("sub","eax","[ebp+#{statement[2][3]}]")
			@asm_code[@asm_code.length,0] = code
		  when "CONSTANT"
		    code =  emit("sub","eax","#{statement[2][0]}")
			@asm_code[@asm_code.length,0] = code
		  else
	        code =  emit("sub","eax","[ebp#{statement[2][4]}]")
			@asm_code[@asm_code.length,0] = code
	    end

	  else
	    @asm_code.push(emit("mov","[ebp#{tmp}]","eax"))
	    arith(statement[2])

		@asm_code.push(emit("mov","ecx","eax"))
		@asm_code.push(emit("mov","eax","[ebp#{tmp}]"))
		code =  emit("sub","eax","ecx")
			@asm_code[@asm_code.length,0] = code
		#@asm_code.push(emit("sub","eax","edx"))
	  end
    end
	  release_loc
	when "*"
	  tmp = allocate_loc
	  	  #オペランドが式になっているかどうかで頑張って分ける
	  if((statement[1][0]=="int")||(statement[1][1]=="PARM")||(statement[1][1]=="CONSTANT"))
	    case statement[1][1]
	when "PARM"
		    code =  statement[1][3] > 0 ? emit("mov","eax","[ebp+#{statement[1][3]}]") : emit("mov","eax","[ebp#{statement[1][3]}]")
			@asm_code[@asm_code.length,0] = code
		  when "CONSTANT"
		    code =  emit("mov","eax","#{statement[1][0]}")
			@asm_code[@asm_code.length,0] = code
		  else
		    code =  emit("mov","eax" ,"[ebp#{statement[1][4]}]")
			@asm_code[@asm_code.length,0] = code
		end
	  else
	    arith(statement[1])#右オペランドのコード生成
	    code =  emit("mov","[ebp#{tmp}]","eax")
		@asm_code[@asm_code.length,0] = code
	  end
	  if((statement[2][0]=="int")||(statement[2][1]=="PARM")||(statement[2][1]=="CONSTANT"))
	    case statement[2][1]
		  when "PARM"
		    code =  emit("imul","eax","[ebp+#{statement[2][3]}]")
			@asm_code[@asm_code.length,0] = code
		  when "CONSTANT"
		    code =  emit("imul","eax","#{statement[2][0]}")
			@asm_code[@asm_code.length,0] = code
		  else
	        code =  emit("imul","eax","[ebp#{statement[2][4]}]")
			@asm_code[@asm_code.length,0] = code
	    end

	  else
	    arith(statement[2])
		code =  emit("imul","eax","[ebp#{tmp}]")
			@asm_code[@asm_code.length,0] = code
	  end
	  release_loc
	  when "/"
	  tmp = allocate_loc
#オペランドが式になっているかどうかで頑張って分ける
	  if((statement[2][0]=="int")||(statement[2][1]=="PARM")||(statement[2][1]=="CONSTANT"))
	    case statement[2][1]
	      when "PARM"
	        code =  statement[2][3] > 0 ? emit("mov","eax","[ebp+#{statement[2][3]}]") : emit("mov","eax","[ebp#{statement[2][3]}]")
			@asm_code.push(code)
	      when "CONSTANT"
	        code =  emit("mov","eax","#{statement[2][0]}")
	        @asm_code[@asm_code.length,0] = code
	      else
	        code =  emit("mov","eax" ,"[ebp#{statement[2][4]}]")
	        @asm_code[@asm_code.length,0] = code
	    end
	  else
	    arith(statement[2])#右オペランドのコード生成
	  end
	    code =  emit("mov","[ebp#{tmp}]","eax")
	    @asm_code[@asm_code.length,0] = code
	  if((statement[1][0]=="int")||(statement[1][1]=="PARM")||(statement[1][1]=="CONSTANT"))
	    case statement[1][1]
	      when "PARM"
	        code =  emit("mov","eax","[ebp+#{statement[1][3]}]")
	        @asm_code[@asm_code.length,0] = code
	      when "CONSTANT"
	        code =  emit("mov","eax","#{statement[1][0]}")
	        @asm_code[@asm_code.length,0] = code
	      else
	        code =  emit("mov","eax","[ebp#{statement[1][4]}]")
	        @asm_code[@asm_code.length,0] = code
	    end
       else
        arith(statement[1])
        code =  emit("mov","eax","[ebp#{tmp}]")
        @asm_code[@asm_code.length,0] = code
      end
	    @asm_code.push(emit("cdq",nil,nil))
		@asm_code.push("\tidiv\tdword\t[ebp#{tmp}]\n")
      release_loc
	when "RETURN"
	  arith(statement[1],true)
	  code = emit("jmp","L#{@func_name}ret",nil)
	  @asm_code[@asm_code.length,0] = code
	when "WHILE"#statment[1]=条件式,statement[2]=comp,もしくはただのstatement
	  l1 = "L#{@unique_rabel+=1}"
	  @asm_code[@asm_code.length,0] = emit("#{l1}:",nil,nil)#L1ラベル
	  arith(statement[1])
	  @asm_code[@asm_code.length,0] = emit("cmp","eax","0")
	  l2 = "L#{@unique_rabel+=1}"
	  @asm_code[@asm_code.length,0] = emit("je","#{l2}",nil)
	  while_compound = []
	  analyze_compound(statement[2],while_compound)
	  while_compound.each do |st|
	    st.unshift("int") if st[0].is_a?(Array)
	    #puts "while内部"
	    #puts st.to_s
	    arith(st)
	  end
	  #while_compound.each do |p|
	   # puts p.to_s
	  #end
	  @asm_code[@asm_code.length,0] = emit("jmp","#{l1}",nil)
	  @asm_code[@asm_code.length,0] = emit("#{l2}:",nil,nil)
	when "IF"
	  case statement.length
	    when 3#elseなし　あとまずはcompound前提
		  #statement[1]=条件式,statement[2]=comp,もしくはただのstatement
		  arith(statement[1],false,true)
		  @asm_code[@asm_code.length,0] = emit("cmp","eax","0 ;この上が条件式")
		  l1 = "L#{@unique_rabel+=1}"
		  @asm_code[@asm_code.length,0] = emit("je","#{l1}",nil)
		  if(statement[2][0]=="comp")
		    if_compound = []
		    analyze_compound(statement[2],if_compound)
		    if_compound.each do |st|
		      st.unshift("int") if st[0].is_a?(Array)
			  arith(st)
		    end
		  else
		    arith(statement[2])
		  end
		  @asm_code[@asm_code.length,0] = emit("#{l1}:",nil,nil)
		when 4
		  #statement[1]=条件式,statement[2]=comp
		  arith(statement[1],false,true)
		  @asm_code[@asm_code.length,0] = emit("cmp","eax","0 ;この上が条件式")
		  l1 = "L#{@unique_rabel+=1}"
		  @asm_code[@asm_code.length,0] = emit("je","#{l1};ここからIF",nil)
		  if(statement[2][1]=="comp")
		    if_compound = []
		    analyze_compound(statement[2],if_compound)
		    if_compound.each do |st|
		      st.unshift("int") if st[0].is_a?(Array)
			  arith(st)
		    end
		  else
		    arith(statement[2])
		  end
		  l2 = "L#{@unique_rabel+=1}"
		  @asm_code[@asm_code.length,0] = emit("jmp","#{l2}",nil)
		  @asm_code[@asm_code.length,0] = emit("#{l1}:",";ここからelse",nil)
		  if(statement[3][0]=="comp")
		    else_compound = []
		    analyze_compound(statement[3],else_compound)
		    else_compound.each do |st|
		      st.unshift("int") if st[0].is_a?(Array)
			  arith(st)
		    end
		  else
		    arith(statement[3])
		  end
		  @asm_code[@asm_code.length,0] = emit("#{l2}:",nil,nil)
	  end
	when "==","!=",">","<","=<","=>"
	  tmp = allocate_loc
	  	  #オペランドが式になっているかどうかで頑張って分ける
	  if((statement[1][0]=="int")||(statement[1][1]=="PARM")||(statement[1][1]=="CONSTANT"))
	    case statement[1][1]
	      when "PARM"
		    code =  statement[1][3] > 0 ? emit("mov","eax","[ebp+#{statement[1][3]}]") : emit("mov","eax","[ebp#{statement[1][3]}]")
			@asm_code[@asm_code.length,0] = code
		  when "CONSTANT"
		    code =  emit("mov","eax","#{statement[1][0]}")
			@asm_code[@asm_code.length,0] = code
		  else
		    code =  emit("mov","eax", "[ebp#{statement[1][4]}]")
			@asm_code[@asm_code.length,0] = code
		end
		@asm_code.push(emit("mov","[ebp#{tmp}]","eax"))
	  else
	    arith(statement[1])#右オペランドのコード生成
	    code =  emit("mov","[ebp#{tmp}]","eax")
		@asm_code[@asm_code.length,0] = code
	  end
	    #@asm_code.push(emit("mov","[ebp#{tmp}]","eax"))
	  if((statement[2][0]=="int")||(statement[2][1]=="PARM")||(statement[2][1]=="CONSTANT"))
	    case statement[2][1]
		  when "PARM"
		    code =  emit("cmp","eax","[ebp+#{statement[2][3]}]")
			@asm_code[@asm_code.length,0] = code
		  when "CONSTANT"
		    code =  emit("cmp","eax","#{statement[2][0]}")
			@asm_code[@asm_code.length,0] = code
		  else
	        code =  emit("cmp","eax","[ebp#{statement[2][4]}]")
			@asm_code[@asm_code.length,0] = code
	    end

	  else
	    arith(statement[2])
		#この状態のとき、tmp = 左辺,eax = 右辺
		#code =  emit("cmp","eax","[ebp#{tmp}]")
		#@asm_code[@asm_code.length,0] = code
		@asm_code.push( emit("cmp","[ebp#{tmp}]","eax"))
	  end
	  case statement[0]
	    when "=="
		  code = emit("sete","al",nil)
		when "!="
		  code = emit("setne","al",nil)
		when ">"
		  code = emit("setg","al",nil)
		when "<"
		  code = emit("setl","al",nil)
		when "=>"
		  code = emit("setge","al","nil")
		when "=<"
		  code = emit("setle","al",nil)
	  end
	  @asm_code[@asm_code.length,0] = code
	  code = emit("movzx","eax","al")
	  @asm_code[@asm_code.length,0] = code
	  release_loc
	when "||"
	  tmp = allocate_loc
	  @asm_code.push("\tmov\tdword\t[ebp#{tmp}],\t1\n")
	  arith(statement[1])
      @asm_code[@asm_code.length,0] = emit("cmp","eax","1")
	  l1 = "L#{@unique_rabel+=1}"
	  @asm_code[@asm_code.length,0] = emit("je","#{l1}",nil)
	  arith(statement[2])
	  @asm_code[@asm_code.length,0] = emit("cmp","eax","1")
	  @asm_code[@asm_code.length,0] = emit("je","#{l1}",nil)
	  @asm_code.push("\tmov\tdword\t[ebp#{tmp}],\t0\n")
	  @asm_code.push(emit("#{l1}:",nil,nil))
	  @asm_code.push(emit("mov","eax","[ebp#{tmp}]"))
          release_loc  
	when "&&"
	  tmp = allocate_loc
	  @asm_code.push("\tmov\tdword\t[ebp#{tmp}],\t0\n")
	  arith(statement[1])
      @asm_code[@asm_code.length,0] = emit("cmp","eax","0")
	  l1 = "L#{@unique_rabel+=1}"
	  @asm_code[@asm_code.length,0] = emit("je","#{l1}",nil)
	  arith(statement[2])
	  @asm_code[@asm_code.length,0] = emit("cmp","eax","0")
	  @asm_code[@asm_code.length,0] = emit("je","#{l1}",nil)
	  @asm_code.push("\tmov\tdword\t[ebp#{tmp}],\t1\n")
	  @asm_code.push(emit("#{l1}:",nil,nil))
	  @asm_code.push(emit("mov","eax","[ebp#{tmp}]"))
          release_loc

    else
	#PARM単体が返り値
	  if(statement[1]=="PARM")
	    @asm_code[@asm_code.length,0] = emit("mov","eax","[ebp+#{statement[3]}]")
	  end
	  if((statement[1]=="FUN")|| statement[1]=="UNDEFFUN")
	    #p164
		if(statement[3]!=nil)
		  statement[3].reverse!.each do |st|
		    arith(st)
		    @asm_code.push(emit("push","eax",nil))
		  end
		end
		@asm_code.push(emit("call","#{statement[0]}",nil))
		@asm_code.push(emit("add","esp",0))
		@asm_code.push(emit("add","esp","#{statement[3].length*4}")) if statement[3]!=nil
	  end
	  if(statement[1]=="CONSTANT")
	    @asm_code.push(emit("mov","eax","#{statement[0]}"))
	  end
=begin	  case statement[1]
	   when "VAR"
	     if(statement[2]!=0)
	       return "ebp#{statement[3]}"
		 else
		   return "大域変数のメモリ番地"
		 end
	   when "PARM"
	     return "[ebp#{statement[3]}]"
	   when "CONSTANT"
	     return "#{statement[0]}"
	  else
	    return statement
	  end
=end
  end


end

def make_asm(syntax_tree)
  @global_var = []#大域変数がとりあえずこの中にある。（大域変数って使うのか？）
  @statement_list = []
  @asm_code = []#アセンブリコードの配列
  @asm_code.push("EXTERN chk\n")
  #puts syntax_tree.to_s
  syntax_tree.each do |i|
    case i[0]
	  when "func"
	    #もしかしてtop_allocここでリセットしないといけない気もする
	    #i[1](関数名)、i[2](引数リスト)を使って関数テンプレート出力
		@statement_list = []
		@func_name = i[1][0]
        @asm_code.push("\tGLOBAL\t#{i[1][0]}\n")
		@asm_code.push("#{i[1][0]}\tpush\tebp\n")
		@asm_code.push(emit("mov","ebp","esp"))
		@asm_code.push(emit("sub","esp","Nlocal"))
		num = @asm_code.length
		#ここも直接だと二個目以降の関数むりっすねえ
        analyze_compound(i[3],@statement_list)#関数本体のコード
		@statement_list.each do |st|
		  st.unshift("int") if st[0].is_a?(Array)
		  arith(st)
		end
		#@statement_list = []
		num = @asm_code.length - num;
		@asm_code[@asm_code.length-num-1] = emit("sub","esp","#{-@top_alloc}")
		@alloc_count.times do release_loc end
		@asm_code.push("L#{i[1][0]}ret\tmov\tesp,ebp\n")
		@asm_code.push(emit("pop","ebp",nil))
        @asm_code.push(emit("ret",nil,nil))
	  else
	    i.each_with_index do |var,i|
		  #@global_var.push(var)
		  @asm_code.push(emit("COMMON","#{var[1]} #{32*i}",nil))
 	   end
	end
    puts
  end
  #puts @asm_code.to_s
  puts "@statementlist"
  @statement_list.each do |i|
    puts i.to_s
  end
#アセンブリ書き込み
open("output.asm","w") do |f|
    @asm_code.each do |i|
      f.write i
    end
  end
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
  str = File.open("#{ARGV[0]}").read
  puts str
#  break if /\z/i =~ str
  begin
    #puts "= #{parser.parse(str)}"
	#puts parser.parse(str).to_s
	#parser.make_asm(parser.parse(str))
    code = parser.parse(str)
	puts "error:#{parser.return_error_num}"
	if (parser.return_error_num==0)
	  parser.make_asm(code)
	else
	  puts("no output assembla")
    end
  rescue ParseError
    puts $!
	p @q
  end
#end
