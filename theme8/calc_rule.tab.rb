#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.11
# from Racc grammer file "".
#

require 'racc/parser.rb'
class TinyCC < Racc::Parser
##### State transition tables begin ###

racc_action_table = [
     6,    60,    54,    24,    10,    32,    20,    43,    35,    64,
    36,    37,    21,    54,    51,    19,     5,    53,    77,    63,
    65,    54,    24,    14,    32,    51,    43,    35,    53,    36,
    37,    10,    99,    51,    54,    24,    53,    32,    56,    43,
    35,    64,    36,    37,    24,    54,    51,    54,   101,    53,
    43,    54,    43,    54,    56,   102,    77,    51,    43,    51,
    53,   103,    53,    51,    54,    51,    53,   100,    53,    43,
    54,    19,    54,    56,    28,    77,    51,    77,    54,    53,
    72,    73,    51,    77,    51,    53,    54,    53,    66,    67,
    51,    77,    10,    53,    54,    24,    28,    32,    51,    43,
    35,    53,    36,    37,    57,    54,    51,    54,    58,    53,
    77,    54,    43,    54,    12,    13,    43,    51,    43,    51,
    53,    62,    53,    51,    65,    51,    53,    11,    53,    54,
    24,    54,    32,    10,    43,    35,    77,    36,    37,   107,
    54,    51,    54,    51,    53,    77,    53,    77,    54,    74,
    75,     5,    51,    77,    51,    53,    54,    53,    74,    75,
    51,    77,    54,    53,    54,    82,    56,    43,    51,    77,
   nil,    53,    55,    56,    51,   nil,    51,    53,   nil,    53,
    68,    69,    70,    71,    68,    69,    70,    71,    68,    69,
    70,    71,    72,    73,    72,    73,    72,    73,    72,    73,
    74,    75,    66,    67 ]

racc_action_check = [
     1,    38,    38,    38,    13,    38,    17,    38,    38,    43,
    38,    38,    17,    70,    38,    16,     1,    38,    70,    43,
    84,   101,   101,     9,   101,    70,   101,   101,    70,   101,
   101,    19,    78,   101,   100,   100,   101,   100,    78,   100,
   100,    77,   100,   100,    20,    58,   100,    57,    81,   100,
    58,    62,    57,    56,    81,    86,    62,    58,    56,    57,
    58,    86,    57,    62,    54,    56,    62,    80,    56,    54,
    75,    21,    74,    80,    27,    75,    54,    74,    73,    54,
    94,    94,    75,    73,    74,    75,    72,    74,    45,    45,
    73,    72,    28,    73,    29,    29,    29,    29,    72,    29,
    29,    72,    29,    29,    35,    71,    29,   103,    36,    29,
    71,    63,   103,    37,     8,     8,    63,    71,    37,   103,
    71,    42,   103,    63,    44,    37,    63,     6,    37,   107,
   107,    68,   107,     5,   107,   107,    68,   107,   107,   104,
    51,   107,    67,    68,   107,    51,    68,    67,    66,    96,
    96,     0,    51,    66,    67,    51,    65,    67,    95,    95,
    66,    65,    64,    66,    69,    59,    59,    64,    65,    69,
   nil,    65,    33,    33,    64,   nil,    69,    64,   nil,    69,
    46,    46,    46,    46,    89,    89,    89,    89,    90,    90,
    90,    90,    93,    93,    92,    92,    91,    91,    47,    47,
    48,    48,    88,    88 ]

racc_action_pointer = [
   135,     0,   nil,   nil,   nil,   114,   127,   nil,    97,     9,
   nil,   nil,   nil,   -15,   nil,   nil,    -1,    -6,   nil,    12,
    29,    55,   nil,   nil,   nil,   nil,   nil,    58,    73,    80,
   nil,   nil,   nil,   155,   nil,    90,    94,    99,   -12,   nil,
   nil,   nil,   110,    -5,   114,    82,   178,   173,   173,   nil,
   nil,   126,   nil,   nil,    50,   nil,    39,    33,    31,   148,
   nil,   nil,    37,    97,   148,   142,   134,   128,   117,   150,
    -1,    91,    72,    64,    58,    56,   nil,    27,    20,   nil,
    55,    36,   nil,   nil,    10,   nil,    43,   nil,   196,   182,
   186,   171,   169,   167,    55,   131,   122,   nil,   nil,   nil,
    20,     7,   nil,    93,   118,   nil,   nil,   115,   nil ]

