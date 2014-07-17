#ラベルの挿i入の問題　最悪配列引数に取って制御構造で頑張る

def emit(inst,op1,op2)
  str = ""
  if(op1 == nil)
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

def arith(statement)
  #statement[0]=演算子,statament[1]=非演算子,statement[2]=非演算子
  #演算子について再帰的に行わなくてはならない　算術式のみならいいけど関数がある可能性ある
  #まずif while はなしでstamentを解析する。代入,計算,関数呼び出しなのでまず場合分け？式の途中で代入文はこないのでそれでいい
  case statement[0]
    when "="
	  #右側の値を左側にmov しかし再帰的にやらないといけないですね？内側から上のほうにeaxに計算結果を収納するコードを吐けばいい気がする　ということは「底」判定が必要な気がするんだよな　要するにオペランドをこれより深くもぐれますか？で判定すればいい気がする　変数、定数ならスルーでもよい？
	  #「計算結果をeaxに入れておく」ということと左辺でarith(statement)を呼び出すことは違いますよ（あとで
	  puts "mov [ebp#{statement[1][3]}] eax"
	  arith(statement[2])
	when "func"
	when "+"
	  tmp = allocate_loc
	  arith(statement[1])#右オペランドのコード生成
	  puts "mov [ebp#{tmp}] eax"
	  arith(statement[2])
	  puts "add eax [ebp#{tmp}]"
	  release_loc
	when "-"
	  tmp = allocate_loc
	  arith(statement[1])#右オペランドのコード生成
	  puts "mov [ebp#{tmp}] eax"
	  arith(statement[2])
	  puts "sub eax [ebp#{tmp}]"
	  release_loc
	when "*"
	  tmp = self.allocate_loc
	  arith(statement[1])#右オペランドのコード生成
	  puts "mov [ebp#{tmp}] eax"
	  arith(statement[2])
	  puts "sub eax [ebp#{tmp}]"
	  release_loc
	when "/"

    else
	  case statement[1]
	   when "VAR"
	     if(statement[2]!=0)
		   return "[ebp#{allocate_loc}]"
		 else
           return "[ebp 大域変数番地]"
	   when "PARM"
	     return "[ebp#{statement[3]}]"
	   when "CONSTANT"
	     return "#{statement[0]}"
	  else
	    return statement
	  end
  end

end

def make_asm(syntax_tree)
  @global_var = []#大域変数がとりあえずこの中にある。（大域変数って使うのか？）
  @statement_list = []
  @asm_code = []#アセンブリコードの配列
  #puts syntax_tree.to_s
  syntax_tree.each do |i|
    case i[0]
	  when "func"
	    #i[1](関数名)、i[2](引数リスト)を使って関数テンプレート出力
        @asm_code.push("\tGLOBAL\t#{i[1][0]}\n")
		@asm_code.push("#{i[1][0]}\tpush\tebp\n")
		@asm_code.push(emit("mov","ebp","esp"))
		@asm_code.push(emit("sub","esp","Nlocal"))
        analyze_compound(i[3],@statement_list)#関数本体のコード
		@statement_list.each do |st|
		  arith(st)
		end

		@asm_code.push("Lret\tmov\tesp,ebp\n")
		@asm_code.push(emit("pop","ebp",nil))
        @asm_code.push(emit("ret",nil,nil))
	  else
	    i.each do |var|
		  @global_var.push(var)
 	   end
	end
    puts
  end
  #puts @asm_code.to_s
  puts "@statementlist"
  @statement_list.each do |i|
    puts i.to_s
  end
  #@asm_code.each do |i|
  #  puts i
  #end
end
