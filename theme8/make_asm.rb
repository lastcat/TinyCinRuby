#ラベルの挿入の問題　最悪配列引数に取って制御構造で頑張る
def emit(inst,op1,op2)
  str = ""
  if(op1 == nil)
    str = "\t#{inst}\n"
  elsif(op2 == nil)
    str = "\t#{inst}\t#{op1}\n"
  else 
    str = "\t#{inst}\t#{op1},#{op2}\n"
  end
  puts str 
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
  @statement_list.each do |i|
    puts i.to_s
  end
end