racc_action_default = [
   -64,   -64,    -1,    -3,    -4,   -64,   -64,    -2,   -64,    -6,
    -8,   109,    -5,   -64,    -9,    -7,   -14,   -64,   -12,   -64,
   -64,   -64,   -15,   -10,   -23,   -13,   -11,   -28,   -64,   -31,
   -26,    -6,   -16,   -64,   -18,   -64,   -64,   -64,   -64,   -27,
   -29,   -32,   -34,   -58,   -36,   -38,   -40,   -43,   -48,   -51,
   -54,   -64,   -56,   -59,   -64,   -17,   -64,   -64,   -64,   -64,
   -24,   -30,   -64,   -64,   -63,   -64,   -64,   -64,   -64,   -64,
   -64,   -64,   -64,   -64,   -64,   -64,   -55,   -58,   -64,   -33,
   -64,   -64,   -22,   -25,   -37,   -35,   -64,   -61,   -39,   -41,
   -42,   -44,   -45,   -46,   -47,   -49,   -50,   -52,   -53,   -60,
   -64,   -64,   -57,   -64,   -19,   -21,   -62,   -64,   -20 ]

racc_goto_table = [
    40,    76,    59,    79,     9,    30,    29,    39,    18,    61,
    85,    87,    15,    25,    91,    92,    93,    94,    22,    78,
    89,    90,    80,    81,    97,    98,    38,    31,    95,    96,
     2,     7,    27,    83,    26,    84,    88,    16,    23,    17,
     1,    86,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   106,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   104,   105,   nil,   nil,   nil,   nil,   nil,   108 ]

racc_goto_check = [
    12,    25,    13,    18,     6,     3,    14,     3,    11,    12,
    18,    18,     6,    11,    23,    23,    23,    23,     6,    13,
    22,    22,    13,    13,    25,    25,    15,     6,    24,    24,
     2,     2,    16,    17,    10,    20,    21,     9,     8,     7,
     1,    28,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    18,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    12,    12,   nil,   nil,   nil,   nil,   nil,    12 ]

racc_goto_pointer = [
   nil,    40,    30,   -22,   nil,   nil,    -1,    23,    18,    23,
    11,    -8,   -29,   -35,   -21,    -3,     8,   -27,   -53,   nil,
   -27,   -29,   -46,   -54,   -44,   -50,   nil,   nil,   -23 ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4,     8,   nil,   nil,    34,   nil,
   nil,   nil,   nil,    33,   nil,   nil,   nil,   nil,    41,    42,
    44,    45,    46,    47,    48,    49,    50,    52,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 31, :_reduce_1,
  2, 31, :_reduce_2,
  1, 32, :_reduce_3,
  1, 32, :_reduce_4,
  3, 33, :_reduce_5,
  1, 35, :_reduce_6,
  3, 35, :_reduce_7,
  1, 36, :_reduce_8,
  0, 39, :_reduce_9,
  0, 40, :_reduce_10,
  8, 34, :_reduce_11,
  1, 37, :_reduce_12,
  3, 37, :_reduce_13,
  0, 37, :_reduce_none,
  2, 41, :_reduce_15,
  1, 42, :_reduce_16,
  2, 42, :_reduce_17,
  1, 42, :_reduce_18,
  5, 42, :_reduce_19,
  7, 42, :_reduce_20,
  5, 42, :_reduce_21,
  3, 42, :_reduce_22,
  0, 46, :_reduce_23,
  0, 47, :_reduce_24,
  6, 38, :_reduce_25,
  1, 44, :_reduce_26,
  2, 44, :_reduce_27,
  0, 44, :_reduce_none,
  1, 45, :_reduce_29,
  2, 45, :_reduce_30,
  0, 45, :_reduce_none,
  1, 43, :_reduce_32,
  3, 43, :_reduce_33,
  1, 48, :_reduce_34,
  3, 48, :_reduce_35,
  1, 49, :_reduce_36,
  3, 49, :_reduce_37,
  1, 50, :_reduce_38,
  3, 50, :_reduce_39,
  1, 51, :_reduce_40,
  3, 51, :_reduce_41,
  3, 51, :_reduce_42,
  1, 52, :_reduce_43,
  3, 52, :_reduce_44,
  3, 52, :_reduce_45,
  3, 52, :_reduce_46,
  3, 52, :_reduce_47,
  1, 53, :_reduce_48,
  3, 53, :_reduce_49,
  3, 53, :_reduce_50,
  1, 54, :_reduce_51,
  3, 54, :_reduce_52,
  3, 54, :_reduce_53,
  1, 55, :_reduce_54,
  2, 55, :_reduce_55,
  1, 56, :_reduce_56,
  4, 56, :_reduce_57,
  1, 57, :_reduce_58,
  1, 57, :_reduce_59,
  3, 57, :_reduce_60,
  1, 58, :_reduce_61,
  3, 58, :_reduce_62,
  0, 58, :_reduce_none ]

racc_reduce_n = 64

racc_shift_n = 109

racc_token_table = {
  false => 0,
  :error => 1,
  "<" => 2,
  ">" => 3,
  "<=" => 4,
  ">=" => 5,
  "==" => 6,
  "!=" => 7,
  "&" => 8,
  "|" => 9,
  "&&" => 10,
  "||" => 11,
  ")" => 12,
  "}" => 13,
  "(" => 14,
  "{" => 15,
  :RESERVED => 16,
  ";" => 17,
  "," => 18,
  :IDENTIFIER => 19,
  "if" => 20,
  "else" => 21,
  "while" => 22,
  "return" => 23,
  "=" => 24,
  "+" => 25,
  "-" => 26,
  "*" => 27,
  "/" => 28,
  :CONSTANT => 29 }

racc_nt_base = 30

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "\"<\"",
  "\">\"",
  "\"<=\"",
  "\">=\"",
  "\"==\"",
  "\"!=\"",
  "\"&\"",
  "\"|\"",
  "\"&&\"",
  "\"||\"",
  "\")\"",
  "\"}\"",
  "\"(\"",
  "\"{\"",
  "RESERVED",
  "\";\"",
  "\",\"",
  "IDENTIFIER",
  "\"if\"",
  "\"else\"",
  "\"while\"",
  "\"return\"",
  "\"=\"",
  "\"+\"",
  "\"-\"",
  "\"*\"",
  "\"/\"",
  "CONSTANT",
  "$start",
  "program",
  "external_declaration",
  "declaration",
  "function_definition",
  "declarator_list",
  "declarator",
  "parameter_type_list",
  "compound_statement",
  "@1",
  "@2",
  "parameter_declaration",
  "statement",
  "expression",
  "declaration_list",
  "statement_list",
  "@3",
  "@4",
  "assign_expr",
  "logical_or_expr",
  "logical_and_expr",
  "equality_expr",
  "relational_expr",
  "add_expr",
  "mult_expr",
  "unary_expr",
  "postfix_expr",
  "primary_expr",
  "argument_expression_list" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'calc_rule.y', 19)
  def _reduce_1(val, _values, result)
    result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 20)
  def _reduce_2(val, _values, result)
    result =#[val[0],val[1]]}
		                                         val[0]+[val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 23)
  def _reduce_3(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 24)
  def _reduce_4(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 26)
  def _reduce_5(val, _values, result)
    result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 29)
  def _reduce_6(val, _values, result)
    #result = [val[0]]}
	                                    result = [make_decl(val[0])]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 31)
  def _reduce_7(val, _values, result)
    result = val[0].push(make_decl(val[2]))
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 33)
  def _reduce_8(val, _values, result)
    #result = [val[0]]}
	                      result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 36)
  def _reduce_9(val, _values, result)
    @cur_lev += 1
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 36)
  def _reduce_10(val, _values, result)
    stack_pop
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 38)
  def _reduce_11(val, _values, result)
    	                                                                                       #@cur_lev += 1
	                                                                                       #result = ["func",make_fun_def(val[1],val[4]),val[4],val[6]]
																						   result = ["func",make_fun_def(val[1],val[4])].push(val[4]).push(val[6])
																						   @param_add = 4
																						   #@cur_lev
																						   
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 45)
  def _reduce_12(val, _values, result)
    result = [make_param(val[0])]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 46)
  def _reduce_13(val, _values, result)
    result = val[0].push(make_param(val[2]))
    result
  end
.,.,

# reduce 14 omitted

module_eval(<<'.,.,', 'calc_rule.y', 50)
  def _reduce_15(val, _values, result)
    result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 52)
  def _reduce_16(val, _values, result)
    
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 53)
  def _reduce_17(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 54)
  def _reduce_18(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 55)
  def _reduce_19(val, _values, result)
    result = ["IF", val[2],val[4]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 56)
  def _reduce_20(val, _values, result)
    result = ["IF",val[2],val[4],val[6]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 57)
  def _reduce_21(val, _values, result)
    result = ["WHILE",val[2],val[4]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 58)
  def _reduce_22(val, _values, result)
    result = ["RETURN",val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 60)
  def _reduce_23(val, _values, result)
    @cur_lev += 1
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 60)
  def _reduce_24(val, _values, result)
    stack_pop
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 61)
  def _reduce_25(val, _values, result)
    	                                                         #@cur_lev += 1
															 #result = [val[1],val[2]]
															 result = ["comp",val[2],val[3]]
															 #@cur_lev -= 1
															 
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 67)
  def _reduce_26(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 70)
  def _reduce_27(val, _values, result)
    					                              result = val[0]+[val[1]]
    result
  end
.,.,

# reduce 28 omitted

module_eval(<<'.,.,', 'calc_rule.y', 73)
  def _reduce_29(val, _values, result)
    result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 74)
  def _reduce_30(val, _values, result)
    result = val[0] + [val[1]]
    result
  end
.,.,

# reduce 31 omitted

module_eval(<<'.,.,', 'calc_rule.y', 77)
  def _reduce_32(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 78)
  def _reduce_33(val, _values, result)
    result = [val[0],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 80)
  def _reduce_34(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 81)
  def _reduce_35(val, _values, result)
    #result=[val[1],val[0],val[2]]}
			                                result = [val[1],ref_var(val[0]),val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 84)
  def _reduce_36(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 85)
  def _reduce_37(val, _values, result)
    result = [val[1],val[0],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 87)
  def _reduce_38(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 88)
  def _reduce_39(val, _values, result)
    result = [val[1],val[0],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 90)
  def _reduce_40(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 91)
  def _reduce_41(val, _values, result)
    result = [val[1],val[0],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 92)
  def _reduce_42(val, _values, result)
    result = [val[1],val[0],val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 94)
  def _reduce_43(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 95)
  def _reduce_44(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 96)
  def _reduce_45(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 97)
  def _reduce_46(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 98)
  def _reduce_47(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 100)
  def _reduce_48(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 102)
  def _reduce_49(val, _values, result)
    			                         #puts("PLUS!!!")
			                         result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 104)
  def _reduce_50(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 106)
  def _reduce_51(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 107)
  def _reduce_52(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 108)
  def _reduce_53(val, _values, result)
    result = [val[1], val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 110)
  def _reduce_54(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 111)
  def _reduce_55(val, _values, result)
    result = [val[0], val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 113)
  def _reduce_56(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 114)
  def _reduce_57(val, _values, result)
    #result = ["FCALL", val[0] ,val[2]]}
				                                             result = ref_fun(val[0],val[2].size).push(val[2])
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 118)
  def _reduce_58(val, _values, result)
    result = ref_var(val[0])
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 119)
  def _reduce_59(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 120)
  def _reduce_60(val, _values, result)
    result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 122)
  def _reduce_61(val, _values, result)
    result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'calc_rule.y', 123)
  def _reduce_62(val, _values, result)
    result =  val[0]+[val[2]]
    result
  end
.,.,

# reduce 63 omitted

def _reduce_none(val, _values, result)
  val[0]
end

end   # class TinyCC
