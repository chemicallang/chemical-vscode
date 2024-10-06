; ModuleID = 'chemical-tests'
source_filename = "chemical-tests"

%PointSome = type { i32, i32 }
%LambFactory = type {}
%LambdaProvider = type { ptr }
%Nested = type { %LambdaProvider }
%SelfLambda = type { i32, ptr }
%ProvideStructLamb = type { ptr }
%ProvideSelfRefStructLamb = type { i32, ptr }
%Point = type { i32, i32 }
%Container = type { [2 x i32], i1 }
%Animal = type { i64, i64 }
%Dog = type { %WalkingAnimal, i64, i64 }
%WalkingAnimal = type { %Animal, i64 }
%Pair = type { i32, i32 }
%ImpPair = type { i32 }
%DeeplyNested = type { %DeeplyNested1 }
%DeeplyNested1 = type { %DeeplyNested2 }
%DeeplyNested2 = type { %DeeplyNested3 }
%DeeplyNested3 = type { i32 }
%PointerStr = type { ptr }
%ImpContainer = type { %ImpPair }
%IntPair = type { %Pair }
%EnumThing = type { i32 }
%string = type { { { ptr, i64, i64 } }, i8 }
%Str = type { ptr }
%DataStr1 = type { i32 }
%PMC22 = type { i32, i32 }
%TestStruct1 = type { i32, i32 }
%SnoPair = type { i32, i32 }
%MemLamb = type { ptr }
%TestStruct2 = type { %TestStruct1 }
%GenDestruct = type { i64, ptr, ptr }
%Destructible = type { i32, ptr, ptr }
%my_string = type {}
%OptDestructible = type { i32, { { %Destructible } } }
%GenDestructOwner = type { %GenDestruct }
%Holder1 = type { %Destructible }
%GenDestruct.0 = type { i32, ptr, ptr }
%GenDestruct.1 = type { i16, ptr, ptr }
%union.IntDoubleUnion = type { double }
%union.TwoStructs = type { { ptr, i64 } }
%Pair2 = type { i32, i32 }
%Pair66 = type { i32, i32 }
%CompTimeCounter = type {}
%OtherGen9 = type { i32 }
%OtherVar1 = type { i32, { { i32 } } }
%PairGen = type { i32, i32 }
%PairGen.3 = type { i64, i64 }
%PairGen.4 = type { i16, i16 }
%OtherGen9.5 = type { i64 }
%OV1Point = type { i32, i32, i32 }
%ShortPairGen = type { %PairGen.4 }
%OtherVar1.2 = type { i32, { { %OV1Point } } }
%DeduceThing = type { i32 }
%DeduceThing.6 = type { i64 }
%vector = type { ptr, i64, i64 }
%vector.7 = type { ptr, i64, i64 }
%ArrayRef = type { ptr, i64 }
%Option = type { i32, { { i32 } } }
%Result = type { i32, { { i32 } } }
%SmartPhone = type { i32, i32 }
%CellPhone = type { i32, i32 }
%PhoneContainer = type { { ptr, ptr } }
%OptVariant = type { i32, { { i32 } } }
%GenVar = type { i32, { { i32, i32, i32 } } }
%ContOptVariant = type { %OptVariant }

@ANSI_COLOR_RESET = private unnamed_addr constant [5 x i8] c"\1B[0m\00", align 1
@ANSI_COLOR_RED = private unnamed_addr constant [6 x i8] c"\1B[31m\00", align 1
@ANSI_COLOR_GREEN = private unnamed_addr constant [6 x i8] c"\1B[32m\00", align 1
@ANSI_COLOR_YELLOW = private unnamed_addr constant [6 x i8] c"\1B[33m\00", align 1
@ANSI_COLOR_BLUE = private unnamed_addr constant [6 x i8] c"\1B[34m\00", align 1
@ANSI_COLOR_MAGENTA = private unnamed_addr constant [6 x i8] c"\1B[35m\00", align 1
@ANSI_COLOR_CYAN = private unnamed_addr constant [6 x i8] c"\1B[36m\00", align 1
@ANSI_COLOR_WHITE = private unnamed_addr constant [6 x i8] c"\1B[37m\00", align 1
@0 = private unnamed_addr constant [8 x i8] c"%s%s%s\0A\00", align 1
@1 = private unnamed_addr constant [8 x i8] c"%s%s%s\0A\00", align 1
@total_tests = private global i32 0
@tests_passed = private global i32 0
@tests_failed = private global i32 0
@2 = private unnamed_addr constant [29 x i8] c"%sTest %d [%s] succeeded %s\0A\00", align 1
@3 = private unnamed_addr constant [26 x i8] c"%sTest %d [%s] failed %s\0A\00", align 1
@4 = private unnamed_addr constant [9 x i8] c"Total %d\00", align 1
@5 = private unnamed_addr constant [15 x i8] c" %sPassed %d%s\00", align 1
@6 = private unnamed_addr constant [4 x i8] c" %s\00", align 1
@7 = private unnamed_addr constant [4 x i8] c" %s\00", align 1
@8 = private unnamed_addr constant [10 x i8] c"Failed %d\00", align 1
@9 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@10 = private unnamed_addr constant [24 x i8] c"%sExpected %s Got %s%s\0A\00", align 1
@11 = private unnamed_addr constant [35 x i8] c"testing non capturing lambda works\00", align 1
@12 = private unnamed_addr constant [36 x i8] c"testing lambda without braces works\00", align 1
@13 = private unnamed_addr constant [35 x i8] c"testing non capturing lambda works\00", align 1
@14 = private unnamed_addr constant [32 x i8] c"lambdas created by structs work\00", align 1
@15 = private unnamed_addr constant [48 x i8] c"testing non capturing lambda works without body\00", align 1
@16 = private unnamed_addr constant [63 x i8] c"testing non capturing lambda can be passed to capturing lambda\00", align 1
@17 = private unnamed_addr constant [64 x i8] c"testing capturing lambda type works with empty capturing lambda\00", align 1
@18 = private unnamed_addr constant [62 x i8] c"testing capturing lambda can capture primitive bool value - 1\00", align 1
@19 = private unnamed_addr constant [62 x i8] c"testing capturing lambda can capture primitive bool value - 2\00", align 1
@20 = private unnamed_addr constant [44 x i8] c"testing capturing lambda can capture by ref\00", align 1
@21 = private unnamed_addr constant [57 x i8] c"testing capturing lambda can be passed between functions\00", align 1
@22 = private unnamed_addr constant [43 x i8] c"can initialize and call a capturing lambda\00", align 1
@23 = private unnamed_addr constant [38 x i8] c"can pass function pointer as lambda 1\00", align 1
@24 = private unnamed_addr constant [38 x i8] c"can pass function pointer as lambda 2\00", align 1
@25 = private unnamed_addr constant [32 x i8] c"can call lambda from a variable\00", align 1
@26 = private unnamed_addr constant [37 x i8] c"can call lambda without knowing type\00", align 1
@27 = private unnamed_addr constant [33 x i8] c"can call lambda stored in struct\00", align 1
@28 = private unnamed_addr constant [42 x i8] c"can call lambda stored nested in a struct\00", align 1
@29 = private unnamed_addr constant [35 x i8] c"can call lambda stored in an array\00", align 1
@30 = private unnamed_addr constant [30 x i8] c"a function can return lambdas\00", align 1
@31 = private unnamed_addr constant [22 x i8] c"supports self lambdas\00", align 1
@32 = private unnamed_addr constant [29 x i8] c"lambda can return struct - 1\00", align 1
@33 = private unnamed_addr constant [29 x i8] c"lambda can return struct - 2\00", align 1
@34 = private unnamed_addr constant [48 x i8] c"lambdas with self reference can return a struct\00", align 1
@35 = private unnamed_addr constant [15 x i8] c"4 + 2 / 2 == 5\00", align 1
@36 = private unnamed_addr constant [15 x i8] c"4 / 2 + 2 == 4\00", align 1
@37 = private unnamed_addr constant [25 x i8] c"3 * (4 + 2) - 8 / 2 == 5\00", align 1
@38 = private unnamed_addr constant [26 x i8] c"3 * (4 + 2) - 8 / 2 == 14\00", align 1
@39 = private unnamed_addr constant [25 x i8] c"8 / (2 + 2) * 3 - 1 == 5\00", align 1
@40 = private unnamed_addr constant [32 x i8] c"(5 + 3) * 2 - 4 / (1 + 1) == 14\00", align 1
@41 = private unnamed_addr constant [20 x i8] c"single braced value\00", align 1
@42 = private unnamed_addr constant [35 x i8] c"Simple addition and multiplication\00", align 1
@43 = private unnamed_addr constant [38 x i8] c"Addition, subtraction, multiplication\00", align 1
@44 = private unnamed_addr constant [28 x i8] c"Division and multiplication\00", align 1
@45 = private unnamed_addr constant [28 x i8] c"Brackets and multiplication\00", align 1
@46 = private unnamed_addr constant [22 x i8] c"Brackets and division\00", align 1
@47 = private unnamed_addr constant [19 x i8] c"Complex expression\00", align 1
@48 = private unnamed_addr constant [16 x i8] c"Nested brackets\00", align 1
@49 = private unnamed_addr constant [33 x i8] c"Expression with negative numbers\00", align 1
@50 = private unnamed_addr constant [29 x i8] c"double with integer addition\00", align 1
@51 = private unnamed_addr constant [32 x i8] c"Expression with decimal numbers\00", align 1
@52 = private unnamed_addr constant [26 x i8] c"Expression with variables\00", align 1
@53 = private unnamed_addr constant [23 x i8] c"Expression with modulo\00", align 1
@54 = private unnamed_addr constant [33 x i8] c"Expression with mixed operations\00", align 1
@55 = private unnamed_addr constant [40 x i8] c"Longer expression with mixed operations\00", align 1
@56 = private unnamed_addr constant [48 x i8] c"Expression with nested brackets and subtraction\00", align 1
@57 = private unnamed_addr constant [50 x i8] c"Expression with multiple division and subtraction\00", align 1
@58 = private unnamed_addr constant [43 x i8] c"Expression with consecutive multiplication\00", align 1
@59 = private unnamed_addr constant [37 x i8] c"Expression with consecutive division\00", align 1
@60 = private unnamed_addr constant [37 x i8] c"Expression with consecutive addition\00", align 1
@61 = private unnamed_addr constant [40 x i8] c"Expression with consecutive subtraction\00", align 1
@62 = private unnamed_addr constant [54 x i8] c"Expression with mixed operations and negative numbers\00", align 1
@63 = private unnamed_addr constant [42 x i8] c"Expression with complex nested operations\00", align 1
@64 = private unnamed_addr constant [34 x i8] c"Expression with repeated brackets\00", align 1
@65 = private unnamed_addr constant [27 x i8] c"Negative braced expression\00", align 1
@66 = private unnamed_addr constant [38 x i8] c"test pointer math in expressions work\00", align 1
@67 = private unnamed_addr constant [17 x i8] c"comparing floats\00", align 1
@68 = private unnamed_addr constant [29 x i8] c"comparing float expr with fp\00", align 1
@69 = private unnamed_addr constant [38 x i8] c"comparing float with int expr with fp\00", align 1
@70 = private unnamed_addr constant [35 x i8] c"comparing float with referenced fp\00", align 1
@71 = private unnamed_addr constant [41 x i8] c"comparing float with referenced int expr\00", align 1
@72 = private unnamed_addr constant [18 x i8] c"comparing doubles\00", align 1
@73 = private unnamed_addr constant [34 x i8] c"comparing double expr with double\00", align 1
@74 = private unnamed_addr constant [43 x i8] c"comparing double with int expr with double\00", align 1
@75 = private unnamed_addr constant [40 x i8] c"comparing double with referenced double\00", align 1
@76 = private unnamed_addr constant [42 x i8] c"comparing double with referenced int expr\00", align 1
@77 = internal constant { ptr, ptr, ptr, ptr, ptr, ptr } { ptr @Calculator.sum, ptr @Calculator.divide, ptr @Calculator.multiply, ptr @Calculator.multiplyP, ptr @Calculator.divideP, ptr @Calculator.avg }
@78 = internal constant { ptr } { ptr @Summer.summer_sum }
@MyInt = private constant i32 5
@79 = private unnamed_addr constant [20 x i8] c"global constant int\00", align 1
@80 = private unnamed_addr constant [17 x i8] c"address of works\00", align 1
@81 = private unnamed_addr constant [25 x i8] c"checkout the address %p\0A\00", align 1
@82 = private unnamed_addr constant [20 x i8] c"dereferencing works\00", align 1
@83 = private unnamed_addr constant [9 x i8] c"for loop\00", align 1
@84 = private unnamed_addr constant [11 x i8] c"while loop\00", align 1
@85 = private unnamed_addr constant [14 x i8] c"do while loop\00", align 1
@86 = private unnamed_addr constant [17 x i8] c"switch statement\00", align 1
@87 = private unnamed_addr constant [38 x i8] c"switch doesn't fallthrough by default\00", align 1
@88 = private unnamed_addr constant [28 x i8] c"struct value initialization\00", align 1
@89 = private unnamed_addr constant [34 x i8] c"struct functions without self ref\00", align 1
@90 = private unnamed_addr constant [33 x i8] c"direct calls to struct functions\00", align 1
@91 = private unnamed_addr constant [31 x i8] c"struct functions with self ref\00", align 1
@92 = private unnamed_addr constant [11 x i8] c"test array\00", align 1
@93 = private unnamed_addr constant [25 x i8] c"test uninitialized array\00", align 1
@94 = private unnamed_addr constant [42 x i8] c"test multidimensional uninitialized array\00", align 1
@95 = private unnamed_addr constant [22 x i8] c"array inside a struct\00", align 1
@96 = private unnamed_addr constant [29 x i8] c"test multi dimensional array\00", align 1
@97 = private unnamed_addr constant [20 x i8] c"typealias statement\00", align 1
@98 = private unnamed_addr constant [39 x i8] c"can call functions declared below call\00", align 1
@99 = private unnamed_addr constant [46 x i8] c"can call interface defined functions directly\00", align 1
@100 = private unnamed_addr constant [47 x i8] c"can call interface declared functions directly\00", align 1
@101 = private unnamed_addr constant [51 x i8] c"call interface method from overridden struct value\00", align 1
@102 = private unnamed_addr constant [45 x i8] c"can call implemented impl functions directly\00", align 1
@103 = private unnamed_addr constant [55 x i8] c"can call implemented impl functions using struct value\00", align 1
@104 = private unnamed_addr constant [62 x i8] c"functions inside struct can call functions inherited directly\00", align 1
@105 = private unnamed_addr constant [78 x i8] c"overridden interface struct functions implemented inside struct with self ref\00", align 1
@106 = private unnamed_addr constant [78 x i8] c"overridden interface struct functions implemented inside struct with self ref\00", align 1
@107 = private unnamed_addr constant [83 x i8] c"overridden interface struct functions implemented using impl keyword with self ref\00", align 1
@108 = private unnamed_addr constant [44 x i8] c"impl block can call functions in the struct\00", align 1
@109 = private unnamed_addr constant [24 x i8] c"supports null value - 1\00", align 1
@110 = private unnamed_addr constant [24 x i8] c"supports null value - 2\00", align 1
@111 = private unnamed_addr constant [29 x i8] c"can store struct in an array\00", align 1
@112 = private unnamed_addr constant [25 x i8] c"extension functions work\00", align 1
@113 = private unnamed_addr constant [50 x i8] c"functions of interface implemented outside struct\00", align 1
@glob_const = private constant i32 800
@114 = private unnamed_addr constant [32 x i8] c"can initialize normal variables\00", align 1
@115 = private unnamed_addr constant [21 x i8] c"can modify variables\00", align 1
@116 = private unnamed_addr constant [41 x i8] c"can assign to a non initialized variable\00", align 1
@117 = private unnamed_addr constant [32 x i8] c"can initialize a typed variable\00", align 1
@118 = private unnamed_addr constant [31 x i8] c"global comptime constants work\00", align 1
@119 = private unnamed_addr constant [22 x i8] c"global constants work\00", align 1
@120 = private unnamed_addr constant [29 x i8] c"local constants work as well\00", align 1
@121 = private unnamed_addr constant [45 x i8] c"passing base struct as a base struct pointer\00", align 1
@122 = private unnamed_addr constant [49 x i8] c"passing a derived struct as a base class pointer\00", align 1
@123 = private unnamed_addr constant [53 x i8] c"can access base struct members from derived directly\00", align 1
@124 = private unnamed_addr constant [46 x i8] c"can access middle struct members from derived\00", align 1
@125 = private unnamed_addr constant [41 x i8] c"base struct function on derived succeeds\00", align 1
@126 = private unnamed_addr constant [64 x i8] c"can successfully access base struct members from derived struct\00", align 1
@127 = private unnamed_addr constant [43 x i8] c"middle struct function on derived succeeds\00", align 1
@128 = private unnamed_addr constant [45 x i8] c"derived struct functions on derived succeeds\00", align 1
@129 = private unnamed_addr constant [34 x i8] c"can return a newly created struct\00", align 1
@130 = private unnamed_addr constant [53 x i8] c"can return a newly created struct that is referenced\00", align 1
@131 = private unnamed_addr constant [27 x i8] c"deeply nested struct works\00", align 1
@132 = private unnamed_addr constant [48 x i8] c"pointer to struct inside a struct allows access\00", align 1
@133 = private unnamed_addr constant [60 x i8] c"struct members can be accessed without using self. or this.\00", align 1
@134 = private unnamed_addr constant [54 x i8] c"struct functions can be accessed using self. or this.\00", align 1
@135 = private unnamed_addr constant [62 x i8] c"struct functions can be accessed without using self. or this.\00", align 1
@136 = private unnamed_addr constant [61 x i8] c"functions present outside struct can be called inside struct\00", align 1
@137 = private unnamed_addr constant [38 x i8] c"test struct constructor can be called\00", align 1
@138 = private unnamed_addr constant [48 x i8] c"test direct struct values can be passed as args\00", align 1
@139 = private unnamed_addr constant [72 x i8] c"test const function calls returning struct values can be passed as args\00", align 1
@140 = private unnamed_addr constant [47 x i8] c"test const struct values can be passed as args\00", align 1
@141 = private unnamed_addr constant [67 x i8] c"test that function calls that return struct, can be passed as args\00", align 1
@142 = private unnamed_addr constant [54 x i8] c"implicit constructors work in function parameters - 1\00", align 1
@143 = private unnamed_addr constant [54 x i8] c"implicit constructors work in function parameters - 2\00", align 1
@144 = private unnamed_addr constant [46 x i8] c"implicit constructors inside structs work - 1\00", align 1
@145 = private unnamed_addr constant [46 x i8] c"implicit constructors inside structs work - 2\00", align 1
@146 = private unnamed_addr constant [51 x i8] c"implicit constructors inside array values work - 1\00", align 1
@147 = private unnamed_addr constant [51 x i8] c"implicit constructors inside array values work - 2\00", align 1
@148 = private unnamed_addr constant [41 x i8] c"implicit constructors in return work - 1\00", align 1
@149 = private unnamed_addr constant [41 x i8] c"implicit constructors in return work - 2\00", align 1
@150 = private unnamed_addr constant [43 x i8] c"contained pair can be initialized properly\00", align 1
@151 = private unnamed_addr constant [17 x i8] c"enum index works\00", align 1
@152 = private unnamed_addr constant [22 x i8] c"enum comparison works\00", align 1
@153 = private unnamed_addr constant [34 x i8] c"enums can be initialize variables\00", align 1
@154 = private unnamed_addr constant [33 x i8] c"enums can be stored in variables\00", align 1
@155 = private unnamed_addr constant [37 x i8] c"check enums can be stored in structs\00", align 1
@156 = private unnamed_addr constant [41 x i8] c"check enums can be stored in structs - 2\00", align 1
@157 = private unnamed_addr constant [39 x i8] c"check enums can be passed to functions\00", align 1
@158 = private unnamed_addr constant [43 x i8] c"check enums can be passed to functions - 2\00", align 1
@159 = private unnamed_addr constant [43 x i8] c"check enums can be passed to functions - 3\00", align 1
@160 = private unnamed_addr constant [42 x i8] c"test enums can be returned from functions\00", align 1
@161 = private unnamed_addr constant [24 x i8] c"test unsigned int works\00", align 1
@162 = private unnamed_addr constant [17 x i8] c"test short works\00", align 1
@163 = private unnamed_addr constant [26 x i8] c"test unsigned short works\00", align 1
@164 = private unnamed_addr constant [16 x i8] c"test long works\00", align 1
@165 = private unnamed_addr constant [25 x i8] c"test unsigned long works\00", align 1
@166 = private unnamed_addr constant [23 x i8] c"test big integer works\00", align 1
@167 = private unnamed_addr constant [32 x i8] c"test unsigned big integer works\00", align 1
@168 = private unnamed_addr constant [40 x i8] c"test unsigned int demotes int32 to uint\00", align 1
@169 = private unnamed_addr constant [45 x i8] c"test short comparison demotes int32 to short\00", align 1
@170 = private unnamed_addr constant [45 x i8] c"test short comparison demotes int32 to short\00", align 1
@171 = private unnamed_addr constant [47 x i8] c"test ushort comparison demotes int32 to ushort\00", align 1
@172 = private unnamed_addr constant [65 x i8] c"test constant long is demoted to int32 for comparison with int32\00", align 1
@173 = private unnamed_addr constant [27 x i8] c"test short can be assigned\00", align 1
@174 = private unnamed_addr constant [33 x i8] c"test int can be assigned int max\00", align 1
@175 = private unnamed_addr constant [35 x i8] c"test long can be assigned long max\00", align 1
@176 = private unnamed_addr constant [39 x i8] c"test bigint can be assigned bigint max\00", align 1
@177 = private unnamed_addr constant [69 x i8] c"can promote int constants to float when compared with float variable\00", align 1
@178 = private unnamed_addr constant [71 x i8] c"can promote int constants to double when compared with double variable\00", align 1
@179 = private unnamed_addr constant [59 x i8] c"can extend int n type to compare with a different bit type\00", align 1
@180 = private unnamed_addr constant [61 x i8] c"implicit casting at return from lesser to greater int n type\00", align 1
@181 = private unnamed_addr constant [61 x i8] c"implicit casting at return from greater to lesser int n type\00", align 1
@182 = private unnamed_addr constant [28 x i8] c"check string indexing works\00", align 1
@183 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@184 = private unnamed_addr constant [35 x i8] c"test string indexing inside struct\00", align 1
@185 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@186 = private unnamed_addr constant [40 x i8] c"test escaped characters in strings work\00", align 1
@187 = private unnamed_addr constant [3 x i8] c"\0A\09\00", align 1
@188 = private unnamed_addr constant [23 x i8] c"string arrays work too\00", align 1
@189 = private constant [6 x i8] c"hello\00"
@190 = private unnamed_addr constant [34 x i8] c"string arrays over sized work too\00", align 1
@191 = private constant [10 x i8] c"hello\00\00\00\00\00"
@192 = private unnamed_addr constant [32 x i8] c"test two std::strings are equal\00", align 1
@193 = private unnamed_addr constant [12 x i8] c"hello world\00", align 1
@194 = private unnamed_addr constant [12 x i8] c"hello world\00", align 1
@195 = private unnamed_addr constant [36 x i8] c"test two std::strings are not equal\00", align 1
@196 = private unnamed_addr constant [12 x i8] c"hello world\00", align 1
@197 = private unnamed_addr constant [16 x i8] c"not hello world\00", align 1
@198 = private unnamed_addr constant [36 x i8] c"test two std::strings are not equal\00", align 1
@199 = private unnamed_addr constant [12 x i8] c"hello world\00", align 1
@200 = private unnamed_addr constant [16 x i8] c"not hello world\00", align 1
@201 = private unnamed_addr constant [31 x i8] c"test can append in std::string\00", align 1
@202 = private unnamed_addr constant [12 x i8] c"hello world\00", align 1
@203 = private unnamed_addr constant [14 x i8] c"hello worldwo\00", align 1
@204 = private unnamed_addr constant [34 x i8] c"test std::string has correct size\00", align 1
@205 = private unnamed_addr constant [12 x i8] c"hello world\00", align 1
@206 = private unnamed_addr constant [14 x i8] c"hello worldwo\00", align 1
@207 = private unnamed_addr constant [59 x i8] c"test can verify each character in a data pointer of string\00", align 1
@208 = private unnamed_addr constant [103 x i8] c"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\00", align 1
@209 = private unnamed_addr constant [103 x i8] c"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\00", align 1
@210 = private unnamed_addr constant [31 x i8] c"test can append in std::string\00", align 1
@211 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@212 = private unnamed_addr constant [103 x i8] c"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\00", align 1
@213 = private unnamed_addr constant [16 x i8] c"test sizeof int\00", align 1
@214 = private unnamed_addr constant [17 x i8] c"test sizeof long\00", align 1
@215 = private unnamed_addr constant [19 x i8] c"test sizeof struct\00", align 1
@216 = private unnamed_addr constant [28 x i8] c"test evaluation macro works\00", align 1
@217 = private unnamed_addr constant [39 x i8] c"test arrays can be passed to functions\00", align 1
@218 = private unnamed_addr constant [42 x i8] c"can index on struct inside array directly\00", align 1
@219 = private unnamed_addr constant [44 x i8] c"can index on struct inside array indirectly\00", align 1
@220 = private unnamed_addr constant [33 x i8] c"assignment using a pointer works\00", align 1
@221 = private unnamed_addr constant [33 x i8] c"testing basic pointer arithmetic\00", align 1
@222 = private unnamed_addr constant [26 x i8] c"pointer subtraction works\00", align 1
@223 = private unnamed_addr constant [29 x i8] c"pointer comparison works - 1\00", align 1
@224 = private unnamed_addr constant [29 x i8] c"pointer comparison works - 2\00", align 1
@225 = private unnamed_addr constant [29 x i8] c"pointer comparison works - 3\00", align 1
@226 = private unnamed_addr constant [41 x i8] c"pointer access using index operator work\00", align 1
@227 = private unnamed_addr constant [45 x i8] c"can access children after doing pointer math\00", align 1
@228 = private unnamed_addr constant [33 x i8] c"test long value can be truncated\00", align 1
@229 = private unnamed_addr constant [31 x i8] c"test int value can be extended\00", align 1
@230 = private unnamed_addr constant [40 x i8] c"test cast without parenthesis works - 1\00", align 1
@231 = private unnamed_addr constant [40 x i8] c"test cast without parenthesis works - 2\00", align 1
@232 = private unnamed_addr constant [40 x i8] c"test cast without parenthesis works - 3\00", align 1
@233 = private unnamed_addr constant [26 x i8] c"cast double to an integer\00", align 1
@234 = private unnamed_addr constant [23 x i8] c"cast float to a double\00", align 1
@235 = private unnamed_addr constant [21 x i8] c"cast int to a double\00", align 1
@236 = private unnamed_addr constant [20 x i8] c"cast int to a float\00", align 1
@237 = private unnamed_addr constant [25 x i8] c"cast a float to a double\00", align 1
@238 = private unnamed_addr constant [25 x i8] c"cast a double to a float\00", align 1
@239 = private unnamed_addr constant [25 x i8] c"cast a float to a double\00", align 1
@240 = private unnamed_addr constant [25 x i8] c"cast a double to a float\00", align 1
@is_expr_test_func_called = private global i1 false
@241 = private unnamed_addr constant [58 x i8] c"correct function is called when same names overriding - 1\00", align 1
@242 = private unnamed_addr constant [58 x i8] c"correct function is called when same names overriding - 2\00", align 1
@243 = private unnamed_addr constant [58 x i8] c"correct function is called when same names overriding - 3\00", align 1
@244 = private unnamed_addr constant [68 x i8] c"correct function is called when same names overriding in struct - 1\00", align 1
@245 = private unnamed_addr constant [68 x i8] c"correct function is called when same names overriding in struct - 1\00", align 1
@246 = private unnamed_addr constant [68 x i8] c"correct function is called when same names overriding in struct - 1\00", align 1
@247 = private unnamed_addr constant [56 x i8] c"test struct member access in chain, tld function return\00", align 1
@248 = private unnamed_addr constant [59 x i8] c"test struct member access in chain, lambda function return\00", align 1
@249 = private unnamed_addr constant [57 x i8] c"test struct member access in chain, member lambda return\00", align 1
@250 = private unnamed_addr constant [59 x i8] c"test struct member access in chain, member function return\00", align 1
@251 = private unnamed_addr constant [62 x i8] c"test struct member access in chain, extension function return\00", align 1
@252 = private unnamed_addr constant [65 x i8] c"supports function calls that return structs inside struct values\00", align 1
@253 = private unnamed_addr constant [64 x i8] c"supports function calls that return structs inside array values\00", align 1
@254 = private unnamed_addr constant [50 x i8] c"expression test function is not called in 'or' ||\00", align 1
@255 = private unnamed_addr constant [46 x i8] c"expression test function is called in 'or' ||\00", align 1
@256 = private unnamed_addr constant [51 x i8] c"expression test function is not called in 'and' &&\00", align 1
@257 = private unnamed_addr constant [47 x i8] c"expression test function is called in 'and' &&\00", align 1
@258 = private unnamed_addr constant [31 x i8] c"function can take literal type\00", align 1
@my_string_destr_count = private global i32 0
@259 = private unnamed_addr constant [4 x i8] c"wow\00", align 1
@260 = private unnamed_addr constant [42 x i8] c"test that var init struct value destructs\00", align 1
@261 = private unnamed_addr constant [63 x i8] c"test that functions returning struct don't destruct the struct\00", align 1
@262 = private unnamed_addr constant [56 x i8] c"test that var init struct without values get destructed\00", align 1
@263 = private unnamed_addr constant [40 x i8] c"test destruction at early return : true\00", align 1
@264 = private unnamed_addr constant [41 x i8] c"test destruction at early return : false\00", align 1
@265 = private unnamed_addr constant [36 x i8] c"test conditional destruction : true\00", align 1
@266 = private unnamed_addr constant [37 x i8] c"test conditional destruction : false\00", align 1
@267 = private unnamed_addr constant [48 x i8] c"test destruct struct accessed via function call\00", align 1
@268 = private unnamed_addr constant [65 x i8] c"test destructor is called when access chain is inside a function\00", align 1
@269 = private unnamed_addr constant [47 x i8] c"test destructor is not called on pointer types\00", align 1
@270 = private unnamed_addr constant [33 x i8] c"test array values are destructed\00", align 1
@271 = private unnamed_addr constant [32 x i8] c"test array types are destructed\00", align 1
@272 = private unnamed_addr constant [73 x i8] c"test that destructible struct present inside struct values is destructed\00", align 1
@273 = private unnamed_addr constant [54 x i8] c"test that destructor works, when last if don't return\00", align 1
@274 = private unnamed_addr constant [60 x i8] c"test that destructor works, when last if returns completely\00", align 1
@275 = private unnamed_addr constant [80 x i8] c"test structs passed to functions as parameters are automatically destructed - 1\00", align 1
@276 = private unnamed_addr constant [80 x i8] c"test structs passed to functions as parameters are automatically destructed - 2\00", align 1
@277 = private unnamed_addr constant [80 x i8] c"struct created in a access chain node, not assigned to a variable is destructed\00", align 1
@278 = private unnamed_addr constant [62 x i8] c"generic structs destructor is called in var init struct value\00", align 1
@279 = private unnamed_addr constant [72 x i8] c"generic structs destructor is called when created through function call\00", align 1
@280 = private unnamed_addr constant [63 x i8] c"generic struct destructor is called when inside another struct\00", align 1
@281 = private unnamed_addr constant [60 x i8] c"generic struct destructor is called when inside array value\00", align 1
@282 = private unnamed_addr constant [66 x i8] c"generic struct destructor is called when passed to a function - 1\00", align 1
@283 = private unnamed_addr constant [66 x i8] c"generic struct destructor is called when passed to a function - 2\00", align 1
@284 = private unnamed_addr constant [52 x i8] c"generic struct destructor is called in access chain\00", align 1
@285 = private unnamed_addr constant [60 x i8] c"comptime constructor struct is destructed, when in var init\00", align 1
@286 = private unnamed_addr constant [11 x i8] c"ext/file.c\00", align 1
@287 = private unnamed_addr constant [95 x i8] c"comptime constructor struct is destructed, when passing to function call and returning from it\00", align 1
@288 = private unnamed_addr constant [11 x i8] c"ext/file.c\00", align 1
@289 = private unnamed_addr constant [49 x i8] c"lambda taking a struct, the struct is destructed\00", align 1
@290 = private unnamed_addr constant [47 x i8] c"returning struct parameter doesn't destruct it\00", align 1
@291 = private unnamed_addr constant [43 x i8] c"lambda doesn't destruct outside it's scope\00", align 1
@292 = private unnamed_addr constant [32 x i8] c"var init variant call destructs\00", align 1
@293 = private unnamed_addr constant [81 x i8] c"test variants passed to functions as parameters are automatically destructed - 1\00", align 1
@294 = private unnamed_addr constant [81 x i8] c"test variants passed to functions as parameters are automatically destructed - 2\00", align 1
@295 = private unnamed_addr constant [48 x i8] c"returning variant parameter doesn't destruct it\00", align 1
@296 = private unnamed_addr constant [43 x i8] c"variant destruction at early return : true\00", align 1
@297 = private unnamed_addr constant [44 x i8] c"variant destruction at early return : false\00", align 1
@298 = private unnamed_addr constant [39 x i8] c"variant conditional destruction : true\00", align 1
@299 = private unnamed_addr constant [40 x i8] c"variant conditional destruction : false\00", align 1
@300 = private unnamed_addr constant [36 x i8] c"test that int float union works - 1\00", align 1
@301 = private unnamed_addr constant [36 x i8] c"test that int float union works - 2\00", align 1
@302 = private unnamed_addr constant [40 x i8] c"test a complex union of two structs - 1\00", align 1
@303 = private unnamed_addr constant [40 x i8] c"test a complex union of two structs - 2\00", align 1
@304 = private unnamed_addr constant [33 x i8] c"test that namespace structs work\00", align 1
@305 = private unnamed_addr constant [48 x i8] c"test that namespace structs work without values\00", align 1
@306 = private unnamed_addr constant [50 x i8] c"test that namespace functions can call each other\00", align 1
@307 = private unnamed_addr constant [48 x i8] c"test that namespace extended functions work - 1\00", align 1
@308 = private unnamed_addr constant [48 x i8] c"test that namespace extended functions work - 2\00", align 1
@309 = private unnamed_addr constant [48 x i8] c"test that namespace extended functions work - 3\00", align 1
@310 = private unnamed_addr constant [36 x i8] c"test typealias from namespace works\00", align 1
@311 = private unnamed_addr constant [65 x i8] c"test using statement can bring identifier into current scope - 2\00", align 1
@312 = private unnamed_addr constant [65 x i8] c"test using statement can bring identifier into current scope - 2\00", align 1
@313 = private unnamed_addr constant [24 x i8] c"test comptime sum works\00", align 1
@314 = private unnamed_addr constant [41 x i8] c"test comptime function can return struct\00", align 1
@315 = private unnamed_addr constant [58 x i8] c"test comptime function can return struct from a reference\00", align 1
@316 = private unnamed_addr constant [49 x i8] c"test comptime function can call struct functions\00", align 1
@317 = private unnamed_addr constant [49 x i8] c"test comptime constructor function can be called\00", align 1
@318 = private unnamed_addr constant [64 x i8] c"test that appropriate comptime constructor function is selected\00", align 1
@319 = private unnamed_addr constant [65 x i8] c"test comptime constructor can delegate to actual constructor - 1\00", align 1
@320 = private unnamed_addr constant [65 x i8] c"test comptime constructor can delegate to actual constructor - 2\00", align 1
@321 = private unnamed_addr constant [40 x i8] c"determine string length, using comptime\00", align 1
@322 = private unnamed_addr constant [33 x i8] c"compiler wrap functionally works\00", align 1
@323 = private unnamed_addr constant [44 x i8] c"can gain access to implicitly passed struct\00", align 1
@324 = private unnamed_addr constant [49 x i8] c"test comptime functions returning primitive work\00", align 1
@325 = private unnamed_addr constant [58 x i8] c"test comptime functions returning primitive can be stored\00", align 1
@326 = private unnamed_addr constant [54 x i8] c"test comptime delegated constructor get's called once\00", align 1
@327 = private unnamed_addr constant [60 x i8] c"comptime constructor initialized struct can be returned - 1\00", align 1
@328 = private unnamed_addr constant [60 x i8] c"comptime constructor initialized struct can be returned - 2\00", align 1
@329 = private unnamed_addr constant [41 x i8] c"comptime constructor can be implicit - 1\00", align 1
@330 = private unnamed_addr constant [41 x i8] c"comptime constructor can be implicit - 2\00", align 1
@331 = private unnamed_addr constant [32 x i8] c"test that compiler vector works\00", align 1
@332 = private unnamed_addr constant [43 x i8] c"test that compiler vector works with longs\00", align 1
@333 = private unnamed_addr constant [40 x i8] c"test external sum function is available\00", align 1
@334 = private unnamed_addr constant [60 x i8] c"test that basic generic function with no generic args works\00", align 1
@335 = private unnamed_addr constant [57 x i8] c"test that basic generic function with generic args works\00", align 1
@336 = private unnamed_addr constant [61 x i8] c"test that generic functions can be called inside other calls\00", align 1
@337 = private unnamed_addr constant [63 x i8] c"test that generic functions result can be saved into variables\00", align 1
@338 = private unnamed_addr constant [35 x i8] c"test that generic struct works - 1\00", align 1
@339 = private unnamed_addr constant [35 x i8] c"test that generic struct works - 2\00", align 1
@340 = private unnamed_addr constant [51 x i8] c"generic struct can be stored in another struct - 1\00", align 1
@341 = private unnamed_addr constant [51 x i8] c"generic struct can be stored in another struct - 2\00", align 1
@342 = private unnamed_addr constant [45 x i8] c"generic struct can be passed as function arg\00", align 1
@343 = private unnamed_addr constant [36 x i8] c"generic structs can be returned - 1\00", align 1
@344 = private unnamed_addr constant [36 x i8] c"generic structs can be returned - 2\00", align 1
@345 = private unnamed_addr constant [42 x i8] c"extension functions work on generic nodes\00", align 1
@346 = private unnamed_addr constant [60 x i8] c"generic structs declared and used from other files work - 1\00", align 1
@347 = private unnamed_addr constant [60 x i8] c"generic structs declared and used from other files work - 2\00", align 1
@348 = private unnamed_addr constant [61 x i8] c"generic variants declared and used from other files work - 1\00", align 1
@349 = private unnamed_addr constant [61 x i8] c"generic variants declared and used from other files work - 2\00", align 1
@350 = private unnamed_addr constant [61 x i8] c"generic variants declared and used from other files work - 3\00", align 1
@351 = private unnamed_addr constant [61 x i8] c"generic variants declared and used from other files work - 4\00", align 1
@352 = private unnamed_addr constant [41 x i8] c"generic function call without types work\00", align 1
@353 = private unnamed_addr constant [38 x i8] c"generic function call with types work\00", align 1
@354 = private unnamed_addr constant [63 x i8] c"nested generic type parameters can be deduced in function call\00", align 1
@355 = private unnamed_addr constant [63 x i8] c"nested generic type parameters can be deduced in function call\00", align 1
@356 = private unnamed_addr constant [61 x i8] c"generic return type can be deduced when in function call - 1\00", align 1
@357 = private unnamed_addr constant [61 x i8] c"generic return type can be deduced when in function call - 2\00", align 1
@358 = private unnamed_addr constant [45 x i8] c"failed to resize vector to a capacity of %d\0A\00", align 1
@359 = private unnamed_addr constant [45 x i8] c"failed to resize vector to a capacity of %d\0A\00", align 1
@360 = private unnamed_addr constant [20 x i8] c"vector of ints work\00", align 1
@361 = private unnamed_addr constant [21 x i8] c"vector of longs work\00", align 1
@362 = private unnamed_addr constant [36 x i8] c"can remove last element from vector\00", align 1
@363 = private unnamed_addr constant [37 x i8] c"can remove first element from vector\00", align 1
@364 = private unnamed_addr constant [53 x i8] c"vectors work even when pushing large amount of items\00", align 1
@365 = private unnamed_addr constant [41 x i8] c"test can change vector elements at index\00", align 1
@366 = private unnamed_addr constant [51 x i8] c"array reference works implicitly with array values\00", align 1
@367 = private unnamed_addr constant [56 x i8] c"array reference works implicitly with referenced arrays\00", align 1
@368 = private unnamed_addr constant [56 x i8] c"array reference works implicitly with referenced arrays\00", align 1
@369 = private unnamed_addr constant [51 x i8] c"array pointer is passed properly with array values\00", align 1
@370 = private unnamed_addr constant [57 x i8] c"array pointer is passed properly with referenced vectors\00", align 1
@371 = private unnamed_addr constant [57 x i8] c"array reference works implicitly with referenced vectors\00", align 1
@372 = private unnamed_addr constant [57 x i8] c"array reference works implicitly with referenced vectors\00", align 1
@373 = private unnamed_addr constant [57 x i8] c"array pointer is passed properly with referenced vectors\00", align 1
@374 = private unnamed_addr constant [28 x i8] c"check option type works - 1\00", align 1
@375 = private unnamed_addr constant [28 x i8] c"check option type works - 2\00", align 1
@376 = private unnamed_addr constant [28 x i8] c"check result type works - 1\00", align 1
@377 = private unnamed_addr constant [28 x i8] c"check result type works - 2\00", align 1
@378 = private unnamed_addr constant [28 x i8] c"check result type works - 3\00", align 1
@379 = internal constant { ptr } { ptr @Phone.call }
@380 = internal constant { ptr } { ptr @Phone.call.411 }
@381 = private unnamed_addr constant [64 x i8] c"passing struct as dynamic object in function argument works - 1\00", align 1
@382 = private unnamed_addr constant [64 x i8] c"passing struct as dynamic object in function argument works - 2\00", align 1
@383 = private unnamed_addr constant [54 x i8] c"getting dynamic object from function return works - 1\00", align 1
@384 = private unnamed_addr constant [54 x i8] c"getting dynamic object from function return works - 2\00", align 1
@385 = private unnamed_addr constant [55 x i8] c"storing struct as dynamic object in var init works - 1\00", align 1
@386 = private unnamed_addr constant [55 x i8] c"storing struct as dynamic object in var init works - 2\00", align 1
@387 = private unnamed_addr constant [59 x i8] c"storing struct ref as dynamic object in var init works - 1\00", align 1
@388 = private unnamed_addr constant [59 x i8] c"storing struct ref as dynamic object in var init works - 2\00", align 1
@389 = private unnamed_addr constant [52 x i8] c"assignment to dynamic object using struct works - 1\00", align 1
@390 = private unnamed_addr constant [52 x i8] c"assignment to dynamic object using struct works - 2\00", align 1
@391 = private unnamed_addr constant [56 x i8] c"assignment to dynamic object using struct ref works - 3\00", align 1
@392 = private unnamed_addr constant [56 x i8] c"assignment to dynamic object using struct ref works - 3\00", align 1
@393 = private unnamed_addr constant [52 x i8] c"storing dynamic object as a struct member works - 2\00", align 1
@394 = private unnamed_addr constant [52 x i8] c"storing dynamic object as a struct member works - 1\00", align 1
@395 = private unnamed_addr constant [51 x i8] c"storing dynamic object in a struct value works - 1\00", align 1
@396 = private unnamed_addr constant [51 x i8] c"storing dynamic object in a struct value works - 2\00", align 1
@397 = private unnamed_addr constant [40 x i8] c"variants can be passed to functions - 1\00", align 1
@398 = private unnamed_addr constant [40 x i8] c"variants can be passed to functions - 2\00", align 1
@399 = private unnamed_addr constant [40 x i8] c"variants can be passed to functions - 2\00", align 1
@400 = private unnamed_addr constant [42 x i8] c"allocated variant is in unspecified state\00", align 1
@401 = private unnamed_addr constant [44 x i8] c"variants can be returned from functions - 1\00", align 1
@402 = private unnamed_addr constant [44 x i8] c"variants can be returned from functions - 2\00", align 1
@403 = private unnamed_addr constant [38 x i8] c"variants can be stored in structs - 1\00", align 1
@404 = private unnamed_addr constant [38 x i8] c"variants can be stored in structs - 2\00", align 1
@405 = private unnamed_addr constant [37 x i8] c"variants can be stored in arrays - 1\00", align 1
@406 = private unnamed_addr constant [37 x i8] c"variants can be stored in arrays - 2\00", align 1
@407 = private unnamed_addr constant [37 x i8] c"variants can be stored in arrays - 3\00", align 1
@408 = private unnamed_addr constant [36 x i8] c"variants can be stored in variables\00", align 1
@409 = private unnamed_addr constant [36 x i8] c"variants can be stored in variables\00", align 1
@410 = private unnamed_addr constant [26 x i8] c"generic variants work - 1\00", align 1
@411 = private unnamed_addr constant [26 x i8] c"generic variants work - 2\00", align 1

declare i32 @printf(ptr %0, ...)

declare i32 @sprintf(ptr %0, ptr %1, ...)

declare ptr @malloc(i64 %0)

declare ptr @realloc(ptr %0, i64 %1)

declare void @free(ptr %0)

declare ptr @memcpy(ptr %0, ptr %1, i64 %2)

declare i64 @strlen(ptr %0)

declare i32 @strcmp(ptr %0, ptr %1)

declare i32 @strncmp(ptr %0, ptr %1, i64 %2)

declare i32 @memcmp(ptr %0, ptr %1, i64 %2)

; Function Attrs: nounwind
define private void @success_msg(ptr %0) #0 {
entry:
  %1 = call i32 (ptr, ...) @printf(ptr @0, ptr @ANSI_COLOR_GREEN, ptr %0, ptr @ANSI_COLOR_RESET)
  ret void
}

; Function Attrs: nounwind
define private void @error_msg(ptr %0) #0 {
entry:
  %1 = call i32 (ptr, ...) @printf(ptr @1, ptr @ANSI_COLOR_RED, ptr %0, ptr @ANSI_COLOR_RESET)
  ret void
}

; Function Attrs: nounwind
define private void @test(ptr %0, ptr %1) #0 {
entry:
  %2 = call i1 %1()
  br i1 %2, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %total_tests = load i32, ptr @total_tests, align 4
  %3 = add i32 %total_tests, 1
  %4 = call i32 (ptr, ...) @printf(ptr @2, ptr @ANSI_COLOR_GREEN, i32 %3, ptr %0, ptr @ANSI_COLOR_RESET)
  %tests_passed = load i32, ptr @tests_passed, align 4
  %5 = add i32 %tests_passed, 1
  store i32 %5, ptr @tests_passed, align 4
  br label %ifend

ifelse:                                           ; preds = %entry
  %total_tests1 = load i32, ptr @total_tests, align 4
  %6 = add i32 %total_tests1, 1
  %7 = call i32 (ptr, ...) @printf(ptr @3, ptr @ANSI_COLOR_RED, i32 %6, ptr %0, ptr @ANSI_COLOR_RESET)
  %tests_failed = load i32, ptr @tests_failed, align 4
  %8 = add i32 %tests_failed, 1
  store i32 %8, ptr @tests_failed, align 4
  br label %ifend

ifend:                                            ; preds = %ifelse, %ifthen
  %total_tests2 = load i32, ptr @total_tests, align 4
  %9 = add i32 %total_tests2, 1
  store i32 %9, ptr @total_tests, align 4
  ret void
}

; Function Attrs: nounwind
define private void @print_test_stats() #0 {
entry:
  %total_tests = load i32, ptr @total_tests, align 4
  %0 = call i32 (ptr, ...) @printf(ptr @4, i32 %total_tests)
  %tests_passed = load i32, ptr @tests_passed, align 4
  %1 = call i32 (ptr, ...) @printf(ptr @5, ptr @ANSI_COLOR_GREEN, i32 %tests_passed, ptr @ANSI_COLOR_RESET)
  %tests_failed = load i32, ptr @tests_failed, align 4
  %2 = icmp eq i32 %tests_failed, 0
  br i1 %2, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %3 = call i32 (ptr, ...) @printf(ptr @6, ptr @ANSI_COLOR_GREEN)
  br label %ifend

ifelse:                                           ; preds = %entry
  %4 = call i32 (ptr, ...) @printf(ptr @7, ptr @ANSI_COLOR_RED)
  br label %ifend

ifend:                                            ; preds = %ifelse, %ifthen
  %tests_failed1 = load i32, ptr @tests_failed, align 4
  %5 = call i32 (ptr, ...) @printf(ptr @8, i32 %tests_failed1)
  %6 = call i32 (ptr, ...) @printf(ptr @9, ptr @ANSI_COLOR_RESET)
  ret void
}

; Function Attrs: nounwind
define private i1 @assertEquals(i32 %0, i32 %1) #0 {
entry:
  %2 = icmp ne i32 %0, %1
  br i1 %2, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %3 = call i32 (ptr, ...) @printf(ptr @10, ptr @ANSI_COLOR_RED, i32 %1, i32 %0, ptr @ANSI_COLOR_RESET)
  ret i1 false

ifelse:                                           ; preds = %entry
  ret i1 true
}

; Function Attrs: nounwind
define private i1 @capturing(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  %2 = load ptr, ptr %1, align 8
  %3 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  %4 = load ptr, ptr %3, align 8
  %5 = call i1 %4(ptr %2)
  ret i1 %5
}

; Function Attrs: nounwind
define private i1 @delegate(ptr %0) #0 {
entry:
  %1 = call i1 @capturing(ptr %0)
  ret i1 %1
}

; Function Attrs: nounwind
define private i1 @dontCapture(ptr %0) #0 {
entry:
  %1 = call i1 %0()
  ret i1 %1
}

; Function Attrs: nounwind
define private i32 @passed(ptr %0) #0 {
entry:
  %1 = call i32 %0()
  ret i32 %1
}

; Function Attrs: nounwind
define private ptr @create_lamb(i1 %0) #0 {
entry:
  br i1 %0, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  ret ptr @lambda

ifelse:                                           ; preds = %entry
  ret ptr @lambda.1
}

; Function Attrs: nounwind
define private ptr @lamb_ret_struct() #0 {
entry:
  ret ptr @lambda.2
}

; Function Attrs: nounwind
define private void @test_lambda() #0 {
entry:
  call void @test(ptr @11, ptr @lambda.4)
  call void @test(ptr @12, ptr @lambda.5)
  call void @test(ptr @13, ptr @lambda.6)
  call void @test(ptr @14, ptr @lambda.8)
  call void @test(ptr @15, ptr @lambda.9)
  call void @test(ptr @16, ptr @lambda.11)
  call void @test(ptr @17, ptr @lambda.13)
  call void @test(ptr @18, ptr @lambda.15)
  call void @test(ptr @19, ptr @lambda.17)
  call void @test(ptr @20, ptr @lambda.19)
  call void @test(ptr @21, ptr @lambda.21)
  call void @test(ptr @22, ptr @lambda.23)
  call void @test(ptr @23, ptr @lambda.25)
  call void @test(ptr @24, ptr @lambda.26)
  call void @test(ptr @25, ptr @lambda.27)
  call void @test(ptr @26, ptr @lambda.29)
  call void @test(ptr @27, ptr @lambda.31)
  call void @test(ptr @28, ptr @lambda.33)
  call void @test(ptr @29, ptr @lambda.35)
  call void @test(ptr @30, ptr @lambda.38)
  call void @test(ptr @31, ptr @lambda.39)
  call void @test(ptr @32, ptr @lambda.41)
  call void @test(ptr @33, ptr @lambda.42)
  call void @test(ptr @34, ptr @lambda.44)
  ret void
}

; Function Attrs: nounwind
define private i32 @fn_rets_1() #0 {
entry:
  ret i32 1
}

; Function Attrs: nounwind
define private i32 @fn_rets_2() #0 {
entry:
  ret i32 2
}

define private i32 @lambda() {
entry:
  ret i32 5
}

define private i32 @lambda.1() {
entry:
  ret i32 10
}

define private void @lambda.2(ptr %0, i32 %1, i32 %2) {
entry:
  %3 = getelementptr inbounds %PointSome, ptr %0, i32 0, i32 0
  store i32 %1, ptr %3, align 4
  %4 = getelementptr inbounds %PointSome, ptr %0, i32 0, i32 1
  store i32 %2, ptr %4, align 4
  ret void
}

; Function Attrs: nounwind
define private ptr @LambFactory.create_lamb() #0 {
entry:
  ret ptr @lambda.3
}

define private i32 @lambda.3() {
entry:
  ret i32 233
}

define private i1 @lambda.4() {
entry:
  ret i1 true
}

define private i1 @lambda.5() {
entry:
  ret i1 true
}

define private i1 @lambda.6() {
entry:
  %0 = call i1 @dontCapture(ptr @lambda.7)
  ret i1 %0
}

define private i1 @lambda.7() {
entry:
  ret i1 true
}

define private i1 @lambda.8() {
entry:
  %0 = alloca %LambFactory, align 8
  %1 = call ptr @LambFactory.create_lamb()
  %2 = call i32 %1()
  %3 = icmp eq i32 %2, 233
  ret i1 %3
}

define private i1 @lambda.9() {
entry:
  %0 = call i1 @dontCapture(ptr @lambda.10)
  ret i1 %0
}

define private i1 @lambda.10() {
entry:
  ret i1 true
}

define private i1 @lambda.11() {
entry:
  %0 = alloca { ptr, ptr }, align 8
  %1 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr @lambda.12, ptr %1, align 8
  %2 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr null, ptr %2, align 8
  %3 = call i1 @capturing(ptr %0)
  ret i1 %3
}

define private i1 @lambda.12(ptr %0) {
entry:
  ret i1 true
}

define private i1 @lambda.13() {
entry:
  %0 = alloca { ptr, ptr }, align 8
  %1 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr @lambda.14, ptr %1, align 8
  %2 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr null, ptr %2, align 8
  %3 = call i1 @capturing(ptr %0)
  ret i1 %3
}

define private i1 @lambda.14(ptr %0) {
entry:
  ret i1 true
}

define private i1 @lambda.15() {
entry:
  %0 = alloca i1, align 1
  store i1 true, ptr %0, align 1
  %1 = alloca { i1 }, align 8
  %2 = getelementptr inbounds { i1 }, ptr %1, i32 0, i32 0
  %captured = load i1, ptr %0, align 1
  store i1 %captured, ptr %2, align 1
  %3 = alloca { ptr, ptr }, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %3, i32 0, i32 0
  store ptr @lambda.16, ptr %4, align 8
  %5 = getelementptr inbounds { ptr, ptr }, ptr %3, i32 0, i32 1
  store ptr %1, ptr %5, align 8
  %6 = call i1 @capturing(ptr %3)
  ret i1 %6
}

define private i1 @lambda.16(ptr %0) {
entry:
  %1 = getelementptr inbounds { i1 }, ptr %0, i32 0, i32 0
  %2 = load i1, ptr %1, align 1
  ret i1 %2
}

define private i1 @lambda.17() {
entry:
  %0 = alloca i1, align 1
  store i1 false, ptr %0, align 1
  %1 = alloca { i1 }, align 8
  %2 = getelementptr inbounds { i1 }, ptr %1, i32 0, i32 0
  %captured = load i1, ptr %0, align 1
  store i1 %captured, ptr %2, align 1
  %3 = alloca { ptr, ptr }, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %3, i32 0, i32 0
  store ptr @lambda.18, ptr %4, align 8
  %5 = getelementptr inbounds { ptr, ptr }, ptr %3, i32 0, i32 1
  store ptr %1, ptr %5, align 8
  %6 = call i1 @capturing(ptr %3)
  ret i1 %6
}

define private i1 @lambda.18(ptr %0) {
entry:
  %1 = getelementptr inbounds { i1 }, ptr %0, i32 0, i32 0
  %2 = load i1, ptr %1, align 1
  %3 = xor i1 %2, true
  ret i1 %3
}

define private i1 @lambda.19() {
entry:
  %0 = alloca i1, align 1
  store i1 true, ptr %0, align 1
  %1 = alloca { ptr }, align 8
  %2 = getelementptr inbounds { ptr }, ptr %1, i32 0, i32 0
  store ptr %0, ptr %2, align 8
  %3 = alloca { ptr, ptr }, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %3, i32 0, i32 0
  store ptr @lambda.20, ptr %4, align 8
  %5 = getelementptr inbounds { ptr, ptr }, ptr %3, i32 0, i32 1
  store ptr %1, ptr %5, align 8
  %6 = call i1 @capturing(ptr %3)
  ret i1 %6
}

define private i1 @lambda.20(ptr %0) {
entry:
  %1 = getelementptr inbounds { ptr }, ptr %0, i32 0, i32 0
  %2 = load ptr, ptr %1, align 8
  %deref = load i1, ptr %2, align 1
  ret i1 %deref
}

define private i1 @lambda.21() {
entry:
  %0 = alloca i1, align 1
  store i1 true, ptr %0, align 1
  %1 = alloca { i1 }, align 8
  %2 = getelementptr inbounds { i1 }, ptr %1, i32 0, i32 0
  %captured = load i1, ptr %0, align 1
  store i1 %captured, ptr %2, align 1
  %3 = alloca { ptr, ptr }, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %3, i32 0, i32 0
  store ptr @lambda.22, ptr %4, align 8
  %5 = getelementptr inbounds { ptr, ptr }, ptr %3, i32 0, i32 1
  store ptr %1, ptr %5, align 8
  %6 = call i1 @delegate(ptr %3)
  ret i1 %6
}

define private i1 @lambda.22(ptr %0) {
entry:
  %1 = getelementptr inbounds { i1 }, ptr %0, i32 0, i32 0
  %2 = load i1, ptr %1, align 1
  ret i1 %2
}

define private i1 @lambda.23() {
entry:
  %0 = alloca i1, align 1
  store i1 true, ptr %0, align 1
  %1 = alloca { i1 }, align 8
  %2 = getelementptr inbounds { i1 }, ptr %1, i32 0, i32 0
  %x = load i1, ptr %0, align 1
  store i1 %x, ptr %2, align 1
  %3 = alloca { ptr, ptr }, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %3, i32 0, i32 0
  store ptr @lambda.24, ptr %4, align 8
  %5 = getelementptr inbounds { ptr, ptr }, ptr %3, i32 0, i32 1
  store ptr %1, ptr %5, align 8
  %6 = alloca ptr, align 8
  store ptr %3, ptr %6, align 8
  %message = load ptr, ptr %6, align 8
  %7 = getelementptr inbounds { ptr, ptr }, ptr %message, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds { ptr, ptr }, ptr %message, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = call i1 %10(ptr %8)
  ret i1 %11
}

define private i1 @lambda.24(ptr %0) {
entry:
  %1 = getelementptr inbounds { i1 }, ptr %0, i32 0, i32 0
  %2 = load i1, ptr %1, align 1
  ret i1 %2
}

define private i1 @lambda.25() {
entry:
  %0 = call i32 @passed(ptr @fn_rets_1)
  %1 = icmp eq i32 %0, 1
  ret i1 %1
}

define private i1 @lambda.26() {
entry:
  %0 = call i32 @passed(ptr @fn_rets_2)
  %1 = icmp eq i32 %0, 2
  ret i1 %1
}

define private i1 @lambda.27() {
entry:
  %0 = alloca ptr, align 8
  store ptr @lambda.28, ptr %0, align 8
  %x = load ptr, ptr %0, align 8
  %1 = call i32 %x()
  %2 = icmp eq i32 %1, 252
  ret i1 %2
}

define private i32 @lambda.28() {
entry:
  ret i32 252
}

define private i1 @lambda.29() {
entry:
  %0 = alloca ptr, align 8
  store ptr @lambda.30, ptr %0, align 8
  %x = load ptr, ptr %0, align 8
  %1 = call i32 %x()
  %2 = icmp eq i32 %1, 253
  ret i1 %2
}

define private i32 @lambda.30() {
entry:
  ret i32 253
}

define private i1 @lambda.31() {
entry:
  %0 = alloca %LambdaProvider, align 8
  %1 = getelementptr inbounds %LambdaProvider, ptr %0, i32 0, i32 0
  store ptr @lambda.32, ptr %1, align 8
  %2 = getelementptr inbounds %LambdaProvider, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %2, align 8
  %3 = call i32 %acc()
  %4 = icmp eq i32 %3, 252
  ret i1 %4
}

define private i32 @lambda.32() {
entry:
  ret i32 252
}

define private i1 @lambda.33() {
entry:
  %0 = alloca %Nested, align 8
  %1 = getelementptr inbounds %LambdaProvider, ptr %0, i32 0, i32 0
  store ptr @lambda.34, ptr %1, align 8
  %2 = getelementptr inbounds %Nested, ptr %0, i32 0, i32 0, i32 0
  %acc = load ptr, ptr %2, align 8
  %3 = call i32 %acc()
  %4 = icmp eq i32 %3, 252
  ret i1 %4
}

define private i32 @lambda.34() {
entry:
  ret i32 252
}

define private i1 @lambda.35() {
entry:
  %arr = alloca [2 x ptr], align 8
  %0 = getelementptr inbounds [2 x ptr], ptr %arr, i32 0, i32 0
  store ptr @lambda.36, ptr %0, align 8
  %1 = getelementptr inbounds [2 x ptr], ptr %arr, i32 0, i32 1
  store ptr @lambda.37, ptr %1, align 8
  %2 = getelementptr inbounds [2 x ptr], ptr %arr, i32 0, i32 0
  %acc = load ptr, ptr %2, align 8
  %3 = call i32 %acc()
  %4 = icmp eq i32 %3, 5
  br i1 %4, label %5, label %9

5:                                                ; preds = %entry
  %6 = getelementptr inbounds [2 x ptr], ptr %arr, i32 0, i32 1
  %acc1 = load ptr, ptr %6, align 8
  %7 = call i32 %acc1()
  %8 = icmp eq i32 %7, 10
  br label %9

9:                                                ; preds = %5, %entry
  %10 = phi i1 [ false, %entry ], [ %8, %5 ]
  ret i1 %10
}

define private i32 @lambda.36() {
entry:
  ret i32 5
}

define private i32 @lambda.37() {
entry:
  ret i32 10
}

define private i1 @lambda.38() {
entry:
  %0 = call ptr @create_lamb(i1 true)
  %1 = call i32 %0()
  %2 = icmp eq i32 %1, 5
  br i1 %2, label %3, label %7

3:                                                ; preds = %entry
  %4 = call ptr @create_lamb(i1 false)
  %5 = call i32 %4()
  %6 = icmp eq i32 %5, 10
  br label %7

7:                                                ; preds = %3, %entry
  %8 = phi i1 [ false, %entry ], [ %6, %3 ]
  ret i1 %8
}

define private i1 @lambda.39() {
entry:
  %0 = alloca %SelfLambda, align 8
  %1 = getelementptr inbounds %SelfLambda, ptr %0, i32 0, i32 0
  store i32 55, ptr %1, align 4
  %2 = getelementptr inbounds %SelfLambda, ptr %0, i32 0, i32 1
  store ptr @lambda.40, ptr %2, align 8
  %3 = getelementptr inbounds %SelfLambda, ptr %0, i32 0, i32 1
  %acc = load ptr, ptr %3, align 8
  %4 = call i32 %acc(ptr %0)
  %5 = icmp eq i32 %4, 110
  ret i1 %5
}

define private i32 @lambda.40(ptr %0) {
entry:
  %1 = getelementptr inbounds { i32, ptr }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = mul i32 %acc, 2
  ret i32 %2
}

define private i1 @lambda.41() {
entry:
  %0 = alloca %PointSome, align 8
  %1 = call ptr @lamb_ret_struct()
  call void %1(ptr %0, i32 10, i32 20)
  %2 = getelementptr inbounds %PointSome, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %2, align 4
  %3 = icmp eq i32 %acc, 10
  br i1 %3, label %4, label %7

4:                                                ; preds = %entry
  %5 = getelementptr inbounds %PointSome, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %5, align 4
  %6 = icmp eq i32 %acc1, 20
  br label %7

7:                                                ; preds = %4, %entry
  %8 = phi i1 [ false, %entry ], [ %6, %4 ]
  ret i1 %8
}

define private i1 @lambda.42() {
entry:
  %0 = alloca %ProvideStructLamb, align 8
  %1 = getelementptr inbounds %ProvideStructLamb, ptr %0, i32 0, i32 0
  store ptr @lambda.43, ptr %1, align 8
  %2 = alloca %PointSome, align 8
  %3 = getelementptr inbounds %ProvideStructLamb, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %3, align 8
  call void %acc(ptr %2, i32 20, i32 30)
  %4 = getelementptr inbounds %PointSome, ptr %2, i32 0, i32 0
  %acc1 = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc1, 20
  br i1 %5, label %6, label %9

6:                                                ; preds = %entry
  %7 = getelementptr inbounds %PointSome, ptr %2, i32 0, i32 1
  %acc2 = load i32, ptr %7, align 4
  %8 = icmp eq i32 %acc2, 30
  br label %9

9:                                                ; preds = %6, %entry
  %10 = phi i1 [ false, %entry ], [ %8, %6 ]
  ret i1 %10
}

define private void @lambda.43(ptr %0, i32 %1, i32 %2) {
entry:
  %3 = getelementptr inbounds %PointSome, ptr %0, i32 0, i32 0
  store i32 %1, ptr %3, align 4
  %4 = getelementptr inbounds %PointSome, ptr %0, i32 0, i32 1
  store i32 %2, ptr %4, align 4
  ret void
}

define private i1 @lambda.44() {
entry:
  %0 = alloca %ProvideSelfRefStructLamb, align 8
  %1 = getelementptr inbounds %ProvideSelfRefStructLamb, ptr %0, i32 0, i32 1
  store ptr @lambda.45, ptr %1, align 8
  %2 = getelementptr inbounds %ProvideSelfRefStructLamb, ptr %0, i32 0, i32 0
  store i32 2, ptr %2, align 4
  %3 = alloca %PointSome, align 8
  %4 = getelementptr inbounds %ProvideSelfRefStructLamb, ptr %0, i32 0, i32 1
  %acc = load ptr, ptr %4, align 8
  call void %acc(ptr %3, ptr %0, i32 10, i32 20)
  %5 = getelementptr inbounds %PointSome, ptr %3, i32 0, i32 0
  %acc1 = load i32, ptr %5, align 4
  %6 = icmp eq i32 %acc1, 20
  br i1 %6, label %7, label %10

7:                                                ; preds = %entry
  %8 = getelementptr inbounds %PointSome, ptr %3, i32 0, i32 1
  %acc2 = load i32, ptr %8, align 4
  %9 = icmp eq i32 %acc2, 40
  br label %10

10:                                               ; preds = %7, %entry
  %11 = phi i1 [ false, %entry ], [ %9, %7 ]
  ret i1 %11
}

define private void @lambda.45(ptr %0, ptr %1, i32 %2, i32 %3) {
entry:
  %4 = getelementptr inbounds %PointSome, ptr %0, i32 0, i32 0
  %5 = getelementptr inbounds { i32, ptr }, ptr %1, i32 0, i32 0
  %acc = load i32, ptr %5, align 4
  %6 = mul i32 %acc, %2
  store i32 %6, ptr %4, align 4
  %7 = getelementptr inbounds %PointSome, ptr %0, i32 0, i32 1
  %8 = getelementptr inbounds { i32, ptr }, ptr %1, i32 0, i32 0
  %acc1 = load i32, ptr %8, align 4
  %9 = mul i32 %acc1, %3
  store i32 %9, ptr %7, align 4
  ret void
}

; Function Attrs: nounwind
define private void @test_bodmas() #0 {
entry:
  call void @test(ptr @35, ptr @lambda.46)
  call void @test(ptr @36, ptr @lambda.47)
  call void @test(ptr @37, ptr @lambda.48)
  call void @test(ptr @38, ptr @lambda.49)
  call void @test(ptr @39, ptr @lambda.50)
  call void @test(ptr @40, ptr @lambda.51)
  call void @test(ptr @41, ptr @lambda.52)
  call void @test(ptr @42, ptr @lambda.53)
  call void @test(ptr @43, ptr @lambda.54)
  call void @test(ptr @44, ptr @lambda.55)
  call void @test(ptr @45, ptr @lambda.56)
  call void @test(ptr @46, ptr @lambda.57)
  call void @test(ptr @47, ptr @lambda.58)
  call void @test(ptr @48, ptr @lambda.59)
  call void @test(ptr @49, ptr @lambda.60)
  call void @test(ptr @50, ptr @lambda.61)
  call void @test(ptr @51, ptr @lambda.62)
  call void @test(ptr @52, ptr @lambda.63)
  call void @test(ptr @53, ptr @lambda.64)
  call void @test(ptr @54, ptr @lambda.65)
  call void @test(ptr @55, ptr @lambda.66)
  call void @test(ptr @56, ptr @lambda.67)
  call void @test(ptr @57, ptr @lambda.68)
  call void @test(ptr @58, ptr @lambda.69)
  call void @test(ptr @59, ptr @lambda.70)
  call void @test(ptr @60, ptr @lambda.71)
  call void @test(ptr @61, ptr @lambda.72)
  call void @test(ptr @62, ptr @lambda.73)
  call void @test(ptr @63, ptr @lambda.74)
  call void @test(ptr @64, ptr @lambda.75)
  call void @test(ptr @65, ptr @lambda.76)
  call void @test(ptr @66, ptr @lambda.77)
  ret void
}

define private i1 @lambda.46() {
entry:
  ret i1 true
}

define private i1 @lambda.47() {
entry:
  ret i1 true
}

define private i1 @lambda.48() {
entry:
  ret i1 true
}

define private i1 @lambda.49() {
entry:
  ret i1 true
}

define private i1 @lambda.50() {
entry:
  ret i1 true
}

define private i1 @lambda.51() {
entry:
  ret i1 true
}

define private i1 @lambda.52() {
entry:
  ret i1 true
}

define private i1 @lambda.53() {
entry:
  ret i1 true
}

define private i1 @lambda.54() {
entry:
  ret i1 true
}

define private i1 @lambda.55() {
entry:
  ret i1 true
}

define private i1 @lambda.56() {
entry:
  ret i1 true
}

define private i1 @lambda.57() {
entry:
  ret i1 true
}

define private i1 @lambda.58() {
entry:
  ret i1 true
}

define private i1 @lambda.59() {
entry:
  ret i1 true
}

define private i1 @lambda.60() {
entry:
  ret i1 true
}

define private i1 @lambda.61() {
entry:
  ret i1 true
}

define private i1 @lambda.62() {
entry:
  ret i1 true
}

define private i1 @lambda.63() {
entry:
  %0 = alloca i32, align 4
  store i32 5, ptr %0, align 4
  %1 = alloca i32, align 4
  store i32 3, ptr %1, align 4
  %a = load i32, ptr %0, align 4
  %b = load i32, ptr %1, align 4
  %2 = add i32 %a, %b
  %3 = mul i32 %2, 2
  %4 = sub i32 %3, 2
  %5 = icmp eq i32 %4, 14
  ret i1 %5
}

define private i1 @lambda.64() {
entry:
  ret i1 true
}

define private i1 @lambda.65() {
entry:
  ret i1 true
}

define private i1 @lambda.66() {
entry:
  ret i1 true
}

define private i1 @lambda.67() {
entry:
  ret i1 true
}

define private i1 @lambda.68() {
entry:
  ret i1 true
}

define private i1 @lambda.69() {
entry:
  ret i1 true
}

define private i1 @lambda.70() {
entry:
  ret i1 true
}

define private i1 @lambda.71() {
entry:
  ret i1 true
}

define private i1 @lambda.72() {
entry:
  ret i1 true
}

define private i1 @lambda.73() {
entry:
  ret i1 true
}

define private i1 @lambda.74() {
entry:
  ret i1 true
}

define private i1 @lambda.75() {
entry:
  ret i1 true
}

define private i1 @lambda.76() {
entry:
  ret i1 true
}

define private i1 @lambda.77() {
entry:
  %0 = alloca i32, align 4
  store i32 22, ptr %0, align 4
  %1 = getelementptr inbounds i32, ptr %0, i32 1
  %2 = getelementptr inbounds i32, ptr %1, i32 -1
  %deref = load i32, ptr %2, align 4
  %3 = icmp eq i32 %deref, 22
  ret i1 %3
}

; Function Attrs: nounwind
define private void @test_floating_expr() #0 {
entry:
  call void @test(ptr @67, ptr @lambda.78)
  call void @test(ptr @68, ptr @lambda.79)
  call void @test(ptr @69, ptr @lambda.80)
  call void @test(ptr @70, ptr @lambda.81)
  call void @test(ptr @71, ptr @lambda.82)
  call void @test(ptr @72, ptr @lambda.83)
  call void @test(ptr @73, ptr @lambda.84)
  call void @test(ptr @74, ptr @lambda.85)
  call void @test(ptr @75, ptr @lambda.86)
  call void @test(ptr @76, ptr @lambda.87)
  ret void
}

define private i1 @lambda.78() {
entry:
  ret i1 true
}

define private i1 @lambda.79() {
entry:
  ret i1 true
}

define private i1 @lambda.80() {
entry:
  ret i1 true
}

define private i1 @lambda.81() {
entry:
  %0 = alloca float, align 4
  store float 5.500000e+00, ptr %0, align 4
  %result = load float, ptr %0, align 4
  %1 = fcmp oeq float %result, 5.500000e+00
  ret i1 %1
}

define private i1 @lambda.82() {
entry:
  %0 = alloca float, align 4
  store float 5.500000e+00, ptr %0, align 4
  %result = load float, ptr %0, align 4
  %1 = fcmp oeq float %result, 5.500000e+00
  ret i1 %1
}

define private i1 @lambda.83() {
entry:
  ret i1 true
}

define private i1 @lambda.84() {
entry:
  ret i1 true
}

define private i1 @lambda.85() {
entry:
  ret i1 true
}

define private i1 @lambda.86() {
entry:
  %0 = alloca double, align 8
  store double 5.500000e+00, ptr %0, align 8
  %result = load double, ptr %0, align 8
  %1 = fcmp oeq double %result, 5.500000e+00
  ret i1 %1
}

define private i1 @lambda.87() {
entry:
  %0 = alloca double, align 8
  store double 5.500000e+00, ptr %0, align 8
  %result = load double, ptr %0, align 8
  %1 = fcmp oeq double %result, 5.500000e+00
  ret i1 %1
}

; Function Attrs: nounwind
define private i32 @double_sum(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %2, align 4
  %3 = add i32 %acc, %acc1
  %4 = mul i32 2, %3
  ret i32 %4
}

; Function Attrs: nounwind
define private void @test_nodes() #0 {
entry:
  call void @test(ptr @79, ptr @lambda.88)
  call void @test(ptr @80, ptr @lambda.89)
  call void @test(ptr @82, ptr @lambda.90)
  call void @test(ptr @83, ptr @lambda.91)
  call void @test(ptr @84, ptr @lambda.92)
  call void @test(ptr @85, ptr @lambda.93)
  call void @test(ptr @86, ptr @lambda.94)
  call void @test(ptr @87, ptr @lambda.95)
  call void @test(ptr @88, ptr @lambda.96)
  call void @test(ptr @89, ptr @lambda.97)
  call void @test(ptr @90, ptr @lambda.98)
  call void @test(ptr @91, ptr @lambda.99)
  call void @test(ptr @92, ptr @lambda.100)
  call void @test(ptr @93, ptr @lambda.101)
  call void @test(ptr @94, ptr @lambda.102)
  call void @test(ptr @95, ptr @lambda.103)
  call void @test(ptr @96, ptr @lambda.104)
  call void @test(ptr @97, ptr @lambda.105)
  call void @test(ptr @98, ptr @lambda.106)
  call void @test(ptr @99, ptr @lambda.107)
  call void @test(ptr @100, ptr @lambda.108)
  call void @test(ptr @101, ptr @lambda.109)
  call void @test(ptr @102, ptr @lambda.110)
  call void @test(ptr @103, ptr @lambda.111)
  call void @test(ptr @104, ptr @lambda.112)
  call void @test(ptr @105, ptr @lambda.113)
  call void @test(ptr @106, ptr @lambda.114)
  call void @test(ptr @107, ptr @lambda.115)
  call void @test(ptr @108, ptr @lambda.116)
  call void @test(ptr @109, ptr @lambda.117)
  call void @test(ptr @110, ptr @lambda.118)
  call void @test(ptr @111, ptr @lambda.119)
  call void @test(ptr @112, ptr @lambda.120)
  call void @test(ptr @113, ptr @lambda.121)
  ret void
}

; Function Attrs: nounwind
define private i32 @declared_below() #0 {
entry:
  ret i32 1
}

; Function Attrs: nounwind
define private i32 @Calculator.sum(i32 %0, i32 %1) #0 {
entry:
  %2 = add i32 %0, %1
  ret i32 %2
}

; Function Attrs: nounwind
define private i32 @Calculator.divide(i32 %0, i32 %1) #0 {
entry:
  %2 = sdiv i32 %0, %1
  ret i32 %2
}

; Function Attrs: nounwind
define private i32 @Calculator.multiply(i32 %0, i32 %1) #0 {
entry:
  %2 = mul i32 %0, %1
  ret i32 %2
}

; Function Attrs: nounwind
define private i32 @Calculator.multiplyP(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %2, align 4
  %3 = mul i32 %acc, %acc1
  ret i32 %3
}

; Function Attrs: nounwind
define private i32 @Calculator.divideP(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %2, align 4
  %3 = sdiv i32 %acc, %acc1
  ret i32 %3
}

; Function Attrs: nounwind
define private i32 @Calculator.avg(ptr %0) #0 {
entry:
  %1 = call i32 @Point.sumP(ptr %0)
  %2 = sdiv i32 %1, 2
  ret i32 %2
}

; Function Attrs: nounwind
define private i32 @Point.call_divide(i32 %0, i32 %1) #0 {
entry:
  %2 = call i32 @Calculator.divide(i32 %0, i32 %1)
  ret i32 %2
}

; Function Attrs: nounwind
define private i32 @Point.call_multiply_p(ptr %0) #0 {
entry:
  %1 = call i32 @Calculator.multiplyP(ptr %0)
  ret i32 %1
}

; Function Attrs: nounwind
define private i32 @Point.sumP(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %2, align 4
  %3 = add i32 %acc, %acc1
  ret i32 %3
}

; Function Attrs: nounwind
define private i32 @Summer.summer_sum(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %2, align 4
  %3 = add i32 %acc, %acc1
  ret i32 %3
}

define private i1 @lambda.88() {
entry:
  %MyInt = load i32, ptr @MyInt, align 4
  %0 = icmp eq i32 %MyInt, 5
  ret i1 %0
}

define private i1 @lambda.89() {
entry:
  %0 = alloca i32, align 4
  store i32 5, ptr %0, align 4
  %1 = call i32 (ptr, ...) @printf(ptr @81, ptr %0)
  ret i1 true
}

define private i1 @lambda.90() {
entry:
  %0 = alloca i32, align 4
  store i32 5, ptr %0, align 4
  %1 = alloca ptr, align 8
  store ptr %0, ptr %1, align 8
  %y = load ptr, ptr %1, align 8
  %deref = load i32, ptr %y, align 4
  %2 = icmp eq i32 %deref, 5
  ret i1 %2
}

define private i1 @lambda.91() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %forcond

forcond:                                          ; preds = %forthen, %entry
  %i = load i32, ptr %1, align 4
  %2 = icmp slt i32 %i, 5
  br i1 %2, label %forthen, label %forend

forthen:                                          ; preds = %forcond
  %j = load i32, ptr %0, align 4
  %3 = add i32 %j, 1
  store i32 %3, ptr %0, align 4
  %i1 = load i32, ptr %1, align 4
  %4 = add i32 %i1, 1
  store i32 %4, ptr %1, align 4
  br label %forcond

forend:                                           ; preds = %forcond
  %j2 = load i32, ptr %0, align 4
  %5 = icmp eq i32 %j2, 5
  ret i1 %5
}

define private i1 @lambda.92() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  br label %loopcond

loopcond:                                         ; preds = %loopthen, %entry
  %j = load i32, ptr %0, align 4
  %1 = icmp ne i32 %j, 5
  br i1 %1, label %loopthen, label %loopexit

loopthen:                                         ; preds = %loopcond
  %j1 = load i32, ptr %0, align 4
  %2 = add i32 %j1, 1
  store i32 %2, ptr %0, align 4
  br label %loopcond

loopexit:                                         ; preds = %loopcond
  %j2 = load i32, ptr %0, align 4
  %3 = icmp eq i32 %j2, 5
  ret i1 %3
}

define private i1 @lambda.93() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  br label %loopthen

loopthen:                                         ; preds = %loopcond, %entry
  %j = load i32, ptr %0, align 4
  %1 = add i32 %j, 1
  store i32 %1, ptr %0, align 4
  br label %loopcond

loopcond:                                         ; preds = %loopthen
  %j1 = load i32, ptr %0, align 4
  %2 = icmp ne i32 %j1, 5
  br i1 %2, label %loopthen, label %loopexit

loopexit:                                         ; preds = %loopcond
  %j2 = load i32, ptr %0, align 4
  %3 = icmp eq i32 %j2, 5
  ret i1 %3
}

define private i1 @lambda.94() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %j = load i32, ptr %0, align 4
  switch i32 %j, label %default [
    i32 0, label %case
    i32 1, label %case1
  ]

case:                                             ; preds = %entry
  ret i1 true

case1:                                            ; preds = %entry
  ret i1 false

default:                                          ; preds = %entry
  ret i1 false
}

define private i1 @lambda.95() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %j = load i32, ptr %0, align 4
  switch i32 %j, label %default [
    i32 0, label %case
    i32 1, label %case2
  ]

end:                                              ; preds = %default, %case2, %case
  %j5 = load i32, ptr %0, align 4
  %1 = icmp eq i32 %j5, 1
  ret i1 %1

case:                                             ; preds = %entry
  %j1 = load i32, ptr %0, align 4
  %2 = add i32 %j1, 1
  store i32 %2, ptr %0, align 4
  br label %end

case2:                                            ; preds = %entry
  %j3 = load i32, ptr %0, align 4
  %3 = add i32 %j3, 1
  store i32 %3, ptr %0, align 4
  br label %end

default:                                          ; preds = %entry
  %j4 = load i32, ptr %0, align 4
  %4 = add i32 %j4, 1
  store i32 %4, ptr %0, align 4
  br label %end
}

define private i1 @lambda.96() {
entry:
  %0 = alloca %Point, align 8
  %1 = getelementptr inbounds %Point, ptr %0, i32 0, i32 0
  store i32 5, ptr %1, align 4
  %2 = getelementptr inbounds %Point, ptr %0, i32 0, i32 1
  store i32 6, ptr %2, align 4
  %3 = getelementptr inbounds %Point, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %3, align 4
  %4 = icmp eq i32 %acc, 5
  br i1 %4, label %5, label %8

5:                                                ; preds = %entry
  %6 = getelementptr inbounds %Point, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %6, align 4
  %7 = icmp eq i32 %acc1, 6
  br label %8

8:                                                ; preds = %5, %entry
  %9 = phi i1 [ false, %entry ], [ %7, %5 ]
  ret i1 %9
}

define private i1 @lambda.97() {
entry:
  %0 = alloca %Point, align 8
  %1 = getelementptr inbounds %Point, ptr %0, i32 0, i32 0
  store i32 0, ptr %1, align 4
  %2 = getelementptr inbounds %Point, ptr %0, i32 0, i32 1
  store i32 0, ptr %2, align 4
  %3 = call i32 @Calculator.sum(i32 5, i32 6)
  %4 = icmp eq i32 %3, 11
  ret i1 %4
}

define private i1 @lambda.98() {
entry:
  %0 = call i32 @Calculator.sum(i32 6, i32 6)
  %1 = icmp eq i32 %0, 12
  ret i1 %1
}

define private i1 @lambda.99() {
entry:
  %0 = alloca %Point, align 8
  %1 = getelementptr inbounds %Point, ptr %0, i32 0, i32 0
  store i32 7, ptr %1, align 4
  %2 = getelementptr inbounds %Point, ptr %0, i32 0, i32 1
  store i32 6, ptr %2, align 4
  %3 = call i32 @Point.sumP(ptr %0)
  %4 = icmp eq i32 %3, 13
  ret i1 %4
}

define private i1 @lambda.100() {
entry:
  %arr = alloca [5 x i32], align 4
  %0 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  store i32 2, ptr %0, align 4
  %1 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 1
  store i32 4, ptr %1, align 4
  %2 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 2
  store i32 6, ptr %2, align 4
  %3 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 3
  store i32 8, ptr %3, align 4
  %4 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 4
  store i32 10, ptr %4, align 4
  %5 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  %acc = load i32, ptr %5, align 4
  %6 = icmp eq i32 %acc, 2
  br i1 %6, label %7, label %10

7:                                                ; preds = %entry
  %8 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 1
  %acc1 = load i32, ptr %8, align 4
  %9 = icmp eq i32 %acc1, 4
  br label %10

10:                                               ; preds = %7, %entry
  %11 = phi i1 [ false, %entry ], [ %9, %7 ]
  br i1 %11, label %12, label %15

12:                                               ; preds = %10
  %13 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 2
  %acc2 = load i32, ptr %13, align 4
  %14 = icmp eq i32 %acc2, 6
  br label %15

15:                                               ; preds = %12, %10
  %16 = phi i1 [ false, %10 ], [ %14, %12 ]
  ret i1 %16
}

define private i1 @lambda.101() {
entry:
  %arr = alloca [5 x i32], align 4
  %0 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  store i32 2, ptr %0, align 4
  %1 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 1
  store i32 4, ptr %1, align 4
  %2 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 2
  store i32 6, ptr %2, align 4
  %3 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  %acc = load i32, ptr %3, align 4
  %4 = icmp eq i32 %acc, 2
  br i1 %4, label %5, label %8

5:                                                ; preds = %entry
  %6 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 1
  %acc1 = load i32, ptr %6, align 4
  %7 = icmp eq i32 %acc1, 4
  br label %8

8:                                                ; preds = %5, %entry
  %9 = phi i1 [ false, %entry ], [ %7, %5 ]
  br i1 %9, label %10, label %13

10:                                               ; preds = %8
  %11 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 2
  %acc2 = load i32, ptr %11, align 4
  %12 = icmp eq i32 %acc2, 6
  br label %13

13:                                               ; preds = %10, %8
  %14 = phi i1 [ false, %8 ], [ %12, %10 ]
  ret i1 %14
}

define private i1 @lambda.102() {
entry:
  %arr = alloca [2 x [2 x i32]], align 4
  %0 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 0, i32 0
  store i32 2, ptr %0, align 4
  %1 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 0, i32 1
  store i32 4, ptr %1, align 4
  %2 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 1, i32 0
  store i32 6, ptr %2, align 4
  %3 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 1, i32 1
  store i32 8, ptr %3, align 4
  %4 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 0, i32 0
  %acc = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc, 2
  br i1 %5, label %6, label %9

6:                                                ; preds = %entry
  %7 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 0, i32 1
  %acc1 = load i32, ptr %7, align 4
  %8 = icmp eq i32 %acc1, 4
  br label %9

9:                                                ; preds = %6, %entry
  %10 = phi i1 [ false, %entry ], [ %8, %6 ]
  br i1 %10, label %11, label %14

11:                                               ; preds = %9
  %12 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 1, i32 0
  %acc2 = load i32, ptr %12, align 4
  %13 = icmp eq i32 %acc2, 6
  br label %14

14:                                               ; preds = %11, %9
  %15 = phi i1 [ false, %9 ], [ %13, %11 ]
  br i1 %15, label %16, label %19

16:                                               ; preds = %14
  %17 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 1, i32 1
  %acc3 = load i32, ptr %17, align 4
  %18 = icmp eq i32 %acc3, 8
  br label %19

19:                                               ; preds = %16, %14
  %20 = phi i1 [ false, %14 ], [ %18, %16 ]
  ret i1 %20
}

define private i1 @lambda.103() {
entry:
  %0 = alloca %Container, align 8
  %1 = getelementptr inbounds %Container, ptr %0, i32 0, i32 0, i32 0
  store i32 10, ptr %1, align 4
  %2 = getelementptr inbounds %Container, ptr %0, i32 0, i32 0, i32 1
  store i32 20, ptr %2, align 4
  %3 = getelementptr inbounds %Container, ptr %0, i32 0, i32 1
  store i1 true, ptr %3, align 1
  %4 = getelementptr inbounds %Container, ptr %0, i32 0, i32 1
  %acc = load i1, ptr %4, align 1
  br i1 %acc, label %5, label %8

5:                                                ; preds = %entry
  %6 = getelementptr inbounds %Container, ptr %0, i32 0, i32 0, i32 0
  %acc1 = load i32, ptr %6, align 4
  %7 = icmp eq i32 %acc1, 10
  br label %8

8:                                                ; preds = %5, %entry
  %9 = phi i1 [ false, %entry ], [ %7, %5 ]
  br i1 %9, label %10, label %13

10:                                               ; preds = %8
  %11 = getelementptr inbounds %Container, ptr %0, i32 0, i32 0, i32 1
  %acc2 = load i32, ptr %11, align 4
  %12 = icmp eq i32 %acc2, 20
  br label %13

13:                                               ; preds = %10, %8
  %14 = phi i1 [ false, %8 ], [ %12, %10 ]
  ret i1 %14
}

define private i1 @lambda.104() {
entry:
  %arr = alloca [2 x [2 x i32]], align 4
  %0 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 0, i32 0
  store i32 1, ptr %0, align 4
  %1 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 0, i32 1
  store i32 2, ptr %1, align 4
  %2 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 1, i32 0
  store i32 3, ptr %2, align 4
  %3 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 1, i32 1
  store i32 4, ptr %3, align 4
  %4 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 0, i32 0
  %acc = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc, 1
  br i1 %5, label %6, label %9

6:                                                ; preds = %entry
  %7 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 0, i32 1
  %acc1 = load i32, ptr %7, align 4
  %8 = icmp eq i32 %acc1, 2
  br label %9

9:                                                ; preds = %6, %entry
  %10 = phi i1 [ false, %entry ], [ %8, %6 ]
  br i1 %10, label %11, label %14

11:                                               ; preds = %9
  %12 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 1, i32 0
  %acc2 = load i32, ptr %12, align 4
  %13 = icmp eq i32 %acc2, 3
  br label %14

14:                                               ; preds = %11, %9
  %15 = phi i1 [ false, %9 ], [ %13, %11 ]
  br i1 %15, label %16, label %19

16:                                               ; preds = %14
  %17 = getelementptr inbounds [2 x [2 x i32]], ptr %arr, i32 0, i32 1, i32 1
  %acc3 = load i32, ptr %17, align 4
  %18 = icmp eq i32 %acc3, 4
  br label %19

19:                                               ; preds = %16, %14
  %20 = phi i1 [ false, %14 ], [ %18, %16 ]
  ret i1 %20
}

define private i1 @lambda.105() {
entry:
  %0 = alloca i32, align 4
  store i32 5, ptr %0, align 4
  %y = load i32, ptr %0, align 4
  %1 = icmp eq i32 %y, 5
  ret i1 %1
}

define private i1 @lambda.106() {
entry:
  %0 = call i32 @declared_below()
  %1 = icmp eq i32 %0, 1
  ret i1 %1
}

define private i1 @lambda.107() {
entry:
  %0 = call i32 @Calculator.multiply(i32 5, i32 5)
  %1 = icmp eq i32 %0, 25
  ret i1 %1
}

define private i1 @lambda.108() {
entry:
  %0 = call i32 @Calculator.sum(i32 5, i32 5)
  %1 = icmp eq i32 %0, 10
  ret i1 %1
}

define private i1 @lambda.109() {
entry:
  %0 = alloca %Point, align 8
  %1 = getelementptr inbounds %Point, ptr %0, i32 0, i32 0
  store i32 7, ptr %1, align 4
  %2 = getelementptr inbounds %Point, ptr %0, i32 0, i32 1
  store i32 6, ptr %2, align 4
  %3 = call i32 @Calculator.multiply(i32 5, i32 5)
  %4 = icmp eq i32 %3, 25
  ret i1 %4
}

define private i1 @lambda.110() {
entry:
  %0 = call i32 @Calculator.divide(i32 5, i32 5)
  %1 = icmp eq i32 %0, 1
  ret i1 %1
}

define private i1 @lambda.111() {
entry:
  %0 = alloca %Point, align 8
  %1 = getelementptr inbounds %Point, ptr %0, i32 0, i32 0
  store i32 7, ptr %1, align 4
  %2 = getelementptr inbounds %Point, ptr %0, i32 0, i32 1
  store i32 6, ptr %2, align 4
  %3 = call i32 @Calculator.divide(i32 10, i32 5)
  %4 = icmp eq i32 %3, 2
  ret i1 %4
}

define private i1 @lambda.112() {
entry:
  %0 = alloca %Point, align 8
  %1 = getelementptr inbounds %Point, ptr %0, i32 0, i32 0
  store i32 7, ptr %1, align 4
  %2 = getelementptr inbounds %Point, ptr %0, i32 0, i32 1
  store i32 6, ptr %2, align 4
  %3 = call i32 @Point.call_divide(i32 10, i32 5)
  %4 = icmp eq i32 %3, 2
  ret i1 %4
}

define private i1 @lambda.113() {
entry:
  %0 = alloca %Point, align 8
  %1 = getelementptr inbounds %Point, ptr %0, i32 0, i32 0
  store i32 5, ptr %1, align 4
  %2 = getelementptr inbounds %Point, ptr %0, i32 0, i32 1
  store i32 5, ptr %2, align 4
  %3 = call i32 @Calculator.multiplyP(ptr %0)
  %4 = icmp eq i32 %3, 25
  ret i1 %4
}

define private i1 @lambda.114() {
entry:
  %0 = alloca %Point, align 8
  %1 = getelementptr inbounds %Point, ptr %0, i32 0, i32 0
  store i32 5, ptr %1, align 4
  %2 = getelementptr inbounds %Point, ptr %0, i32 0, i32 1
  store i32 5, ptr %2, align 4
  %3 = call i32 @Point.call_multiply_p(ptr %0)
  %4 = icmp eq i32 %3, 25
  ret i1 %4
}

define private i1 @lambda.115() {
entry:
  %0 = alloca %Point, align 8
  %1 = getelementptr inbounds %Point, ptr %0, i32 0, i32 0
  store i32 5, ptr %1, align 4
  %2 = getelementptr inbounds %Point, ptr %0, i32 0, i32 1
  store i32 5, ptr %2, align 4
  %3 = call i32 @Calculator.divideP(ptr %0)
  %4 = icmp eq i32 %3, 1
  ret i1 %4
}

define private i1 @lambda.116() {
entry:
  %0 = alloca %Point, align 8
  %1 = getelementptr inbounds %Point, ptr %0, i32 0, i32 0
  store i32 15, ptr %1, align 4
  %2 = getelementptr inbounds %Point, ptr %0, i32 0, i32 1
  store i32 5, ptr %2, align 4
  %3 = call i32 @Calculator.avg(ptr %0)
  %4 = icmp eq i32 %3, 10
  ret i1 %4
}

define private i1 @lambda.117() {
entry:
  %0 = alloca i32, align 4
  store i32 1, ptr %0, align 4
  %1 = alloca ptr, align 8
  store ptr %0, ptr %1, align 8
  store ptr null, ptr %1, align 8
  %y = load ptr, ptr %1, align 8
  %2 = icmp eq ptr %y, null
  ret i1 %2
}

define private i1 @lambda.118() {
entry:
  %0 = alloca i32, align 4
  store i32 1, ptr %0, align 4
  %1 = alloca ptr, align 8
  store ptr %0, ptr %1, align 8
  %y = load ptr, ptr %1, align 8
  %2 = icmp ne ptr %y, null
  ret i1 %2
}

define private i1 @lambda.119() {
entry:
  %arr = alloca [2 x %Point], align 8
  %0 = getelementptr inbounds [2 x %Point], ptr %arr, i32 0, i32 0, i32 0
  store i32 3, ptr %0, align 4
  %1 = getelementptr inbounds [2 x %Point], ptr %arr, i32 0, i32 0, i32 1
  store i32 4, ptr %1, align 4
  %2 = getelementptr inbounds [2 x %Point], ptr %arr, i32 0, i32 1, i32 0
  store i32 5, ptr %2, align 4
  %3 = getelementptr inbounds [2 x %Point], ptr %arr, i32 0, i32 1, i32 1
  store i32 6, ptr %3, align 4
  %4 = getelementptr inbounds [2 x %Point], ptr %arr, i32 0, i32 0, i32 0
  %acc = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc, 3
  br i1 %5, label %6, label %9

6:                                                ; preds = %entry
  %7 = getelementptr inbounds [2 x %Point], ptr %arr, i32 0, i32 0, i32 1
  %acc1 = load i32, ptr %7, align 4
  %8 = icmp eq i32 %acc1, 4
  br label %9

9:                                                ; preds = %6, %entry
  %10 = phi i1 [ false, %entry ], [ %8, %6 ]
  br i1 %10, label %11, label %14

11:                                               ; preds = %9
  %12 = getelementptr inbounds [2 x %Point], ptr %arr, i32 0, i32 1, i32 0
  %acc2 = load i32, ptr %12, align 4
  %13 = icmp eq i32 %acc2, 5
  br label %14

14:                                               ; preds = %11, %9
  %15 = phi i1 [ false, %9 ], [ %13, %11 ]
  br i1 %15, label %16, label %19

16:                                               ; preds = %14
  %17 = getelementptr inbounds [2 x %Point], ptr %arr, i32 0, i32 1, i32 1
  %acc3 = load i32, ptr %17, align 4
  %18 = icmp eq i32 %acc3, 6
  br label %19

19:                                               ; preds = %16, %14
  %20 = phi i1 [ false, %14 ], [ %18, %16 ]
  ret i1 %20
}

define private i1 @lambda.120() {
entry:
  %0 = alloca %Point, align 8
  %1 = getelementptr inbounds %Point, ptr %0, i32 0, i32 0
  store i32 10, ptr %1, align 4
  %2 = getelementptr inbounds %Point, ptr %0, i32 0, i32 1
  store i32 20, ptr %2, align 4
  %3 = call i32 @double_sum(ptr %0)
  %4 = icmp eq i32 %3, 60
  ret i1 %4
}

define private i1 @lambda.121() {
entry:
  %0 = alloca %Point, align 8
  %1 = getelementptr inbounds %Point, ptr %0, i32 0, i32 0
  store i32 10, ptr %1, align 4
  %2 = getelementptr inbounds %Point, ptr %0, i32 0, i32 1
  store i32 20, ptr %2, align 4
  %3 = call i32 @Summer.summer_sum(ptr %0)
  %4 = icmp eq i32 %3, 30
  ret i1 %4
}

; Function Attrs: nounwind
define private void @test_var_init() #0 {
entry:
  call void @test(ptr @114, ptr @lambda.122)
  call void @test(ptr @115, ptr @lambda.123)
  call void @test(ptr @116, ptr @lambda.124)
  call void @test(ptr @117, ptr @lambda.125)
  call void @test(ptr @118, ptr @lambda.126)
  call void @test(ptr @119, ptr @lambda.127)
  call void @test(ptr @120, ptr @lambda.128)
  ret void
}

define private i1 @lambda.122() {
entry:
  %0 = alloca i32, align 4
  store i32 5, ptr %0, align 4
  %x = load i32, ptr %0, align 4
  %1 = icmp eq i32 %x, 5
  ret i1 %1
}

define private i1 @lambda.123() {
entry:
  %0 = alloca i32, align 4
  store i32 5, ptr %0, align 4
  store i32 6, ptr %0, align 4
  %x = load i32, ptr %0, align 4
  %1 = icmp eq i32 %x, 6
  ret i1 %1
}

define private i1 @lambda.124() {
entry:
  %x = alloca i32, align 4
  store i32 6, ptr %x, align 4
  %x1 = load i32, ptr %x, align 4
  %0 = icmp eq i32 %x1, 6
  ret i1 %0
}

define private i1 @lambda.125() {
entry:
  %0 = alloca i32, align 4
  store i32 5, ptr %0, align 4
  %x = load i32, ptr %0, align 4
  %1 = icmp eq i32 %x, 5
  ret i1 %1
}

define private i1 @lambda.126() {
entry:
  ret i1 true
}

define private i1 @lambda.127() {
entry:
  %glob_const = load i32, ptr @glob_const, align 4
  %0 = icmp eq i32 %glob_const, 800
  ret i1 %0
}

define private i1 @lambda.128() {
entry:
  ret i1 true
}

; Function Attrs: nounwind
define private i64 @animal_sum(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i64, i64 }, ptr %0, i32 0, i32 0
  %acc = load i64, ptr %1, align 4
  %2 = getelementptr inbounds { i64, i64 }, ptr %0, i32 0, i32 1
  %acc1 = load i64, ptr %2, align 4
  %3 = add i64 %acc, %acc1
  ret i64 %3
}

; Function Attrs: nounwind
define private i64 @get_dog_sum(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { { { i64, i64 }, i64 }, i64, i64 }, ptr %0, i32 0, i32 1
  %acc = load i64, ptr %1, align 4
  %2 = getelementptr inbounds { { { i64, i64 }, i64 }, i64, i64 }, ptr %0, i32 0, i32 2
  %acc1 = load i64, ptr %2, align 4
  %3 = add i64 %acc, %acc1
  ret i64 %3
}

; Function Attrs: nounwind
define private void @test_single_inheritance() #0 {
entry:
  call void @test(ptr @121, ptr @lambda.129)
  call void @test(ptr @122, ptr @lambda.130)
  call void @test(ptr @123, ptr @lambda.131)
  call void @test(ptr @124, ptr @lambda.132)
  call void @test(ptr @125, ptr @lambda.133)
  call void @test(ptr @126, ptr @lambda.134)
  call void @test(ptr @127, ptr @lambda.135)
  call void @test(ptr @128, ptr @lambda.136)
  ret void
}

; Function Attrs: nounwind
define private void @test_inheritance() #0 {
entry:
  call void @test_single_inheritance()
  ret void
}

; Function Attrs: nounwind
define private i64 @Animal.sum_animal(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i64, i64 }, ptr %0, i32 0, i32 0
  %acc = load i64, ptr %1, align 4
  %2 = getelementptr inbounds { i64, i64 }, ptr %0, i32 0, i32 1
  %acc1 = load i64, ptr %2, align 4
  %3 = add i64 %acc, %acc1
  ret i64 %3
}

; Function Attrs: nounwind
define private i64 @WalkingAnimal.indirect_animal_sum(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { { i64, i64 }, i64 }, ptr %0, i32 0, i32 0, i32 0
  %acc = load i64, ptr %1, align 4
  %2 = getelementptr inbounds { { i64, i64 }, i64 }, ptr %0, i32 0, i32 0, i32 1
  %acc1 = load i64, ptr %2, align 4
  %3 = add i64 %acc, %acc1
  ret i64 %3
}

; Function Attrs: nounwind
define private i64 @WalkingAnimal.get_speed(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { { i64, i64 }, i64 }, ptr %0, i32 0, i32 1
  %acc = load i64, ptr %1, align 4
  ret i64 %acc
}

; Function Attrs: nounwind
define private i64 @Dog.indirect_animal_sum_2(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { { { i64, i64 }, i64 }, i64, i64 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc = load i64, ptr %1, align 4
  %2 = getelementptr inbounds { { { i64, i64 }, i64 }, i64, i64 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  %acc1 = load i64, ptr %2, align 4
  %3 = add i64 %acc, %acc1
  ret i64 %3
}

; Function Attrs: nounwind
define private i64 @Dog.sum_dog(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { { { i64, i64 }, i64 }, i64, i64 }, ptr %0, i32 0, i32 1
  %acc = load i64, ptr %1, align 4
  %2 = getelementptr inbounds { { { i64, i64 }, i64 }, i64, i64 }, ptr %0, i32 0, i32 2
  %acc1 = load i64, ptr %2, align 4
  %3 = add i64 %acc, %acc1
  ret i64 %3
}

define private i1 @lambda.129() {
entry:
  %0 = alloca %Animal, align 8
  %1 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 0
  store i64 12, ptr %1, align 4
  %2 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 1
  store i64 13, ptr %2, align 4
  %3 = call i64 @animal_sum(ptr %0)
  %4 = icmp eq i64 %3, 25
  ret i1 %4
}

define private i1 @lambda.130() {
entry:
  %0 = alloca %Dog, align 8
  %1 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 0
  store i64 30, ptr %1, align 4
  %2 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 1
  store i64 40, ptr %2, align 4
  %3 = getelementptr inbounds %WalkingAnimal, ptr %0, i32 0, i32 1
  store i64 90, ptr %3, align 4
  %4 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 1
  store i64 40, ptr %4, align 4
  %5 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 2
  store i64 40, ptr %5, align 4
  %6 = call i64 @animal_sum(ptr %0)
  %7 = icmp eq i64 %6, 70
  br i1 %7, label %8, label %11

8:                                                ; preds = %entry
  %9 = call i64 @get_dog_sum(ptr %0)
  %10 = icmp eq i64 %9, 80
  br label %11

11:                                               ; preds = %8, %entry
  %12 = phi i1 [ false, %entry ], [ %10, %8 ]
  ret i1 %12
}

define private i1 @lambda.131() {
entry:
  %0 = alloca %Dog, align 8
  %1 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 0
  store i64 30, ptr %1, align 4
  %2 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 1
  store i64 40, ptr %2, align 4
  %3 = getelementptr inbounds %WalkingAnimal, ptr %0, i32 0, i32 1
  store i64 90, ptr %3, align 4
  %4 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 1
  store i64 40, ptr %4, align 4
  %5 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 2
  store i64 20, ptr %5, align 4
  %6 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc = load i64, ptr %6, align 4
  %7 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 2
  %acc1 = load i64, ptr %7, align 4
  %8 = add i64 %acc, %acc1
  %9 = icmp eq i64 %8, 50
  br i1 %9, label %10, label %15

10:                                               ; preds = %entry
  %11 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc2 = load i64, ptr %11, align 4
  %12 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 0, i32 0, i32 1
  %acc3 = load i64, ptr %12, align 4
  %13 = add i64 %acc2, %acc3
  %14 = icmp eq i64 %13, 70
  br label %15

15:                                               ; preds = %10, %entry
  %16 = phi i1 [ false, %entry ], [ %14, %10 ]
  ret i1 %16
}

define private i1 @lambda.132() {
entry:
  %0 = alloca %Dog, align 8
  %1 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 0
  store i64 30, ptr %1, align 4
  %2 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 1
  store i64 40, ptr %2, align 4
  %3 = getelementptr inbounds %WalkingAnimal, ptr %0, i32 0, i32 1
  store i64 90, ptr %3, align 4
  %4 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 1
  store i64 40, ptr %4, align 4
  %5 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 2
  store i64 20, ptr %5, align 4
  %6 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 0, i32 1
  %acc = load i64, ptr %6, align 4
  %7 = icmp eq i64 %acc, 90
  ret i1 %7
}

define private i1 @lambda.133() {
entry:
  %0 = alloca %Dog, align 8
  %1 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 0
  store i64 11, ptr %1, align 4
  %2 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 1
  store i64 11, ptr %2, align 4
  %3 = getelementptr inbounds %WalkingAnimal, ptr %0, i32 0, i32 1
  store i64 90, ptr %3, align 4
  %4 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 1
  store i64 40, ptr %4, align 4
  %5 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 2
  store i64 20, ptr %5, align 4
  %6 = call i64 @Animal.sum_animal(ptr %0)
  %7 = icmp eq i64 %6, 22
  ret i1 %7
}

define private i1 @lambda.134() {
entry:
  %0 = alloca %Dog, align 8
  %1 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 0
  store i64 12, ptr %1, align 4
  %2 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 1
  store i64 11, ptr %2, align 4
  %3 = getelementptr inbounds %WalkingAnimal, ptr %0, i32 0, i32 1
  store i64 32, ptr %3, align 4
  %4 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 1
  store i64 40, ptr %4, align 4
  %5 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 2
  store i64 20, ptr %5, align 4
  %6 = call i64 @WalkingAnimal.indirect_animal_sum(ptr %0)
  %7 = icmp eq i64 %6, 23
  br i1 %7, label %8, label %11

8:                                                ; preds = %entry
  %9 = call i64 @Dog.indirect_animal_sum_2(ptr %0)
  %10 = icmp eq i64 %9, 23
  br label %11

11:                                               ; preds = %8, %entry
  %12 = phi i1 [ false, %entry ], [ %10, %8 ]
  ret i1 %12
}

define private i1 @lambda.135() {
entry:
  %0 = alloca %Dog, align 8
  %1 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 0
  store i64 11, ptr %1, align 4
  %2 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 1
  store i64 11, ptr %2, align 4
  %3 = getelementptr inbounds %WalkingAnimal, ptr %0, i32 0, i32 1
  store i64 32, ptr %3, align 4
  %4 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 1
  store i64 40, ptr %4, align 4
  %5 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 2
  store i64 20, ptr %5, align 4
  %6 = call i64 @WalkingAnimal.get_speed(ptr %0)
  %7 = icmp eq i64 %6, 32
  ret i1 %7
}

define private i1 @lambda.136() {
entry:
  %0 = alloca %Dog, align 8
  %1 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 0
  store i64 11, ptr %1, align 4
  %2 = getelementptr inbounds %Animal, ptr %0, i32 0, i32 1
  store i64 11, ptr %2, align 4
  %3 = getelementptr inbounds %WalkingAnimal, ptr %0, i32 0, i32 1
  store i64 32, ptr %3, align 4
  %4 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 1
  store i64 15, ptr %4, align 4
  %5 = getelementptr inbounds %Dog, ptr %0, i32 0, i32 2
  store i64 12, ptr %5, align 4
  %6 = call i64 @Dog.sum_dog(ptr %0)
  %7 = icmp eq i64 %6, 27
  ret i1 %7
}

; Function Attrs: nounwind
define private i32 @sum_this_please(i32 %0, i32 %1) #0 {
entry:
  %2 = add i32 %0, %1
  ret i32 %2
}

; Function Attrs: nounwind
define private void @create_pair(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 0
  store i32 33, ptr %1, align 4
  %2 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 1
  store i32 55, ptr %2, align 4
  ret void
}

; Function Attrs: nounwind
define private void @create_pair_as_variable(ptr %0) #0 {
entry:
  %1 = alloca %Pair, align 8
  %2 = getelementptr inbounds %Pair, ptr %1, i32 0, i32 0
  store i32 44, ptr %2, align 4
  %3 = getelementptr inbounds %Pair, ptr %1, i32 0, i32 1
  store i32 66, ptr %3, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr %0, ptr %1, i64 8, i1 false)
  ret void
}

; Function Attrs: nounwind
define private void @give_pair(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 0
  store i32 99, ptr %1, align 4
  %2 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 1
  store i32 98, ptr %2, align 4
  ret void
}

; Function Attrs: nounwind
define private i1 @test_pair(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 99
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc1, 98
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  ret i1 %7
}

; Function Attrs: nounwind
define private i1 @check_implicit(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 55
  ret i1 %2
}

; Function Attrs: nounwind
define private void @give_implicit_return(ptr %0) #0 {
entry:
  %1 = alloca %ImpPair, align 8
  call void @ImpPair.makexv(ptr %1, i32 65)
  %2 = getelementptr inbounds { i32 }, ptr %1
  call void @llvm.memcpy.p0.p0.i64(ptr %0, ptr %2, i64 4, i1 false)
  ret void
}

; Function Attrs: nounwind
define private void @give_explicit_return(ptr %0) #0 {
entry:
  %1 = alloca %ImpPair, align 8
  call void @ImpPair.makexv(ptr %1, i32 65)
  %2 = getelementptr inbounds { i32 }, ptr %1
  call void @llvm.memcpy.p0.p0.i64(ptr %0, ptr %2, i64 4, i1 false)
  ret void
}

; Function Attrs: nounwind
define private void @test_structs() #0 {
entry:
  call void @test(ptr @129, ptr @lambda.137)
  call void @test(ptr @130, ptr @lambda.138)
  call void @test(ptr @131, ptr @lambda.139)
  call void @test(ptr @132, ptr @lambda.140)
  call void @test(ptr @133, ptr @lambda.141)
  call void @test(ptr @134, ptr @lambda.142)
  call void @test(ptr @135, ptr @lambda.143)
  call void @test(ptr @136, ptr @lambda.144)
  call void @test(ptr @137, ptr @lambda.145)
  call void @test(ptr @138, ptr @lambda.146)
  call void @test(ptr @139, ptr @lambda.147)
  call void @test(ptr @140, ptr @lambda.148)
  call void @test(ptr @141, ptr @lambda.149)
  call void @test(ptr @142, ptr @lambda.150)
  call void @test(ptr @143, ptr @lambda.151)
  call void @test(ptr @144, ptr @lambda.152)
  call void @test(ptr @145, ptr @lambda.153)
  call void @test(ptr @146, ptr @lambda.154)
  call void @test(ptr @147, ptr @lambda.155)
  call void @test(ptr @148, ptr @lambda.156)
  call void @test(ptr @149, ptr @lambda.157)
  call void @test(ptr @150, ptr @lambda.158)
  call void @test_inheritance()
  ret void
}

; Function Attrs: nounwind
define private void @Pair.pair(ptr %0, i32 %1) #0 {
entry:
  %2 = sdiv i32 %1, 2
  %3 = alloca i32, align 4
  store i32 %2, ptr %3, align 4
  %r = load i32, ptr %3, align 4
  %4 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  store i32 %r, ptr %4, align 4
  %r1 = load i32, ptr %3, align 4
  %5 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  store i32 %r1, ptr %5, align 4
  ret void
}

; Function Attrs: nounwind
define private i32 @Pair.get_pair_sum(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %2, align 4
  %3 = add i32 %acc, %acc1
  ret i32 %3
}

; Function Attrs: nounwind
define private i32 @Pair.check_direct_call(ptr %0) #0 {
entry:
  %1 = call i32 @Pair.get_pair_sum(ptr %0)
  ret i32 %1
}

; Function Attrs: nounwind
define private i32 @Pair.check_indirect_call(ptr %0) #0 {
entry:
  %1 = call i32 @Pair.get_pair_sum(ptr %0)
  ret i32 %1
}

; Function Attrs: nounwind
define private i32 @Pair.check_outside_call(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %2, align 4
  %3 = call i32 @sum_this_please(i32 %acc, i32 %acc1)
  ret i32 %3
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly %0, ptr noalias nocapture readonly %1, i64 %2, i1 immarg %3) #1

; Function Attrs: nounwind
define private void @ImpPair.makexv(ptr %0, i32 %1) #0 {
entry:
  %2 = getelementptr inbounds { i32 }, ptr %0, i32 0, i32 0
  store i32 %1, ptr %2, align 4
  ret void
}

define private i1 @lambda.137() {
entry:
  %0 = alloca %Pair, align 8
  call void @create_pair(ptr %0)
  %1 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 33
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc1, 55
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  ret i1 %7
}

define private i1 @lambda.138() {
entry:
  %0 = alloca %Pair, align 8
  call void @create_pair_as_variable(ptr %0)
  %1 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 44
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc1, 66
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  ret i1 %7
}

define private i1 @lambda.139() {
entry:
  %0 = alloca %DeeplyNested, align 8
  %1 = getelementptr inbounds %DeeplyNested3, ptr %0, i32 0, i32 0
  store i32 55, ptr %1, align 4
  %2 = getelementptr inbounds %DeeplyNested, ptr %0, i32 0, i32 0, i32 0, i32 0, i32 0
  %acc = load i32, ptr %2, align 4
  %3 = icmp eq i32 %acc, 55
  ret i1 %3
}

define private i1 @lambda.140() {
entry:
  %0 = alloca %DeeplyNested3, align 8
  %1 = getelementptr inbounds %DeeplyNested3, ptr %0, i32 0, i32 0
  store i32 55, ptr %1, align 4
  %2 = alloca %PointerStr, align 8
  %3 = getelementptr inbounds %PointerStr, ptr %2, i32 0, i32 0
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds { i32 }, ptr %4, i32 0, i32 0
  %acc = load i32, ptr %5, align 4
  %6 = icmp eq i32 %acc, 55
  ret i1 %6
}

define private i1 @lambda.141() {
entry:
  %0 = alloca %Pair, align 8
  %1 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 0
  store i32 10, ptr %1, align 4
  %2 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 1
  store i32 10, ptr %2, align 4
  %3 = call i32 @Pair.get_pair_sum(ptr %0)
  %4 = icmp eq i32 %3, 20
  ret i1 %4
}

define private i1 @lambda.142() {
entry:
  %0 = alloca %Pair, align 8
  %1 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 0
  store i32 10, ptr %1, align 4
  %2 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 1
  store i32 10, ptr %2, align 4
  %3 = call i32 @Pair.check_direct_call(ptr %0)
  %4 = icmp eq i32 %3, 20
  ret i1 %4
}

define private i1 @lambda.143() {
entry:
  %0 = alloca %Pair, align 8
  %1 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 0
  store i32 10, ptr %1, align 4
  %2 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 1
  store i32 10, ptr %2, align 4
  %3 = call i32 @Pair.check_indirect_call(ptr %0)
  %4 = icmp eq i32 %3, 20
  ret i1 %4
}

define private i1 @lambda.144() {
entry:
  %0 = alloca %Pair, align 8
  %1 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 0
  store i32 10, ptr %1, align 4
  %2 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 1
  store i32 10, ptr %2, align 4
  %3 = call i32 @Pair.check_outside_call(ptr %0)
  %4 = icmp eq i32 %3, 20
  ret i1 %4
}

define private i1 @lambda.145() {
entry:
  %0 = alloca %Pair, align 8
  call void @Pair.pair(ptr %0, i32 4)
  %1 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 2
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc1, 2
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  ret i1 %7
}

define private i1 @lambda.146() {
entry:
  %0 = alloca %Pair, align 8
  %1 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 0
  store i32 99, ptr %1, align 4
  %2 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 1
  store i32 98, ptr %2, align 4
  %3 = call i1 @test_pair(ptr %0)
  ret i1 %3
}

define private i1 @lambda.147() {
entry:
  %0 = alloca %Pair, align 8
  call void @give_pair(ptr %0)
  %1 = call i1 @test_pair(ptr %0)
  ret i1 %1
}

define private i1 @lambda.148() {
entry:
  %0 = alloca %Pair, align 8
  %1 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 0
  store i32 99, ptr %1, align 4
  %2 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 1
  store i32 98, ptr %2, align 4
  %3 = call i1 @test_pair(ptr %0)
  ret i1 %3
}

define private i1 @lambda.149() {
entry:
  %0 = alloca %Pair, align 8
  call void @give_pair(ptr %0)
  %1 = getelementptr inbounds { i32, i32 }, ptr %0
  %2 = call i1 @test_pair(ptr %1)
  ret i1 %2
}

define private i1 @lambda.150() {
entry:
  %0 = alloca %ImpPair, align 8
  call void @ImpPair.makexv(ptr %0, i32 55)
  %1 = getelementptr inbounds { i32 }, ptr %0
  %2 = call i1 @check_implicit(ptr %1)
  ret i1 %2
}

define private i1 @lambda.151() {
entry:
  %0 = alloca %ImpPair, align 8
  call void @ImpPair.makexv(ptr %0, i32 55)
  %1 = getelementptr inbounds { i32 }, ptr %0
  %2 = call i1 @check_implicit(ptr %1)
  ret i1 %2
}

define private i1 @lambda.152() {
entry:
  %0 = alloca %ImpContainer, align 8
  %1 = getelementptr inbounds %ImpContainer, ptr %0, i32 0, i32 0
  call void @ImpPair.makexv(ptr %1, i32 55)
  %2 = getelementptr inbounds %ImpContainer, ptr %0, i32 0, i32 0, i32 0
  %acc = load i32, ptr %2, align 4
  %3 = icmp eq i32 %acc, 55
  ret i1 %3
}

define private i1 @lambda.153() {
entry:
  %0 = alloca %ImpContainer, align 8
  %1 = getelementptr inbounds %ImpContainer, ptr %0, i32 0, i32 0
  call void @ImpPair.makexv(ptr %1, i32 55)
  %2 = getelementptr inbounds %ImpContainer, ptr %0, i32 0, i32 0, i32 0
  %acc = load i32, ptr %2, align 4
  %3 = icmp eq i32 %acc, 55
  ret i1 %3
}

define private i1 @lambda.154() {
entry:
  %arr = alloca [1 x %ImpPair], align 8
  %0 = getelementptr inbounds [1 x %ImpPair], ptr %arr, i32 0, i32 0
  call void @ImpPair.makexv(ptr %0, i32 55)
  %1 = getelementptr inbounds [1 x %ImpPair], ptr %arr, i32 0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 55
  ret i1 %2
}

define private i1 @lambda.155() {
entry:
  %arr = alloca [1 x %ImpPair], align 8
  %0 = getelementptr inbounds [1 x %ImpPair], ptr %arr, i32 0, i32 0
  call void @ImpPair.makexv(ptr %0, i32 55)
  %1 = getelementptr inbounds [1 x %ImpPair], ptr %arr, i32 0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 55
  ret i1 %2
}

define private i1 @lambda.156() {
entry:
  %0 = alloca %ImpPair, align 8
  call void @give_implicit_return(ptr %0)
  %1 = getelementptr inbounds %ImpPair, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 65
  ret i1 %2
}

define private i1 @lambda.157() {
entry:
  %0 = alloca %ImpPair, align 8
  call void @give_explicit_return(ptr %0)
  %1 = getelementptr inbounds %ImpPair, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 65
  ret i1 %2
}

define private i1 @lambda.158() {
entry:
  %0 = alloca %IntPair, align 8
  %1 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 0
  store i32 14, ptr %1, align 4
  %2 = getelementptr inbounds %Pair, ptr %0, i32 0, i32 1
  store i32 12, ptr %2, align 4
  %3 = getelementptr inbounds %IntPair, ptr %0, i32 0, i32 0
  %4 = call i32 @Pair.get_pair_sum(ptr %3)
  %5 = icmp eq i32 %4, 26
  ret i1 %5
}

; Function Attrs: nounwind
define private i1 @take_my_enum_dawg(i32 %0) #0 {
entry:
  %1 = icmp eq i32 %0, 0
  ret i1 %1
}

; Function Attrs: nounwind
define private i1 @take_my_enum_again_dawg(i32 %0) #0 {
entry:
  %1 = icmp eq i32 %0, 1
  ret i1 %1
}

; Function Attrs: nounwind
define private i32 @take_my_thing() #0 {
entry:
  ret i32 1
}

; Function Attrs: nounwind
define private void @test_enum() #0 {
entry:
  call void @test(ptr @151, ptr @lambda.159)
  call void @test(ptr @152, ptr @lambda.160)
  call void @test(ptr @153, ptr @lambda.161)
  call void @test(ptr @154, ptr @lambda.162)
  call void @test(ptr @155, ptr @lambda.163)
  call void @test(ptr @156, ptr @lambda.164)
  call void @test(ptr @157, ptr @lambda.165)
  call void @test(ptr @158, ptr @lambda.166)
  call void @test(ptr @159, ptr @lambda.167)
  call void @test(ptr @160, ptr @lambda.168)
  ret void
}

define private i1 @lambda.159() {
entry:
  br i1 true, label %0, label %1

0:                                                ; preds = %entry
  br label %1

1:                                                ; preds = %0, %entry
  %2 = phi i1 [ false, %entry ], [ true, %0 ]
  ret i1 %2
}

define private i1 @lambda.160() {
entry:
  br i1 true, label %0, label %1

0:                                                ; preds = %entry
  br label %1

1:                                                ; preds = %0, %entry
  %2 = phi i1 [ false, %entry ], [ true, %0 ]
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %3, %1
  %5 = phi i1 [ false, %1 ], [ true, %3 ]
  ret i1 %5
}

define private i1 @lambda.161() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %x = load i32, ptr %0, align 4
  %1 = icmp eq i32 %x, 0
  br i1 %1, label %2, label %4

2:                                                ; preds = %entry
  %x1 = load i32, ptr %0, align 4
  %3 = icmp ne i32 %x1, 1
  br label %4

4:                                                ; preds = %2, %entry
  %5 = phi i1 [ false, %entry ], [ %3, %2 ]
  ret i1 %5
}

define private i1 @lambda.162() {
entry:
  %x = alloca i32, align 4
  store i32 1, ptr %x, align 4
  %x1 = load i32, ptr %x, align 4
  %0 = icmp eq i32 %x1, 1
  br i1 %0, label %1, label %3

1:                                                ; preds = %entry
  %x2 = load i32, ptr %x, align 4
  %2 = icmp ne i32 %x2, 0
  br label %3

3:                                                ; preds = %1, %entry
  %4 = phi i1 [ false, %entry ], [ %2, %1 ]
  ret i1 %4
}

define private i1 @lambda.163() {
entry:
  %0 = alloca %EnumThing, align 8
  %1 = getelementptr inbounds %EnumThing, ptr %0, i32 0, i32 0
  store i32 0, ptr %1, align 4
  %2 = getelementptr inbounds %EnumThing, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %2, align 4
  %3 = icmp eq i32 %acc, 0
  br i1 %3, label %4, label %7

4:                                                ; preds = %entry
  %5 = getelementptr inbounds %EnumThing, ptr %0, i32 0, i32 0
  %acc1 = load i32, ptr %5, align 4
  %6 = icmp ne i32 %acc1, 1
  br label %7

7:                                                ; preds = %4, %entry
  %8 = phi i1 [ false, %entry ], [ %6, %4 ]
  ret i1 %8
}

define private i1 @lambda.164() {
entry:
  %0 = alloca %EnumThing, align 8
  %1 = getelementptr inbounds %EnumThing, ptr %0, i32 0, i32 0
  store i32 1, ptr %1, align 4
  %2 = getelementptr inbounds %EnumThing, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %2, align 4
  %3 = icmp eq i32 %acc, 1
  br i1 %3, label %4, label %7

4:                                                ; preds = %entry
  %5 = getelementptr inbounds %EnumThing, ptr %0, i32 0, i32 0
  %acc1 = load i32, ptr %5, align 4
  %6 = icmp ne i32 %acc1, 0
  br label %7

7:                                                ; preds = %4, %entry
  %8 = phi i1 [ false, %entry ], [ %6, %4 ]
  ret i1 %8
}

define private i1 @lambda.165() {
entry:
  %0 = call i1 @take_my_enum_dawg(i32 0)
  ret i1 %0
}

define private i1 @lambda.166() {
entry:
  %0 = call i1 @take_my_enum_again_dawg(i32 1)
  ret i1 %0
}

define private i1 @lambda.167() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %a = load i32, ptr %0, align 4
  %1 = call i1 @take_my_enum_dawg(i32 %a)
  ret i1 %1
}

define private i1 @lambda.168() {
entry:
  %0 = call i32 @take_my_thing()
  %1 = icmp eq i32 %0, 1
  ret i1 %1
}

; Function Attrs: nounwind
define private i64 @implicit_cast_ret_test() #0 {
entry:
  %0 = alloca i32, align 4
  store i32 55, ptr %0, align 4
  %i = load i32, ptr %0, align 4
  %1 = sext i32 %i to i64
  ret i64 %1
}

; Function Attrs: nounwind
define private i32 @implicit_cast_ret_test_2() #0 {
entry:
  %0 = alloca i64, align 8
  store i64 55, ptr %0, align 4
  %i = load i64, ptr %0, align 4
  %1 = trunc i64 %i to i32
  ret i32 %1
}

; Function Attrs: nounwind
define private void @test_numbers() #0 {
entry:
  call void @test(ptr @161, ptr @lambda.169)
  call void @test(ptr @162, ptr @lambda.170)
  call void @test(ptr @163, ptr @lambda.171)
  call void @test(ptr @164, ptr @lambda.172)
  call void @test(ptr @165, ptr @lambda.173)
  call void @test(ptr @166, ptr @lambda.174)
  call void @test(ptr @167, ptr @lambda.175)
  call void @test(ptr @168, ptr @lambda.176)
  call void @test(ptr @169, ptr @lambda.177)
  call void @test(ptr @170, ptr @lambda.178)
  call void @test(ptr @171, ptr @lambda.179)
  call void @test(ptr @172, ptr @lambda.180)
  call void @test(ptr @173, ptr @lambda.181)
  call void @test(ptr @174, ptr @lambda.182)
  call void @test(ptr @175, ptr @lambda.183)
  call void @test(ptr @176, ptr @lambda.184)
  call void @test(ptr @177, ptr @lambda.185)
  call void @test(ptr @178, ptr @lambda.186)
  call void @test(ptr @179, ptr @lambda.187)
  call void @test(ptr @180, ptr @lambda.188)
  call void @test(ptr @181, ptr @lambda.189)
  ret void
}

define private i1 @lambda.169() {
entry:
  %0 = alloca i32, align 4
  store i32 33, ptr %0, align 4
  %1 = alloca i32, align 4
  store i32 33, ptr %1, align 4
  %i = load i32, ptr %0, align 4
  %w = load i32, ptr %1, align 4
  %2 = icmp eq i32 %i, %w
  ret i1 %2
}

define private i1 @lambda.170() {
entry:
  %0 = alloca i16, align 2
  store i16 22, ptr %0, align 2
  %1 = alloca i16, align 2
  store i16 22, ptr %1, align 2
  %i = load i16, ptr %0, align 2
  %w = load i16, ptr %1, align 2
  %2 = icmp eq i16 %i, %w
  ret i1 %2
}

define private i1 @lambda.171() {
entry:
  %0 = alloca i16, align 2
  store i16 44, ptr %0, align 2
  %1 = alloca i16, align 2
  store i16 44, ptr %1, align 2
  %i = load i16, ptr %0, align 2
  %w = load i16, ptr %1, align 2
  %2 = icmp eq i16 %i, %w
  ret i1 %2
}

define private i1 @lambda.172() {
entry:
  %0 = alloca i64, align 8
  store i64 777, ptr %0, align 4
  %1 = alloca i64, align 8
  store i64 777, ptr %1, align 4
  %i = load i64, ptr %0, align 4
  %w = load i64, ptr %1, align 4
  %2 = icmp eq i64 %i, %w
  ret i1 %2
}

define private i1 @lambda.173() {
entry:
  %0 = alloca i64, align 8
  store i64 777, ptr %0, align 4
  %1 = alloca i64, align 8
  store i64 777, ptr %1, align 4
  %i = load i64, ptr %0, align 4
  %w = load i64, ptr %1, align 4
  %2 = icmp eq i64 %i, %w
  ret i1 %2
}

define private i1 @lambda.174() {
entry:
  %0 = alloca i64, align 8
  store i64 888, ptr %0, align 4
  %1 = alloca i64, align 8
  store i64 888, ptr %1, align 4
  %i = load i64, ptr %0, align 4
  %w = load i64, ptr %1, align 4
  %2 = icmp eq i64 %i, %w
  ret i1 %2
}

define private i1 @lambda.175() {
entry:
  %0 = alloca i64, align 8
  store i64 999, ptr %0, align 4
  %1 = alloca i64, align 8
  store i64 999, ptr %1, align 4
  %i = load i64, ptr %0, align 4
  %w = load i64, ptr %1, align 4
  %2 = icmp eq i64 %i, %w
  ret i1 %2
}

define private i1 @lambda.176() {
entry:
  %0 = alloca i32, align 4
  store i32 1, ptr %0, align 4
  %i = load i32, ptr %0, align 4
  %1 = icmp eq i32 %i, 1
  ret i1 %1
}

define private i1 @lambda.177() {
entry:
  %0 = alloca i16, align 2
  store i16 1, ptr %0, align 2
  %i = load i16, ptr %0, align 2
  %1 = icmp eq i16 %i, 1
  ret i1 %1
}

define private i1 @lambda.178() {
entry:
  %0 = alloca i16, align 2
  store i16 1, ptr %0, align 2
  %i = load i16, ptr %0, align 2
  %1 = icmp eq i16 %i, 1
  ret i1 %1
}

define private i1 @lambda.179() {
entry:
  %0 = alloca i16, align 2
  store i16 1, ptr %0, align 2
  %i = load i16, ptr %0, align 2
  %1 = icmp eq i16 %i, 1
  ret i1 %1
}

define private i1 @lambda.180() {
entry:
  ret i1 true
}

define private i1 @lambda.181() {
entry:
  %0 = alloca i16, align 2
  store i16 44, ptr %0, align 2
  store i16 33, ptr %0, align 2
  %i = load i16, ptr %0, align 2
  %1 = icmp eq i16 %i, 33
  ret i1 %1
}

define private i1 @lambda.182() {
entry:
  %0 = alloca i32, align 4
  store i32 10, ptr %0, align 4
  store i32 2147483647, ptr %0, align 4
  %i = load i32, ptr %0, align 4
  %1 = icmp eq i32 %i, 2147483647
  ret i1 %1
}

define private i1 @lambda.183() {
entry:
  %0 = alloca i64, align 8
  store i64 10, ptr %0, align 4
  store i64 2147483647, ptr %0, align 4
  %i = load i64, ptr %0, align 4
  %1 = icmp eq i64 %i, 2147483647
  ret i1 %1
}

define private i1 @lambda.184() {
entry:
  %0 = alloca i64, align 8
  store i64 10, ptr %0, align 4
  store i64 9223372036854775807, ptr %0, align 4
  %i = load i64, ptr %0, align 4
  %1 = icmp eq i64 %i, 9223372036854775807
  ret i1 %1
}

define private i1 @lambda.185() {
entry:
  %0 = alloca float, align 4
  store float 1.000000e+01, ptr %0, align 4
  %i = load float, ptr %0, align 4
  %1 = fcmp oeq float %i, 1.000000e+01
  ret i1 %1
}

define private i1 @lambda.186() {
entry:
  %0 = alloca double, align 8
  store double 1.000000e+01, ptr %0, align 8
  %i = load double, ptr %0, align 8
  %1 = fcmp oeq double %i, 1.000000e+01
  ret i1 %1
}

define private i1 @lambda.187() {
entry:
  %0 = alloca i16, align 2
  store i16 5, ptr %0, align 2
  %1 = alloca i32, align 4
  store i32 5, ptr %1, align 4
  %i = load i16, ptr %0, align 2
  %w = load i32, ptr %1, align 4
  %2 = sext i16 %i to i32
  %3 = icmp eq i32 %2, %w
  ret i1 %3
}

define private i1 @lambda.188() {
entry:
  %0 = call i64 @implicit_cast_ret_test()
  %1 = icmp eq i64 %0, 55
  ret i1 %1
}

define private i1 @lambda.189() {
entry:
  %0 = call i32 @implicit_cast_ret_test_2()
  %1 = icmp eq i32 %0, 55
  ret i1 %1
}

; Function Attrs: nounwind
define private void @string.constructor(ptr %0, ptr %1, i64 %2) #0 {
entry:
  %3 = getelementptr inbounds { { { ptr, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  store ptr %1, ptr %3, align 8
  %4 = getelementptr inbounds { { { ptr, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  store i64 %2, ptr %4, align 4
  %5 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  store i8 48, ptr %5, align 1
  ret void
}

; Function Attrs: nounwind
define private void @string.make_no_len(ptr %0, ptr %1) #0 {
entry:
  %2 = getelementptr inbounds { { { ptr, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  store ptr %1, ptr %2, align 8
  %3 = call i64 @strlen(ptr %1)
  %4 = getelementptr inbounds { { { ptr, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  store i64 %3, ptr %4, align 4
  %5 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  store i8 48, ptr %5, align 1
  ret void
}

; Function Attrs: nounwind
define private i64 @string.size(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc = load i8, ptr %1, align 1
  switch i8 %acc, label %default [
    i8 48, label %case
    i8 49, label %case2
    i8 50, label %case4
  ]

case:                                             ; preds = %entry
  %2 = getelementptr inbounds { { { ptr, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  %acc1 = load i64, ptr %2, align 4
  ret i64 %acc1

case2:                                            ; preds = %entry
  %3 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  %acc3 = load i8, ptr %3, align 1
  %4 = zext i8 %acc3 to i64
  ret i64 %4

case4:                                            ; preds = %entry
  %5 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  %acc5 = load i64, ptr %5, align 4
  ret i64 %acc5

default:                                          ; preds = %entry
  ret i64 0
}

; Function Attrs: nounwind
define private i1 @string.equals(ptr %0, ptr %1) #0 {
entry:
  %2 = call i64 @string.size(ptr %0)
  %3 = call i64 @string.size(ptr %1)
  %4 = icmp eq i64 %2, %3
  br i1 %4, label %5, label %10

5:                                                ; preds = %entry
  %6 = call ptr @string.data(ptr %0)
  %7 = call ptr @string.data(ptr %1)
  %8 = call i32 @memcmp(ptr %6, ptr %7, i64 %2)
  %9 = icmp eq i32 %8, 0
  br label %10

10:                                               ; preds = %5, %entry
  %11 = phi i1 [ false, %entry ], [ %9, %5 ]
  ret i1 %11
}

; Function Attrs: nounwind
define private void @string.move_const_to_buffer(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { { { ptr, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc = load ptr, ptr %1, align 8
  %2 = getelementptr inbounds { { { ptr, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  %acc1 = load i64, ptr %2, align 4
  %3 = icmp ne ptr %acc, null
  br i1 %3, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %4 = alloca i32, align 4
  store i32 0, ptr %4, align 4
  br label %forcond

ifend:                                            ; preds = %forend, %entry
  %5 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0, i64 %acc1
  store i8 0, ptr %5, align 1
  %6 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  store i64 %acc1, ptr %6, align 4
  %7 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  store i8 49, ptr %7, align 1
  ret void

forcond:                                          ; preds = %forthen, %ifthen
  %i = load i32, ptr %4, align 4
  %8 = sext i32 %i to i64
  %9 = icmp slt i64 %8, %acc1
  br i1 %9, label %forthen, label %forend

forthen:                                          ; preds = %forcond
  %i2 = load i32, ptr %4, align 4
  %10 = getelementptr inbounds i8, ptr %acc, i32 %i2
  %acc3 = load i8, ptr %10, align 1
  %i4 = load i32, ptr %4, align 4
  %11 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0, i32 %i4
  store i8 %acc3, ptr %11, align 1
  %i5 = load i32, ptr %4, align 4
  %12 = add i32 %i5, 1
  store i32 %12, ptr %4, align 4
  br label %forcond

forend:                                           ; preds = %forcond
  br label %ifend
}

; Function Attrs: nounwind
define private void @string.move_data_to_heap(ptr %0, ptr %1, i64 %2, i64 %3) #0 {
entry:
  %4 = call ptr @malloc(i64 %3)
  %5 = alloca ptr, align 8
  store ptr %4, ptr %5, align 8
  %6 = alloca i32, align 4
  store i32 0, ptr %6, align 4
  br label %loopcond

loopcond:                                         ; preds = %loopthen, %entry
  %i = load i32, ptr %6, align 4
  %7 = sext i32 %i to i64
  %8 = icmp slt i64 %7, %2
  br i1 %8, label %loopthen, label %loopexit

loopthen:                                         ; preds = %loopcond
  %i1 = load i32, ptr %6, align 4
  %9 = getelementptr inbounds i8, ptr %1, i32 %i1
  %acc = load i8, ptr %9, align 1
  %data = load ptr, ptr %5, align 8
  %i2 = load i32, ptr %6, align 4
  %10 = getelementptr inbounds i8, ptr %data, i32 %i2
  store i8 %acc, ptr %10, align 1
  %i3 = load i32, ptr %6, align 4
  %11 = add i32 %i3, 1
  store i32 %11, ptr %6, align 4
  br label %loopcond

loopexit:                                         ; preds = %loopcond
  %data4 = load ptr, ptr %5, align 8
  %i5 = load i32, ptr %6, align 4
  %12 = getelementptr inbounds i8, ptr %data4, i32 %i5
  store i8 0, ptr %12, align 1
  %data6 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  store ptr %data6, ptr %13, align 8
  %14 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  store i64 %2, ptr %14, align 4
  %15 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 2
  store i64 %3, ptr %15, align 4
  %16 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  store i8 50, ptr %16, align 1
  ret void
}

; Function Attrs: nounwind
define private void @string.resize(ptr %0, i64 %1) #0 {
entry:
  %2 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc = load ptr, ptr %2, align 8
  %3 = call ptr @realloc(ptr %acc, i64 %1)
  %4 = alloca ptr, align 8
  store ptr %3, ptr %4, align 8
  %data = load ptr, ptr %4, align 8
  %5 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  %acc1 = load i64, ptr %5, align 4
  %6 = getelementptr inbounds i8, ptr %data, i64 %acc1
  store i8 0, ptr %6, align 1
  %data2 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  store ptr %data2, ptr %7, align 8
  %8 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 2
  store i64 %1, ptr %8, align 4
  ret void
}

; Function Attrs: nounwind
define private void @string.ensure_mut(ptr %0, i64 %1) #0 {
entry:
  %2 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc = load i8, ptr %2, align 1
  %3 = icmp eq i8 %acc, 48
  br i1 %3, label %11, label %8

ifthen:                                           ; preds = %13
  %4 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc4 = load i8, ptr %4, align 1
  %5 = icmp eq i8 %acc4, 48
  br i1 %5, label %ifthen2, label %ifend3

ifelse:                                           ; preds = %13, %11
  %6 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc7 = load i8, ptr %6, align 1
  %7 = icmp eq i8 %acc7, 48
  br i1 %7, label %ifthen5, label %elseifcond0

ifend:                                            ; preds = %ifend6, %ifend3
  ret void

8:                                                ; preds = %entry
  %9 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc1 = load i8, ptr %9, align 1
  %10 = icmp eq i8 %acc1, 49
  br label %11

11:                                               ; preds = %8, %entry
  %12 = phi i1 [ true, %entry ], [ %10, %8 ]
  br i1 %12, label %13, label %ifelse

13:                                               ; preds = %11
  %14 = icmp ult i64 %1, 16
  br i1 %14, label %ifthen, label %ifelse

ifthen2:                                          ; preds = %ifthen
  call void @string.move_const_to_buffer(ptr %0)
  br label %ifend3

ifend3:                                           ; preds = %ifthen2, %ifthen
  br label %ifend

ifthen5:                                          ; preds = %ifelse
  %15 = getelementptr inbounds { { { ptr, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc8 = load ptr, ptr %15, align 8
  %16 = getelementptr inbounds { { { ptr, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  %acc9 = load i64, ptr %16, align 4
  call void @string.move_data_to_heap(ptr %0, ptr %acc8, i64 %acc9, i64 %1)
  br label %ifend6

elseifcond0:                                      ; preds = %ifelse
  %17 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc10 = load i8, ptr %17, align 1
  %18 = icmp eq i8 %acc10, 49
  br i1 %18, label %elseifbody0, label %elseifcond1

elseifbody0:                                      ; preds = %elseifcond0
  %19 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0, i32 0
  %20 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  %acc11 = load i8, ptr %20, align 1
  call void @string.move_data_to_heap(ptr %0, ptr %19, i8 %acc11, i64 %1)
  br label %ifend6

elseifcond1:                                      ; preds = %elseifcond0
  %21 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 2
  %acc12 = load i64, ptr %21, align 4
  %22 = icmp ule i64 %acc12, %1
  br i1 %22, label %elseifbody1, label %ifend6

elseifbody1:                                      ; preds = %elseifcond1
  call void @string.resize(ptr %0, i64 %1)
  br label %ifend6

ifend6:                                           ; preds = %elseifbody1, %elseifcond1, %elseifbody0, %ifthen5
  br label %ifend
}

; Function Attrs: nounwind
define private void @string.set(ptr %0, i64 %1, i8 %2) #0 {
entry:
  %3 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc = load i8, ptr %3, align 1
  switch i8 %acc, label %end [
    i8 48, label %case
    i8 49, label %case1
    i8 50, label %case2
  ]

end:                                              ; preds = %case2, %case1, %case, %entry
  ret void

case:                                             ; preds = %entry
  call void @string.move_const_to_buffer(ptr %0)
  %4 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0, i64 %1
  store i8 %2, ptr %4, align 1
  br label %end

case1:                                            ; preds = %entry
  %5 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0, i64 %1
  store i8 %2, ptr %5, align 1
  br label %end

case2:                                            ; preds = %entry
  %6 = getelementptr inbounds { { { i8, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc3 = load ptr, ptr %6, align 8
  %7 = getelementptr inbounds i8, ptr %acc3, i64 %1
  store i8 %2, ptr %7, align 1
  br label %end
}

; Function Attrs: nounwind
define private i8 @string.get(ptr %0, i64 %1) #0 {
entry:
  %2 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc = load i8, ptr %2, align 1
  switch i8 %acc, label %default [
    i8 48, label %case
    i8 49, label %case3
    i8 50, label %case5
  ]

case:                                             ; preds = %entry
  %3 = getelementptr inbounds { { { i8, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc1 = load ptr, ptr %3, align 8
  %4 = getelementptr inbounds i8, ptr %acc1, i64 %1
  %acc2 = load i8, ptr %4, align 1
  ret i8 %acc2

case3:                                            ; preds = %entry
  %5 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0, i64 %1
  %acc4 = load i8, ptr %5, align 1
  ret i8 %acc4

case5:                                            ; preds = %entry
  %6 = getelementptr inbounds { { { i8, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc6 = load ptr, ptr %6, align 8
  %7 = getelementptr inbounds i8, ptr %acc6, i64 %1
  %acc7 = load i8, ptr %7, align 1
  ret i8 %acc7

default:                                          ; preds = %entry
  ret i8 0
}

; Function Attrs: nounwind
define private void @string.append_with_len(ptr %0, ptr %1, i64 %2) #0 {
entry:
  %3 = call i64 @string.size(ptr %0)
  %4 = add i64 %3, %2
  %5 = add i64 %4, 1
  call void @string.ensure_mut(ptr %0, i64 %5)
  %6 = alloca i64, align 8
  store i64 0, ptr %6, align 4
  br label %loopcond

loopcond:                                         ; preds = %loopthen, %entry
  %i = load i64, ptr %6, align 4
  %7 = icmp ult i64 %i, %2
  br i1 %7, label %loopthen, label %loopexit

loopthen:                                         ; preds = %loopcond
  %i1 = load i64, ptr %6, align 4
  %8 = getelementptr inbounds i8, ptr %1, i64 %i1
  %acc = load i8, ptr %8, align 1
  call void @string.append(ptr %0, i8 %acc)
  %i2 = load i64, ptr %6, align 4
  %9 = add i64 %i2, 1
  store i64 %9, ptr %6, align 4
  br label %loopcond

loopexit:                                         ; preds = %loopcond
  ret void
}

; Function Attrs: nounwind
define private void @string.append_char_ptr(ptr %0, ptr %1) #0 {
entry:
  %2 = call i64 @strlen(ptr %1)
  call void @string.append_with_len(ptr %0, ptr %1, i64 %2)
  ret void
}

; Function Attrs: nounwind
define private void @string.append_str(ptr %0, ptr %1) #0 {
entry:
  %2 = call ptr @string.data(ptr %1)
  %3 = call i64 @string.size(ptr %1)
  call void @string.append_with_len(ptr %0, ptr %2, i64 %3)
  ret void
}

; Function Attrs: nounwind
define private void @string.copy(ptr %0, ptr %1) #0 {
entry:
  %2 = alloca %string, align 8
  %3 = call i64 @string.size(ptr %1)
  call void @string.substring(ptr %2, ptr %1, i64 0, i64 %3)
  %4 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %2
  call void @llvm.memcpy.p0.p0.i64(ptr %0, ptr %4, i64 32, i1 false)
  ret void
}

; Function Attrs: nounwind
define private void @string.substring(ptr %0, ptr %1, i64 %2, i64 %3) #0 {
entry:
  %s = alloca %string, align 8
  %4 = sub i64 %3, %2
  %5 = icmp ult i64 %4, 16
  br i1 %5, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %6 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %s, i32 0, i32 1
  store i8 49, ptr %6, align 1
  %7 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %s, i32 0, i32 0, i32 0, i32 1
  store i64 %4, ptr %7, align 4
  %8 = call ptr @string.data(ptr %1)
  %9 = alloca i32, align 4
  store i32 0, ptr %9, align 4
  br label %forcond

ifelse:                                           ; preds = %entry
  %10 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %s, i32 0, i32 1
  store i8 50, ptr %10, align 1
  %11 = mul i64 %4, 2
  %12 = call ptr @malloc(i64 %11)
  %13 = alloca ptr, align 8
  store ptr %12, ptr %13, align 8
  %14 = call ptr @string.data(ptr %1)
  %15 = alloca i32, align 4
  store i32 0, ptr %15, align 4
  br label %forcond4

ifend:                                            ; preds = %forend6, %forend
  call void @llvm.memcpy.p0.p0.i64(ptr %0, ptr %s, i64 32, i1 false)
  ret void

forcond:                                          ; preds = %forthen, %ifthen
  %i = load i32, ptr %9, align 4
  %16 = sext i32 %i to i64
  %17 = icmp slt i64 %16, %4
  br i1 %17, label %forthen, label %forend

forthen:                                          ; preds = %forcond
  %i1 = load i32, ptr %9, align 4
  %18 = sext i32 %i1 to i64
  %19 = add i64 %2, %18
  %20 = getelementptr inbounds i8, ptr %8, i64 %19
  %acc = load i8, ptr %20, align 1
  %i2 = load i32, ptr %9, align 4
  %21 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %s, i32 0, i32 0, i32 0, i32 0, i32 %i2
  store i8 %acc, ptr %21, align 1
  %i3 = load i32, ptr %9, align 4
  %22 = add i32 %i3, 1
  store i32 %22, ptr %9, align 4
  br label %forcond

forend:                                           ; preds = %forcond
  %23 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %s, i32 0, i32 0, i32 0, i32 0, i64 %4
  store i8 0, ptr %23, align 1
  br label %ifend

forcond4:                                         ; preds = %forthen5, %ifelse
  %i7 = load i32, ptr %15, align 4
  %24 = sext i32 %i7 to i64
  %25 = icmp slt i64 %24, %4
  br i1 %25, label %forthen5, label %forend6

forthen5:                                         ; preds = %forcond4
  %i8 = load i32, ptr %15, align 4
  %26 = sext i32 %i8 to i64
  %27 = add i64 %2, %26
  %28 = getelementptr inbounds i8, ptr %14, i64 %27
  %acc9 = load i8, ptr %28, align 1
  %new_heap = load ptr, ptr %13, align 8
  %i10 = load i32, ptr %15, align 4
  %29 = getelementptr inbounds i8, ptr %new_heap, i32 %i10
  store i8 %acc9, ptr %29, align 1
  %i11 = load i32, ptr %15, align 4
  %30 = add i32 %i11, 1
  store i32 %30, ptr %15, align 4
  br label %forcond4

forend6:                                          ; preds = %forcond4
  %new_heap12 = load ptr, ptr %13, align 8
  %31 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %s, i32 0, i32 0, i32 0, i32 0
  store ptr %new_heap12, ptr %31, align 8
  %32 = getelementptr inbounds { { { i8, i64, i64 } }, i8 }, ptr %s, i32 0, i32 0, i32 0, i32 0
  %acc13 = load ptr, ptr %32, align 8
  %33 = getelementptr inbounds i8, ptr %acc13, i64 %4
  store i8 0, ptr %33, align 1
  %34 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %s, i32 0, i32 0, i32 0, i32 1
  store i64 %4, ptr %34, align 4
  %35 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %s, i32 0, i32 0, i32 0, i32 2
  store i64 %11, ptr %35, align 4
  br label %ifend
}

; Function Attrs: nounwind
define private void @string.append(ptr %0, i8 %1) #0 {
entry:
  %2 = call i64 @string.size(ptr %0)
  %3 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc = load i8, ptr %3, align 1
  %4 = icmp eq i8 %acc, 48
  br i1 %4, label %12, label %9

ifthen:                                           ; preds = %14
  %5 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc4 = load i8, ptr %5, align 1
  %6 = icmp eq i8 %acc4, 48
  br i1 %6, label %ifthen2, label %ifend3

ifelse:                                           ; preds = %14, %12
  %7 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc7 = load i8, ptr %7, align 1
  %8 = icmp eq i8 %acc7, 48
  br i1 %8, label %ifthen5, label %elseifcond0

ifend:                                            ; preds = %ifend6, %ifend3
  ret void

9:                                                ; preds = %entry
  %10 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc1 = load i8, ptr %10, align 1
  %11 = icmp eq i8 %acc1, 49
  br label %12

12:                                               ; preds = %9, %entry
  %13 = phi i1 [ true, %entry ], [ %11, %9 ]
  br i1 %13, label %14, label %ifelse

14:                                               ; preds = %12
  %15 = icmp ult i64 %2, 15
  br i1 %15, label %ifthen, label %ifelse

ifthen2:                                          ; preds = %ifthen
  call void @string.move_const_to_buffer(ptr %0)
  br label %ifend3

ifend3:                                           ; preds = %ifthen2, %ifthen
  %16 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0, i64 %2
  store i8 %1, ptr %16, align 1
  %17 = add i64 %2, 1
  %18 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0, i64 %17
  store i8 0, ptr %18, align 1
  %19 = add i64 %2, 1
  %20 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  store i64 %19, ptr %20, align 4
  br label %ifend

ifthen5:                                          ; preds = %ifelse
  %21 = getelementptr inbounds { { { ptr, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc8 = load ptr, ptr %21, align 8
  %22 = mul i64 %2, 2
  call void @string.move_data_to_heap(ptr %0, ptr %acc8, i64 %2, i64 %22)
  br label %ifend6

elseifcond0:                                      ; preds = %ifelse
  %23 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc9 = load i8, ptr %23, align 1
  %24 = icmp eq i8 %acc9, 49
  br i1 %24, label %elseifbody0, label %elseifcond1

elseifbody0:                                      ; preds = %elseifcond0
  %25 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0, i32 0
  %26 = mul i64 %2, 2
  call void @string.move_data_to_heap(ptr %0, ptr %25, i64 %2, i64 %26)
  br label %ifend6

elseifcond1:                                      ; preds = %elseifcond0
  %27 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 2
  %acc10 = load i64, ptr %27, align 4
  %28 = add i64 %2, 2
  %29 = icmp ule i64 %acc10, %28
  br i1 %29, label %elseifbody1, label %ifend6

elseifbody1:                                      ; preds = %elseifcond1
  %30 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 2
  %acc11 = load i64, ptr %30, align 4
  %31 = mul i64 %acc11, 2
  call void @string.resize(ptr %0, i64 %31)
  br label %ifend6

ifend6:                                           ; preds = %elseifbody1, %elseifcond1, %elseifbody0, %ifthen5
  %32 = getelementptr inbounds { { { i8, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc12 = load ptr, ptr %32, align 8
  %33 = getelementptr inbounds i8, ptr %acc12, i64 %2
  store i8 %1, ptr %33, align 1
  %34 = getelementptr inbounds { { { i8, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc13 = load ptr, ptr %34, align 8
  %35 = add i64 %2, 1
  %36 = getelementptr inbounds i8, ptr %acc13, i64 %35
  store i8 0, ptr %36, align 1
  %37 = add i64 %2, 1
  %38 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  store i64 %37, ptr %38, align 4
  br label %ifend
}

; Function Attrs: nounwind
define private i64 @string.capacity(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc = load i8, ptr %1, align 1
  switch i8 %acc, label %default [
    i8 48, label %case
    i8 49, label %case2
    i8 50, label %case3
  ]

case:                                             ; preds = %entry
  %2 = getelementptr inbounds { { { ptr, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 1
  %acc1 = load i64, ptr %2, align 4
  ret i64 %acc1

case2:                                            ; preds = %entry
  ret i64 16

case3:                                            ; preds = %entry
  %3 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 2
  %acc4 = load i64, ptr %3, align 4
  ret i64 %acc4

default:                                          ; preds = %entry
  ret i64 0
}

; Function Attrs: nounwind
define private ptr @string.data(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc = load i8, ptr %1, align 1
  switch i8 %acc, label %default [
    i8 48, label %case
    i8 49, label %case2
    i8 50, label %case3
  ]

case:                                             ; preds = %entry
  %2 = getelementptr inbounds { { { ptr, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc1 = load ptr, ptr %2, align 8
  ret ptr %acc1

case2:                                            ; preds = %entry
  %3 = getelementptr inbounds { { { [16 x i8], i8 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0, i32 0
  ret ptr %3

case3:                                            ; preds = %entry
  %4 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc4 = load ptr, ptr %4, align 8
  ret ptr %acc4

default:                                          ; preds = %entry
  ret ptr null
}

; Function Attrs: nounwind
define private void @string.delete(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 1
  %acc = load i8, ptr %1, align 1
  %2 = icmp eq i8 %acc, 50
  br i1 %2, label %ifthen, label %ifend

3:                                                ; No predecessors!
  ret void

ifthen:                                           ; preds = %entry
  %4 = getelementptr inbounds { { { ptr, i64, i64 } }, i8 }, ptr %0, i32 0, i32 0, i32 0, i32 0
  %acc1 = load ptr, ptr %4, align 8
  call void @free(ptr %acc1)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  ret void
}

; Function Attrs: nounwind
define private void @test_strings() #0 {
entry:
  call void @test(ptr @182, ptr @lambda.190)
  call void @test(ptr @184, ptr @lambda.191)
  call void @test(ptr @186, ptr @lambda.192)
  call void @test(ptr @188, ptr @lambda.193)
  call void @test(ptr @190, ptr @lambda.194)
  call void @test(ptr @192, ptr @lambda.195)
  call void @test(ptr @195, ptr @lambda.196)
  call void @test(ptr @198, ptr @lambda.197)
  call void @test(ptr @201, ptr @lambda.198)
  call void @test(ptr @204, ptr @lambda.199)
  call void @test(ptr @207, ptr @lambda.200)
  call void @test(ptr @210, ptr @lambda.201)
  ret void
}

define private i1 @lambda.190() {
entry:
  %0 = alloca ptr, align 8
  store ptr @183, ptr %0, align 8
  %x = load ptr, ptr %0, align 8
  %1 = getelementptr inbounds i8, ptr %x, i32 0
  %acc = load i8, ptr %1, align 1
  %2 = icmp eq i8 %acc, 116
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %x1 = load ptr, ptr %0, align 8
  %4 = getelementptr inbounds i8, ptr %x1, i32 1
  %acc2 = load i8, ptr %4, align 1
  %5 = icmp eq i8 %acc2, 114
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  br i1 %7, label %8, label %11

8:                                                ; preds = %6
  %x3 = load ptr, ptr %0, align 8
  %9 = getelementptr inbounds i8, ptr %x3, i32 2
  %acc4 = load i8, ptr %9, align 1
  %10 = icmp eq i8 %acc4, 117
  br label %11

11:                                               ; preds = %8, %6
  %12 = phi i1 [ false, %6 ], [ %10, %8 ]
  br i1 %12, label %13, label %16

13:                                               ; preds = %11
  %x5 = load ptr, ptr %0, align 8
  %14 = getelementptr inbounds i8, ptr %x5, i32 3
  %acc6 = load i8, ptr %14, align 1
  %15 = icmp eq i8 %acc6, 101
  br label %16

16:                                               ; preds = %13, %11
  %17 = phi i1 [ false, %11 ], [ %15, %13 ]
  ret i1 %17
}

define private i1 @lambda.191() {
entry:
  %0 = alloca %Str, align 8
  %1 = getelementptr inbounds %Str, ptr %0, i32 0, i32 0
  store ptr @185, ptr %1, align 8
  %2 = getelementptr inbounds %Str, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %2, align 8
  %3 = getelementptr inbounds i8, ptr %acc, i32 0
  %acc1 = load i8, ptr %3, align 1
  %4 = icmp eq i8 %acc1, 102
  br i1 %4, label %5, label %9

5:                                                ; preds = %entry
  %6 = getelementptr inbounds %Str, ptr %0, i32 0, i32 0
  %acc2 = load ptr, ptr %6, align 8
  %7 = getelementptr inbounds i8, ptr %acc2, i32 1
  %acc3 = load i8, ptr %7, align 1
  %8 = icmp eq i8 %acc3, 97
  br label %9

9:                                                ; preds = %5, %entry
  %10 = phi i1 [ false, %entry ], [ %8, %5 ]
  br i1 %10, label %11, label %15

11:                                               ; preds = %9
  %12 = getelementptr inbounds %Str, ptr %0, i32 0, i32 0
  %acc4 = load ptr, ptr %12, align 8
  %13 = getelementptr inbounds i8, ptr %acc4, i32 2
  %acc5 = load i8, ptr %13, align 1
  %14 = icmp eq i8 %acc5, 108
  br label %15

15:                                               ; preds = %11, %9
  %16 = phi i1 [ false, %9 ], [ %14, %11 ]
  ret i1 %16
}

define private i1 @lambda.192() {
entry:
  %0 = alloca ptr, align 8
  store ptr @187, ptr %0, align 8
  %str = load ptr, ptr %0, align 8
  %1 = getelementptr inbounds i8, ptr %str, i32 0
  %acc = load i8, ptr %1, align 1
  %2 = icmp eq i8 %acc, 10
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %str1 = load ptr, ptr %0, align 8
  %4 = getelementptr inbounds i8, ptr %str1, i32 1
  %acc2 = load i8, ptr %4, align 1
  %5 = icmp eq i8 %acc2, 9
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  ret i1 %7
}

define private i1 @lambda.193() {
entry:
  %0 = alloca [6 x i8], align 1
  call void @llvm.memcpy.p0.p0.i64(ptr %0, ptr @189, i64 6, i1 false)
  %1 = getelementptr inbounds [18446744073709551615 x i8], ptr %0, i32 0, i32 0
  %acc = load i8, ptr %1, align 1
  %2 = icmp eq i8 %acc, 104
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = getelementptr inbounds [18446744073709551615 x i8], ptr %0, i32 0, i32 4
  %acc1 = load i8, ptr %4, align 1
  %5 = icmp eq i8 %acc1, 111
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  br i1 %7, label %8, label %11

8:                                                ; preds = %6
  %9 = getelementptr inbounds [18446744073709551615 x i8], ptr %0, i32 0, i32 5
  %acc2 = load i8, ptr %9, align 1
  %10 = icmp eq i8 %acc2, 0
  br label %11

11:                                               ; preds = %8, %6
  %12 = phi i1 [ false, %6 ], [ %10, %8 ]
  ret i1 %12
}

define private i1 @lambda.194() {
entry:
  %0 = alloca [10 x i8], align 1
  call void @llvm.memcpy.p0.p0.i64(ptr %0, ptr @191, i64 10, i1 false)
  %1 = getelementptr inbounds [10 x i8], ptr %0, i32 0, i32 0
  %acc = load i8, ptr %1, align 1
  %2 = icmp eq i8 %acc, 104
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = getelementptr inbounds [10 x i8], ptr %0, i32 0, i32 4
  %acc1 = load i8, ptr %4, align 1
  %5 = icmp eq i8 %acc1, 111
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  br i1 %7, label %8, label %11

8:                                                ; preds = %6
  %9 = getelementptr inbounds [10 x i8], ptr %0, i32 0, i32 5
  %acc2 = load i8, ptr %9, align 1
  %10 = icmp eq i8 %acc2, 0
  br label %11

11:                                               ; preds = %8, %6
  %12 = phi i1 [ false, %6 ], [ %10, %8 ]
  br i1 %12, label %13, label %16

13:                                               ; preds = %11
  %14 = getelementptr inbounds [10 x i8], ptr %0, i32 0, i32 6
  %acc3 = load i8, ptr %14, align 1
  %15 = icmp eq i8 %acc3, 0
  br label %16

16:                                               ; preds = %13, %11
  %17 = phi i1 [ false, %11 ], [ %15, %13 ]
  br i1 %17, label %18, label %21

18:                                               ; preds = %16
  %19 = getelementptr inbounds [10 x i8], ptr %0, i32 0, i32 9
  %acc4 = load i8, ptr %19, align 1
  %20 = icmp eq i8 %acc4, 0
  br label %21

21:                                               ; preds = %18, %16
  %22 = phi i1 [ false, %16 ], [ %20, %18 ]
  ret i1 %22
}

define private i1 @lambda.195() {
entry:
  %0 = alloca %string, align 8
  call void @string.constructor(ptr %0, ptr @193, i64 11)
  %1 = alloca %string, align 8
  call void @string.constructor(ptr %1, ptr @194, i64 11)
  %2 = call i1 @string.equals(ptr %0, ptr %1)
  call void @string.delete(ptr %1)
  call void @string.delete(ptr %0)
  ret i1 %2
}

define private i1 @lambda.196() {
entry:
  %0 = alloca %string, align 8
  call void @string.constructor(ptr %0, ptr @196, i64 11)
  %1 = alloca %string, align 8
  call void @string.constructor(ptr %1, ptr @197, i64 15)
  %2 = call i1 @string.equals(ptr %0, ptr %1)
  %3 = xor i1 %2, true
  call void @string.delete(ptr %1)
  call void @string.delete(ptr %0)
  ret i1 %3
}

define private i1 @lambda.197() {
entry:
  %0 = alloca %string, align 8
  call void @string.constructor(ptr %0, ptr @199, i64 11)
  %1 = alloca %string, align 8
  call void @string.constructor(ptr %1, ptr @200, i64 15)
  %2 = call i1 @string.equals(ptr %0, ptr %1)
  %3 = xor i1 %2, true
  call void @string.delete(ptr %1)
  call void @string.delete(ptr %0)
  ret i1 %3
}

define private i1 @lambda.198() {
entry:
  %0 = alloca %string, align 8
  call void @string.constructor(ptr %0, ptr @202, i64 11)
  %1 = alloca %string, align 8
  call void @string.constructor(ptr %1, ptr @203, i64 13)
  call void @string.append(ptr %0, i8 119)
  call void @string.append(ptr %0, i8 111)
  %2 = call i1 @string.equals(ptr %0, ptr %1)
  call void @string.delete(ptr %1)
  call void @string.delete(ptr %0)
  ret i1 %2
}

define private i1 @lambda.199() {
entry:
  %0 = alloca %string, align 8
  call void @string.constructor(ptr %0, ptr @205, i64 11)
  %1 = alloca %string, align 8
  call void @string.constructor(ptr %1, ptr @206, i64 13)
  %2 = call i64 @string.size(ptr %0)
  %3 = icmp eq i64 %2, 11
  br i1 %3, label %4, label %7

4:                                                ; preds = %entry
  %5 = call i64 @string.size(ptr %1)
  %6 = icmp eq i64 %5, 13
  br label %7

7:                                                ; preds = %4, %entry
  %8 = phi i1 [ false, %entry ], [ %6, %4 ]
  call void @string.delete(ptr %1)
  call void @string.delete(ptr %0)
  ret i1 %8
}

define private i1 @lambda.200() {
entry:
  %0 = alloca %string, align 8
  call void @string.constructor(ptr %0, ptr @208, i64 102)
  %1 = alloca %string, align 8
  call void @string.constructor(ptr %1, ptr @209, i64 102)
  %2 = call ptr @string.data(ptr %0)
  %3 = alloca ptr, align 8
  store ptr %2, ptr %3, align 8
  %4 = call ptr @string.data(ptr %1)
  %5 = alloca ptr, align 8
  store ptr %4, ptr %5, align 8
  %6 = alloca i32, align 4
  store i32 1, ptr %6, align 4
  br label %forcond

forcond:                                          ; preds = %ifend, %entry
  %i = load i32, ptr %6, align 4
  %7 = icmp sle i32 %i, 102
  br i1 %7, label %forthen, label %forend

forthen:                                          ; preds = %forcond
  %first_data = load ptr, ptr %3, align 8
  %i1 = load i32, ptr %6, align 4
  %8 = getelementptr inbounds i8, ptr %first_data, i32 %i1
  %acc = load i8, ptr %8, align 1
  %second_data = load ptr, ptr %5, align 8
  %i2 = load i32, ptr %6, align 4
  %9 = getelementptr inbounds i8, ptr %second_data, i32 %i2
  %acc3 = load i8, ptr %9, align 1
  %10 = icmp ne i8 %acc, %acc3
  br i1 %10, label %ifthen, label %ifend

forend:                                           ; preds = %forcond
  call void @string.delete(ptr %1)
  call void @string.delete(ptr %0)
  ret i1 true

ifthen:                                           ; preds = %forthen
  call void @string.delete(ptr %1)
  call void @string.delete(ptr %0)
  ret i1 false

ifend:                                            ; preds = %forthen
  %i4 = load i32, ptr %6, align 4
  %11 = add i32 %i4, 1
  store i32 %11, ptr %6, align 4
  br label %forcond
}

define private i1 @lambda.201() {
entry:
  %0 = alloca %string, align 8
  call void @string.constructor(ptr %0, ptr @211, i64 0)
  %1 = alloca i32, align 4
  store i32 1, ptr %1, align 4
  br label %forcond

forcond:                                          ; preds = %forthen, %entry
  %i = load i32, ptr %1, align 4
  %2 = icmp sle i32 %i, 102
  br i1 %2, label %forthen, label %forend

forthen:                                          ; preds = %forcond
  call void @string.append(ptr %0, i8 120)
  %i1 = load i32, ptr %1, align 4
  %3 = add i32 %i1, 1
  store i32 %3, ptr %1, align 4
  br label %forcond

forend:                                           ; preds = %forcond
  %4 = alloca %string, align 8
  call void @string.constructor(ptr %4, ptr @212, i64 102)
  %5 = call i1 @string.equals(ptr %0, ptr %4)
  call void @string.delete(ptr %4)
  call void @string.delete(ptr %0)
  ret i1 %5
}

; Function Attrs: nounwind
define private void @test_sizeof() #0 {
entry:
  call void @test(ptr @213, ptr @lambda.202)
  call void @test(ptr @214, ptr @lambda.203)
  call void @test(ptr @215, ptr @lambda.204)
  ret void
}

; Function Attrs: nounwind
define private void @test_macros() #0 {
entry:
  call void @test_sizeof()
  call void @test(ptr @216, ptr @lambda.205)
  ret void
}

define private i1 @lambda.202() {
entry:
  %0 = alloca i64, align 8
  store i64 4, ptr %0, align 4
  %i = load i64, ptr %0, align 4
  %1 = icmp eq i64 %i, 4
  ret i1 %1
}

define private i1 @lambda.203() {
entry:
  %0 = alloca i1, align 1
  store i1 true, ptr %0, align 1
  %1 = alloca i64, align 8
  store i64 8, ptr %1, align 4
  %is64 = load i1, ptr %0, align 1
  br i1 %is64, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %i = load i64, ptr %1, align 4
  %2 = icmp eq i64 %i, 8
  ret i1 %2

ifelse:                                           ; preds = %entry
  %i1 = load i64, ptr %1, align 4
  %3 = icmp eq i64 %i1, 4
  ret i1 %3
}

define private i1 @lambda.204() {
entry:
  %0 = alloca i64, align 8
  store i64 12, ptr %0, align 4
  %i = load i64, ptr %0, align 4
  %1 = icmp eq i64 %i, 12
  ret i1 %1
}

define private i1 @lambda.205() {
entry:
  %0 = alloca i32, align 4
  store i32 4, ptr %0, align 4
  %evaluated = load i32, ptr %0, align 4
  %1 = icmp eq i32 %evaluated, 4
  ret i1 %1
}

; Function Attrs: nounwind
define private i32 @arr_index(ptr %0, i32 %1) #0 {
entry:
  %2 = getelementptr inbounds i32, ptr %0, i32 %1
  %acc = load i32, ptr %2, align 4
  ret i32 %acc
}

; Function Attrs: nounwind
define private void @test_arrays() #0 {
entry:
  call void @test(ptr @217, ptr @lambda.206)
  call void @test(ptr @218, ptr @lambda.207)
  call void @test(ptr @219, ptr @lambda.208)
  ret void
}

define private i1 @lambda.206() {
entry:
  %arr = alloca [2 x i32], align 4
  %0 = getelementptr inbounds [2 x i32], ptr %arr, i32 0, i32 0
  store i32 2, ptr %0, align 4
  %1 = getelementptr inbounds [2 x i32], ptr %arr, i32 0, i32 1
  store i32 4, ptr %1, align 4
  %2 = getelementptr inbounds [2 x i32], ptr %arr, i32 0, i32 0
  %3 = call i32 @arr_index(ptr %2, i32 0)
  %4 = icmp eq i32 %3, 2
  br i1 %4, label %5, label %9

5:                                                ; preds = %entry
  %6 = getelementptr inbounds [2 x i32], ptr %arr, i32 0, i32 0
  %7 = call i32 @arr_index(ptr %6, i32 1)
  %8 = icmp eq i32 %7, 4
  br label %9

9:                                                ; preds = %5, %entry
  %10 = phi i1 [ false, %entry ], [ %8, %5 ]
  ret i1 %10
}

define private i1 @lambda.207() {
entry:
  %arr = alloca [1 x %DataStr1], align 8
  %0 = getelementptr inbounds [1 x %DataStr1], ptr %arr, i32 0, i32 0, i32 0
  store i32 5, ptr %0, align 4
  %1 = getelementptr inbounds [1 x %DataStr1], ptr %arr, i32 0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 5
  ret i1 %2
}

define private i1 @lambda.208() {
entry:
  %arr = alloca [1 x %DataStr1], align 8
  %0 = getelementptr inbounds [1 x %DataStr1], ptr %arr, i32 0, i32 0
  %1 = alloca ptr, align 8
  store ptr %0, ptr %1, align 8
  %2 = load ptr, ptr %1, align 8
  %3 = getelementptr inbounds { i32 }, ptr %2, i32 0, i32 0
  store i32 5, ptr %3, align 4
  %4 = load ptr, ptr %1, align 8
  %5 = getelementptr inbounds { i32 }, ptr %4, i32 0, i32 0
  %acc = load i32, ptr %5, align 4
  %6 = icmp eq i32 %acc, 5
  ret i1 %6
}

; Function Attrs: nounwind
define private void @test_pointer_math() #0 {
entry:
  call void @test(ptr @220, ptr @lambda.209)
  call void @test(ptr @221, ptr @lambda.210)
  call void @test(ptr @222, ptr @lambda.211)
  call void @test(ptr @223, ptr @lambda.212)
  call void @test(ptr @224, ptr @lambda.213)
  call void @test(ptr @225, ptr @lambda.214)
  call void @test(ptr @226, ptr @lambda.215)
  call void @test(ptr @227, ptr @lambda.216)
  ret void
}

define private i1 @lambda.209() {
entry:
  %0 = alloca i32, align 4
  store i32 2, ptr %0, align 4
  %1 = alloca ptr, align 8
  store ptr %0, ptr %1, align 8
  %j = load ptr, ptr %1, align 8
  %deref = load i32, ptr %j, align 4
  %2 = add i32 %deref, 1
  %j1 = load ptr, ptr %1, align 8
  store i32 %2, ptr %j1, align 4
  %i = load i32, ptr %0, align 4
  %3 = icmp eq i32 %i, 3
  ret i1 %3
}

define private i1 @lambda.210() {
entry:
  %arr = alloca [5 x i32], align 4
  %0 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  store i32 10, ptr %0, align 4
  %1 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 1
  store i32 20, ptr %1, align 4
  %2 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 2
  store i32 30, ptr %2, align 4
  %3 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 3
  store i32 40, ptr %3, align 4
  %4 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 4
  store i32 50, ptr %4, align 4
  %5 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  %6 = alloca ptr, align 8
  store ptr %5, ptr %6, align 8
  %ptr = load ptr, ptr %6, align 8
  %deref = load i32, ptr %ptr, align 4
  %7 = icmp eq i32 %deref, 10
  %8 = alloca i1, align 1
  store i1 %7, ptr %8, align 1
  %ptr1 = load ptr, ptr %6, align 8
  %9 = getelementptr inbounds i32, ptr %ptr1, i32 1
  store ptr %9, ptr %6, align 8
  %ptr2 = load ptr, ptr %6, align 8
  %deref3 = load i32, ptr %ptr2, align 4
  %10 = icmp eq i32 %deref3, 20
  %11 = alloca i1, align 1
  store i1 %10, ptr %11, align 1
  %ptr4 = load ptr, ptr %6, align 8
  %12 = getelementptr inbounds i32, ptr %ptr4, i32 1
  store ptr %12, ptr %6, align 8
  %ptr5 = load ptr, ptr %6, align 8
  %deref6 = load i32, ptr %ptr5, align 4
  %13 = icmp eq i32 %deref6, 30
  %14 = alloca i1, align 1
  store i1 %13, ptr %14, align 1
  %ptr7 = load ptr, ptr %6, align 8
  %15 = getelementptr inbounds i32, ptr %ptr7, i32 -1
  store ptr %15, ptr %6, align 8
  %ptr8 = load ptr, ptr %6, align 8
  %deref9 = load i32, ptr %ptr8, align 4
  %16 = icmp eq i32 %deref9, 20
  %17 = alloca i1, align 1
  store i1 %16, ptr %17, align 1
  %ptr10 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds i32, ptr %ptr10, i32 1
  store ptr %18, ptr %6, align 8
  %ptr11 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds i32, ptr %ptr11, i32 1
  store ptr %19, ptr %6, align 8
  %ptr12 = load ptr, ptr %6, align 8
  %deref13 = load i32, ptr %ptr12, align 4
  %20 = icmp eq i32 %deref13, 40
  %21 = alloca i1, align 1
  store i1 %20, ptr %21, align 1
  %ptr14 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds i32, ptr %ptr14, i32 1
  store ptr %22, ptr %6, align 8
  %ptr15 = load ptr, ptr %6, align 8
  %deref16 = load i32, ptr %ptr15, align 4
  %23 = icmp eq i32 %deref16, 50
  %24 = alloca i1, align 1
  store i1 %23, ptr %24, align 1
  %result1 = load i1, ptr %8, align 1
  br i1 %result1, label %25, label %26

25:                                               ; preds = %entry
  %result2 = load i1, ptr %11, align 1
  br label %26

26:                                               ; preds = %25, %entry
  %27 = phi i1 [ false, %entry ], [ %result2, %25 ]
  br i1 %27, label %28, label %29

28:                                               ; preds = %26
  %result3 = load i1, ptr %14, align 1
  br label %29

29:                                               ; preds = %28, %26
  %30 = phi i1 [ false, %26 ], [ %result3, %28 ]
  br i1 %30, label %31, label %32

31:                                               ; preds = %29
  %result4 = load i1, ptr %17, align 1
  br label %32

32:                                               ; preds = %31, %29
  %33 = phi i1 [ false, %29 ], [ %result4, %31 ]
  br i1 %33, label %34, label %35

34:                                               ; preds = %32
  %result5 = load i1, ptr %21, align 1
  br label %35

35:                                               ; preds = %34, %32
  %36 = phi i1 [ false, %32 ], [ %result5, %34 ]
  br i1 %36, label %37, label %38

37:                                               ; preds = %35
  %result6 = load i1, ptr %24, align 1
  br label %38

38:                                               ; preds = %37, %35
  %39 = phi i1 [ false, %35 ], [ %result6, %37 ]
  ret i1 %39
}

define private i1 @lambda.211() {
entry:
  %arr = alloca [5 x i32], align 4
  %0 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  store i32 10, ptr %0, align 4
  %1 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 1
  store i32 20, ptr %1, align 4
  %2 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 2
  store i32 30, ptr %2, align 4
  %3 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 3
  store i32 40, ptr %3, align 4
  %4 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 4
  store i32 50, ptr %4, align 4
  %5 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  %6 = getelementptr inbounds i32, ptr %5, i32 2
  %7 = alloca ptr, align 8
  store ptr %6, ptr %7, align 8
  %8 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  %9 = alloca ptr, align 8
  store ptr %8, ptr %9, align 8
  %ptr1 = load ptr, ptr %7, align 8
  %ptr2 = load ptr, ptr %9, align 8
  %10 = ptrtoint ptr %ptr1 to i64
  %11 = ptrtoint ptr %ptr2 to i64
  %12 = sub i64 %10, %11
  %13 = sdiv exact i64 %12, 4
  %14 = alloca i64, align 8
  store i64 %13, ptr %14, align 4
  %diff = load i64, ptr %14, align 4
  %15 = icmp eq i64 %diff, 2
  ret i1 %15
}

define private i1 @lambda.212() {
entry:
  %arr = alloca [5 x i32], align 4
  %0 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  store i32 10, ptr %0, align 4
  %1 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 1
  store i32 20, ptr %1, align 4
  %2 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 2
  store i32 30, ptr %2, align 4
  %3 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 3
  store i32 40, ptr %3, align 4
  %4 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 4
  store i32 50, ptr %4, align 4
  %5 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  %6 = getelementptr inbounds i32, ptr %5, i32 2
  %7 = alloca ptr, align 8
  store ptr %6, ptr %7, align 8
  %8 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  %9 = alloca ptr, align 8
  store ptr %8, ptr %9, align 8
  %ptr1 = load ptr, ptr %7, align 8
  %ptr2 = load ptr, ptr %9, align 8
  %10 = icmp ugt ptr %ptr1, %ptr2
  br i1 %10, label %11, label %13

11:                                               ; preds = %entry
  %ptr21 = load ptr, ptr %9, align 8
  %ptr12 = load ptr, ptr %7, align 8
  %12 = icmp ult ptr %ptr21, %ptr12
  br label %13

13:                                               ; preds = %11, %entry
  %14 = phi i1 [ false, %entry ], [ %12, %11 ]
  ret i1 %14
}

define private i1 @lambda.213() {
entry:
  %arr = alloca [5 x i32], align 4
  %0 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  store i32 10, ptr %0, align 4
  %1 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 1
  store i32 20, ptr %1, align 4
  %2 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 2
  store i32 30, ptr %2, align 4
  %3 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 3
  store i32 40, ptr %3, align 4
  %4 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 4
  store i32 50, ptr %4, align 4
  %5 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  %6 = getelementptr inbounds i32, ptr %5, i32 2
  %7 = alloca ptr, align 8
  store ptr %6, ptr %7, align 8
  %8 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  %9 = getelementptr inbounds i32, ptr %8, i32 2
  %10 = alloca ptr, align 8
  store ptr %9, ptr %10, align 8
  %ptr1 = load ptr, ptr %7, align 8
  %ptr2 = load ptr, ptr %10, align 8
  %11 = icmp eq ptr %ptr1, %ptr2
  ret i1 %11
}

define private i1 @lambda.214() {
entry:
  %arr = alloca [5 x i32], align 4
  %0 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  store i32 10, ptr %0, align 4
  %1 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 1
  store i32 20, ptr %1, align 4
  %2 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 2
  store i32 30, ptr %2, align 4
  %3 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 3
  store i32 40, ptr %3, align 4
  %4 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 4
  store i32 50, ptr %4, align 4
  %5 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  %6 = getelementptr inbounds i32, ptr %5, i32 4
  %7 = alloca ptr, align 8
  store ptr %6, ptr %7, align 8
  %8 = getelementptr inbounds [5 x i32], ptr %arr, i32 0, i32 0
  %9 = alloca ptr, align 8
  store ptr %8, ptr %9, align 8
  %ptr2 = load ptr, ptr %9, align 8
  %ptr1 = load ptr, ptr %7, align 8
  %10 = icmp ult ptr %ptr2, %ptr1
  ret i1 %10
}

define private i1 @lambda.215() {
entry:
  %d = alloca [2 x i32], align 4
  %0 = getelementptr inbounds [2 x i32], ptr %d, i32 0, i32 0
  store i32 55, ptr %0, align 4
  %1 = getelementptr inbounds [2 x i32], ptr %d, i32 0, i32 1
  store i32 60, ptr %1, align 4
  %2 = getelementptr inbounds [2 x i32], ptr %d, i32 0, i32 0
  %3 = alloca ptr, align 8
  store ptr %2, ptr %3, align 8
  %ptr = load ptr, ptr %3, align 8
  %4 = getelementptr inbounds i32, ptr %ptr, i32 1
  %acc = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc, 60
  ret i1 %5
}

define private i1 @lambda.216() {
entry:
  %0 = alloca %PMC22, align 8
  %1 = getelementptr inbounds %PMC22, ptr %0, i32 0, i32 0
  store i32 22, ptr %1, align 4
  %2 = getelementptr inbounds %PMC22, ptr %0, i32 0, i32 1
  store i32 33, ptr %2, align 4
  %3 = getelementptr inbounds %PMC22, ptr %0, i32 1
  %4 = getelementptr inbounds %PMC22, ptr %3, i32 -1
  %5 = getelementptr inbounds { i32, i32 }, ptr %4, i32 0, i32 0
  %acc = load i32, ptr %5, align 4
  %6 = icmp eq i32 %acc, 22
  br i1 %6, label %7, label %10

7:                                                ; preds = %entry
  %8 = getelementptr inbounds { i32, i32 }, ptr %4, i32 0, i32 1
  %acc1 = load i32, ptr %8, align 4
  %9 = icmp eq i32 %acc1, 33
  br label %10

10:                                               ; preds = %7, %entry
  %11 = phi i1 [ false, %entry ], [ %9, %7 ]
  ret i1 %11
}

; Function Attrs: nounwind
define private void @test_casts() #0 {
entry:
  call void @test(ptr @228, ptr @lambda.217)
  call void @test(ptr @229, ptr @lambda.218)
  call void @test(ptr @230, ptr @lambda.219)
  call void @test(ptr @231, ptr @lambda.220)
  call void @test(ptr @232, ptr @lambda.221)
  call void @test(ptr @233, ptr @lambda.222)
  call void @test(ptr @234, ptr @lambda.223)
  call void @test(ptr @235, ptr @lambda.224)
  call void @test(ptr @236, ptr @lambda.225)
  call void @test(ptr @237, ptr @lambda.226)
  call void @test(ptr @238, ptr @lambda.227)
  call void @test(ptr @239, ptr @lambda.228)
  call void @test(ptr @240, ptr @lambda.229)
  ret void
}

define private i1 @lambda.217() {
entry:
  %0 = alloca i32, align 4
  store i32 30, ptr %0, align 4
  %1 = alloca i64, align 8
  store i64 16, ptr %1, align 4
  %num1 = load i32, ptr %0, align 4
  %num2 = load i64, ptr %1, align 4
  %2 = trunc i64 %num2 to i32
  %3 = icmp sgt i32 %num1, %2
  ret i1 %3
}

define private i1 @lambda.218() {
entry:
  %0 = alloca i32, align 4
  store i32 30, ptr %0, align 4
  %1 = alloca i64, align 8
  store i64 16, ptr %1, align 4
  %num1 = load i32, ptr %0, align 4
  %2 = sext i32 %num1 to i64
  %num2 = load i64, ptr %1, align 4
  %3 = icmp sgt i64 %2, %num2
  ret i1 %3
}

define private i1 @lambda.219() {
entry:
  %0 = alloca i32, align 4
  store i32 30, ptr %0, align 4
  %1 = alloca i64, align 8
  store i64 16, ptr %1, align 4
  %num1 = load i32, ptr %0, align 4
  %num2 = load i64, ptr %1, align 4
  %2 = trunc i64 %num2 to i32
  %3 = icmp sgt i32 %num1, %2
  ret i1 %3
}

define private i1 @lambda.220() {
entry:
  %0 = alloca i32, align 4
  store i32 30, ptr %0, align 4
  %1 = alloca i64, align 8
  store i64 16, ptr %1, align 4
  %num1 = load i32, ptr %0, align 4
  %2 = sext i32 %num1 to i64
  %num2 = load i64, ptr %1, align 4
  %3 = icmp sgt i64 %2, %num2
  ret i1 %3
}

define private i1 @lambda.221() {
entry:
  %0 = alloca double, align 8
  store double 1.000000e+00, ptr %0, align 8
  %d = load double, ptr %0, align 8
  %1 = fptrunc double %d to float
  %2 = alloca float, align 4
  store float %1, ptr %2, align 4
  %fl = load float, ptr %2, align 4
  %3 = fptosi float %fl to i32
  %4 = icmp eq i32 %3, 1
  %5 = alloca i1, align 1
  store i1 %4, ptr %5, align 1
  %i = load i1, ptr %5, align 1
  ret i1 %i
}

define private i1 @lambda.222() {
entry:
  %0 = alloca double, align 8
  store double 1.000000e+00, ptr %0, align 8
  %num = load double, ptr %0, align 8
  %1 = fptosi double %num to i32
  %2 = alloca i32, align 4
  store i32 %1, ptr %2, align 4
  %num2 = load i32, ptr %2, align 4
  %3 = icmp eq i32 %num2, 1
  ret i1 %3
}

define private i1 @lambda.223() {
entry:
  %0 = alloca float, align 4
  store float 1.000000e+00, ptr %0, align 4
  %num = load float, ptr %0, align 4
  %1 = fptosi float %num to i32
  %2 = alloca i32, align 4
  store i32 %1, ptr %2, align 4
  %num2 = load i32, ptr %2, align 4
  %3 = icmp eq i32 %num2, 1
  ret i1 %3
}

define private i1 @lambda.224() {
entry:
  %0 = alloca i32, align 4
  store i32 1, ptr %0, align 4
  %num = load i32, ptr %0, align 4
  %1 = sitofp i32 %num to double
  %2 = alloca double, align 8
  store double %1, ptr %2, align 8
  %num2 = load double, ptr %2, align 8
  %3 = fcmp oeq double %num2, 1.000000e+00
  ret i1 %3
}

define private i1 @lambda.225() {
entry:
  %0 = alloca i32, align 4
  store i32 1, ptr %0, align 4
  %num = load i32, ptr %0, align 4
  %1 = sitofp i32 %num to float
  %2 = alloca float, align 4
  store float %1, ptr %2, align 4
  %num2 = load float, ptr %2, align 4
  %3 = fcmp oeq float %num2, 1.000000e+00
  ret i1 %3
}

define private i1 @lambda.226() {
entry:
  %0 = alloca float, align 4
  store float 1.000000e+00, ptr %0, align 4
  %fl = load float, ptr %0, align 4
  %1 = fpext float %fl to double
  %2 = alloca double, align 8
  store double %1, ptr %2, align 8
  %d = load double, ptr %2, align 8
  %3 = fptosi double %d to i32
  %4 = icmp eq i32 %3, 1
  ret i1 %4
}

define private i1 @lambda.227() {
entry:
  %0 = alloca double, align 8
  store double 1.000000e+00, ptr %0, align 8
  %d = load double, ptr %0, align 8
  %1 = fptrunc double %d to float
  %2 = alloca float, align 4
  store float %1, ptr %2, align 4
  %fl = load float, ptr %2, align 4
  %3 = fptosi float %fl to i32
  %4 = icmp eq i32 %3, 1
  ret i1 %4
}

define private i1 @lambda.228() {
entry:
  %0 = alloca float, align 4
  store float 1.000000e+00, ptr %0, align 4
  %fl = load float, ptr %0, align 4
  %1 = fpext float %fl to double
  %2 = fcmp oeq double %1, 1.000000e+00
  ret i1 %2
}

define private i1 @lambda.229() {
entry:
  %0 = alloca double, align 8
  store double 1.000000e+00, ptr %0, align 8
  %d = load double, ptr %0, align 8
  %1 = fptrunc double %d to float
  %2 = fcmp oeq float %1, 1.000000e+00
  ret i1 %2
}

; Function Attrs: nounwind
define private void @test_struct(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %TestStruct1, ptr %0, i32 0, i32 0
  store i32 100, ptr %1, align 4
  %2 = getelementptr inbounds %TestStruct1, ptr %0, i32 0, i32 1
  store i32 100, ptr %2, align 4
  ret void
}

; Function Attrs: nounwind
define private void @ext_func_test(ptr %0, ptr %1) #0 {
entry:
  %2 = getelementptr inbounds %TestStruct1, ptr %0, i32 0, i32 0
  store i32 300, ptr %2, align 4
  %3 = getelementptr inbounds %TestStruct1, ptr %0, i32 0, i32 1
  store i32 300, ptr %3, align 4
  ret void
}

; Function Attrs: nounwind
define private i1 @expr_test_func_call() #0 {
entry:
  store i1 true, ptr @is_expr_test_func_called, align 1
  ret i1 true
}

; Function Attrs: nounwind
define private i32 @can_take_literal_type(i32 %0) #0 {
entry:
  %1 = add i32 %0, 3
  ret i32 %1
}

; Function Attrs: nounwind
define private i32 @sno_func() #0 {
entry:
  ret i32 10
}

; Function Attrs: nounwind
define private i32 @sno_func.230(i32 %0) #0 {
entry:
  ret i32 %0
}

; Function Attrs: nounwind
define private i32 @sno_func.231(i32 %0, i32 %1) #0 {
entry:
  %2 = add i32 %0, %1
  ret i32 %2
}

; Function Attrs: nounwind
define private void @test_name_overriding() #0 {
entry:
  call void @test(ptr @241, ptr @lambda.232)
  call void @test(ptr @242, ptr @lambda.233)
  call void @test(ptr @243, ptr @lambda.234)
  ret void
}

; Function Attrs: nounwind
define private void @test_name_overriding_in_struct() #0 {
entry:
  call void @test(ptr @244, ptr @lambda.237)
  call void @test(ptr @245, ptr @lambda.238)
  call void @test(ptr @246, ptr @lambda.239)
  ret void
}

; Function Attrs: nounwind
define private void @test_functions() #0 {
entry:
  call void @test(ptr @247, ptr @lambda.240)
  call void @test(ptr @248, ptr @lambda.241)
  call void @test(ptr @249, ptr @lambda.242)
  call void @test(ptr @250, ptr @lambda.243)
  call void @test(ptr @251, ptr @lambda.244)
  call void @test(ptr @252, ptr @lambda.245)
  call void @test(ptr @253, ptr @lambda.246)
  call void @test(ptr @254, ptr @lambda.247)
  call void @test(ptr @255, ptr @lambda.248)
  call void @test(ptr @256, ptr @lambda.249)
  call void @test(ptr @257, ptr @lambda.250)
  call void @test(ptr @258, ptr @lambda.251)
  call void @test_name_overriding()
  call void @test_name_overriding_in_struct()
  ret void
}

; Function Attrs: nounwind
define private void @MemLamb.mem_func_test(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %TestStruct1, ptr %0, i32 0, i32 0
  store i32 200, ptr %1, align 4
  %2 = getelementptr inbounds %TestStruct1, ptr %0, i32 0, i32 1
  store i32 200, ptr %2, align 4
  ret void
}

define private i1 @lambda.232() {
entry:
  %0 = call i32 @sno_func()
  %1 = icmp eq i32 %0, 10
  ret i1 %1
}

define private i1 @lambda.233() {
entry:
  %0 = call i32 @sno_func.230(i32 20)
  %1 = icmp eq i32 %0, 20
  ret i1 %1
}

define private i1 @lambda.234() {
entry:
  %0 = call i32 @sno_func.231(i32 20, i32 20)
  %1 = icmp eq i32 %0, 40
  ret i1 %1
}

; Function Attrs: nounwind
define private i32 @SnoPair.plus(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %2, align 4
  %3 = add i32 %acc, %acc1
  ret i32 %3
}

; Function Attrs: nounwind
define private i32 @SnoPair.plus.235(ptr %0, i32 %1) #0 {
entry:
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %2, align 4
  %3 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %3, align 4
  %4 = add i32 %acc, %acc1
  %5 = add i32 %4, %1
  ret i32 %5
}

; Function Attrs: nounwind
define private i32 @SnoPair.plus.236(ptr %0, i32 %1, i32 %2) #0 {
entry:
  %3 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %3, align 4
  %4 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %4, align 4
  %5 = add i32 %acc, %acc1
  %6 = add i32 %5, %1
  %7 = add i32 %6, %2
  ret i32 %7
}

define private i1 @lambda.237() {
entry:
  %0 = alloca %SnoPair, align 8
  %1 = getelementptr inbounds %SnoPair, ptr %0, i32 0, i32 0
  store i32 10, ptr %1, align 4
  %2 = getelementptr inbounds %SnoPair, ptr %0, i32 0, i32 1
  store i32 10, ptr %2, align 4
  %3 = call i32 @SnoPair.plus(ptr %0)
  %4 = icmp eq i32 %3, 20
  ret i1 %4
}

define private i1 @lambda.238() {
entry:
  %0 = alloca %SnoPair, align 8
  %1 = getelementptr inbounds %SnoPair, ptr %0, i32 0, i32 0
  store i32 10, ptr %1, align 4
  %2 = getelementptr inbounds %SnoPair, ptr %0, i32 0, i32 1
  store i32 10, ptr %2, align 4
  %3 = call i32 @SnoPair.plus.235(ptr %0, i32 10)
  %4 = icmp eq i32 %3, 30
  ret i1 %4
}

define private i1 @lambda.239() {
entry:
  %0 = alloca %SnoPair, align 8
  %1 = getelementptr inbounds %SnoPair, ptr %0, i32 0, i32 0
  store i32 10, ptr %1, align 4
  %2 = getelementptr inbounds %SnoPair, ptr %0, i32 0, i32 1
  store i32 10, ptr %2, align 4
  %3 = call i32 @SnoPair.plus.236(ptr %0, i32 10, i32 10)
  %4 = icmp eq i32 %3, 40
  ret i1 %4
}

define private i1 @lambda.240() {
entry:
  %0 = alloca %TestStruct1, align 8
  call void @test_struct(ptr %0)
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 100
  ret i1 %2
}

define private i1 @lambda.241() {
entry:
  %0 = alloca ptr, align 8
  store ptr @test_struct, ptr %0, align 8
  %1 = alloca %TestStruct1, align 8
  %lamb = load ptr, ptr %0, align 8
  call void %lamb(ptr %1)
  %2 = getelementptr inbounds { i32, i32 }, ptr %1, i32 0, i32 0
  %acc = load i32, ptr %2, align 4
  %3 = icmp eq i32 %acc, 100
  ret i1 %3
}

define private i1 @lambda.242() {
entry:
  %0 = alloca %MemLamb, align 8
  %1 = getelementptr inbounds %MemLamb, ptr %0, i32 0, i32 0
  store ptr @test_struct, ptr %1, align 8
  %2 = alloca %TestStruct1, align 8
  %3 = getelementptr inbounds %MemLamb, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %3, align 8
  call void %acc(ptr %2)
  %4 = getelementptr inbounds { i32, i32 }, ptr %2, i32 0, i32 0
  %acc1 = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc1, 100
  ret i1 %5
}

define private i1 @lambda.243() {
entry:
  %0 = alloca %MemLamb, align 8
  %1 = alloca %TestStruct1, align 8
  call void @MemLamb.mem_func_test(ptr %1)
  %2 = getelementptr inbounds { i32, i32 }, ptr %1, i32 0, i32 0
  %acc = load i32, ptr %2, align 4
  %3 = icmp eq i32 %acc, 200
  ret i1 %3
}

define private i1 @lambda.244() {
entry:
  %0 = alloca %MemLamb, align 8
  %1 = alloca %TestStruct1, align 8
  call void @ext_func_test(ptr %1, ptr %0)
  %2 = getelementptr inbounds { i32, i32 }, ptr %1, i32 0, i32 0
  %acc = load i32, ptr %2, align 4
  %3 = icmp eq i32 %acc, 300
  ret i1 %3
}

define private i1 @lambda.245() {
entry:
  %0 = alloca %TestStruct2, align 8
  %1 = getelementptr inbounds %TestStruct2, ptr %0, i32 0, i32 0
  call void @test_struct(ptr %1)
  %2 = getelementptr inbounds %TestStruct2, ptr %0, i32 0, i32 0, i32 0
  %acc = load i32, ptr %2, align 4
  %3 = icmp eq i32 %acc, 100
  br i1 %3, label %4, label %7

4:                                                ; preds = %entry
  %5 = getelementptr inbounds %TestStruct2, ptr %0, i32 0, i32 0, i32 1
  %acc1 = load i32, ptr %5, align 4
  %6 = icmp eq i32 %acc1, 100
  br label %7

7:                                                ; preds = %4, %entry
  %8 = phi i1 [ false, %entry ], [ %6, %4 ]
  ret i1 %8
}

define private i1 @lambda.246() {
entry:
  %arr = alloca [1 x %TestStruct1], align 8
  %0 = getelementptr inbounds [1 x %TestStruct1], ptr %arr, i32 0, i32 0
  call void @test_struct(ptr %0)
  %1 = getelementptr inbounds [1 x %TestStruct1], ptr %arr, i32 0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 100
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = getelementptr inbounds [1 x %TestStruct1], ptr %arr, i32 0, i32 0, i32 1
  %acc1 = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc1, 100
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  ret i1 %7
}

define private i1 @lambda.247() {
entry:
  store i1 false, ptr @is_expr_test_func_called, align 1
  br i1 true, label %ifthen, label %1

ifthen:                                           ; preds = %1, %entry
  br label %ifend

ifend:                                            ; preds = %ifthen, %1
  %is_expr_test_func_called = load i1, ptr @is_expr_test_func_called, align 1
  %0 = icmp eq i1 %is_expr_test_func_called, false
  ret i1 %0

1:                                                ; preds = %entry
  %2 = call i1 @expr_test_func_call()
  br i1 %2, label %ifthen, label %ifend
}

define private i1 @lambda.248() {
entry:
  store i1 false, ptr @is_expr_test_func_called, align 1
  br i1 false, label %ifthen, label %1

ifthen:                                           ; preds = %1, %entry
  br label %ifend

ifend:                                            ; preds = %ifthen, %1
  %is_expr_test_func_called = load i1, ptr @is_expr_test_func_called, align 1
  %0 = icmp eq i1 %is_expr_test_func_called, true
  ret i1 %0

1:                                                ; preds = %entry
  %2 = call i1 @expr_test_func_call()
  br i1 %2, label %ifthen, label %ifend
}

define private i1 @lambda.249() {
entry:
  store i1 false, ptr @is_expr_test_func_called, align 1
  br i1 false, label %1, label %ifend

ifthen:                                           ; preds = %1
  br label %ifend

ifend:                                            ; preds = %ifthen, %1, %entry
  %is_expr_test_func_called = load i1, ptr @is_expr_test_func_called, align 1
  %0 = icmp eq i1 %is_expr_test_func_called, false
  ret i1 %0

1:                                                ; preds = %entry
  %2 = call i1 @expr_test_func_call()
  br i1 %2, label %ifthen, label %ifend
}

define private i1 @lambda.250() {
entry:
  store i1 false, ptr @is_expr_test_func_called, align 1
  br i1 true, label %1, label %ifend

ifthen:                                           ; preds = %1
  br label %ifend

ifend:                                            ; preds = %ifthen, %1, %entry
  %is_expr_test_func_called = load i1, ptr @is_expr_test_func_called, align 1
  %0 = icmp eq i1 %is_expr_test_func_called, true
  ret i1 %0

1:                                                ; preds = %entry
  %2 = call i1 @expr_test_func_call()
  br i1 %2, label %ifthen, label %ifend
}

define private i1 @lambda.251() {
entry:
  %0 = call i32 @can_take_literal_type(i32 2)
  %1 = icmp eq i32 %0, 5
  ret i1 %1
}

; Function Attrs: nounwind
define private void @take_gen_destruct_short(ptr %0) #0 {
entry:
  call void @GenDestruct.delete(ptr %0)
  ret void
}

; Function Attrs: nounwind
define private void @create_long_gen_dest(ptr %0, i64 %1, ptr %2, ptr %3) #0 {
entry:
  %4 = getelementptr inbounds %GenDestruct, ptr %0, i32 0, i32 0
  store i64 %1, ptr %4, align 4
  %5 = getelementptr inbounds %GenDestruct, ptr %0, i32 0, i32 1
  store ptr %2, ptr %5, align 8
  %6 = getelementptr inbounds %GenDestruct, ptr %0, i32 0, i32 2
  store ptr %3, ptr %6, align 8
  ret void
}

; Function Attrs: nounwind
define private void @create_destructible(ptr %0, ptr %1, i32 %2) #0 {
entry:
  %3 = getelementptr inbounds %Destructible, ptr %0, i32 0, i32 0
  store i32 %2, ptr %3, align 4
  %4 = getelementptr inbounds %Destructible, ptr %0, i32 0, i32 1
  store ptr %1, ptr %4, align 8
  %5 = getelementptr inbounds %Destructible, ptr %0, i32 0, i32 2
  store ptr @lambda.254, ptr %5, align 8
  ret void
}

; Function Attrs: nounwind
define private void @destruct_inc_count(ptr %0) #0 {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

; Function Attrs: nounwind
define private void @destructible_but_last_if(ptr %0, i32 %1) #0 {
entry:
  %2 = alloca %Destructible, align 8
  %3 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 0
  store i32 %1, ptr %3, align 4
  %4 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 1
  store ptr %0, ptr %4, align 8
  %5 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 2
  store ptr @lambda.255, ptr %5, align 8
  %6 = alloca i32, align 4
  store i32 55, ptr %6, align 4
  %i = load i32, ptr %6, align 4
  %7 = icmp eq i32 %i, 55
  br i1 %7, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %8 = alloca i32, align 4
  store i32 33, ptr %8, align 4
  br label %ifend

ifelse:                                           ; preds = %entry
  %9 = alloca i32, align 4
  store i32 12, ptr %9, align 4
  br label %ifend

ifend:                                            ; preds = %ifelse, %ifthen
  call void @Destructible.delete(ptr %2)
  ret void
}

; Function Attrs: nounwind
define private void @destructible_but_last_if_returns(ptr %0, i32 %1) #0 {
entry:
  %2 = alloca %Destructible, align 8
  %3 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 0
  store i32 %1, ptr %3, align 4
  %4 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 1
  store ptr %0, ptr %4, align 8
  %5 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 2
  store ptr @lambda.256, ptr %5, align 8
  %6 = alloca i32, align 4
  store i32 55, ptr %6, align 4
  %i = load i32, ptr %6, align 4
  %7 = icmp eq i32 %i, 55
  br i1 %7, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %8 = alloca i32, align 4
  store i32 99, ptr %8, align 4
  call void @Destructible.delete(ptr %2)
  ret void

ifelse:                                           ; preds = %entry
  %9 = alloca i32, align 4
  store i32 99, ptr %9, align 4
  call void @Destructible.delete(ptr %2)
  ret void
}

; Function Attrs: nounwind
define private void @test_destruction_at_early_return(ptr %0, i1 %1) #0 {
entry:
  %2 = alloca %Destructible, align 8
  %3 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 1
  store ptr %0, ptr %3, align 8
  %4 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 2
  store ptr @lambda.257, ptr %4, align 8
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  call void @Destructible.delete(ptr %2)
  ret void

ifend:                                            ; preds = %entry
  %5 = alloca %Destructible, align 8
  %6 = getelementptr inbounds %Destructible, ptr %5, i32 0, i32 1
  store ptr %0, ptr %6, align 8
  %7 = getelementptr inbounds %Destructible, ptr %5, i32 0, i32 2
  store ptr @lambda.258, ptr %7, align 8
  call void @Destructible.delete(ptr %5)
  call void @Destructible.delete(ptr %2)
  ret void
}

; Function Attrs: nounwind
define private void @test_conditional_destruction(ptr %0, i1 %1) #0 {
entry:
  %2 = alloca %Destructible, align 8
  %3 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 1
  store ptr %0, ptr %3, align 8
  %4 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 2
  store ptr @lambda.259, ptr %4, align 8
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %5 = alloca %Destructible, align 8
  %6 = getelementptr inbounds %Destructible, ptr %5, i32 0, i32 1
  store ptr %0, ptr %6, align 8
  %7 = getelementptr inbounds %Destructible, ptr %5, i32 0, i32 2
  store ptr @lambda.260, ptr %7, align 8
  call void @Destructible.delete(ptr %5)
  call void @Destructible.delete(ptr %2)
  ret void

ifend:                                            ; preds = %entry
  call void @Destructible.delete(ptr %2)
  ret void
}

; Function Attrs: nounwind
define private void @test_struct_param_destructor(ptr %0) #0 {
entry:
  call void @Destructible.delete(ptr %0)
  ret void
}

; Function Attrs: nounwind
define private void @test_return_struct_param(ptr %0, ptr %1) #0 {
entry:
  call void @llvm.memcpy.p0.p0.i64(ptr %0, ptr %1, i64 24, i1 false)
  ret void
}

; Function Attrs: nounwind
define private void @send_lambda_struct(i32 %0, ptr %1, ptr %2) #0 {
entry:
  %3 = alloca %Destructible, align 8
  %4 = getelementptr inbounds %Destructible, ptr %3, i32 0, i32 0
  store i32 %0, ptr %4, align 4
  %5 = getelementptr inbounds %Destructible, ptr %3, i32 0, i32 1
  store ptr %1, ptr %5, align 8
  %6 = getelementptr inbounds %Destructible, ptr %3, i32 0, i32 2
  store ptr @destruct_inc_count, ptr %6, align 8
  call void %2(ptr %3)
  ret void
}

; Function Attrs: nounwind
define private void @relative_path(ptr %0, ptr %1) #0 {
entry:
  %2 = alloca %my_string, align 8
  call void @my_string.constructor(ptr %2, ptr @259, i64 3)
  call void @llvm.memcpy.p0.p0.i64(ptr %0, ptr %2, i64 0, i1 false)
  call void @my_string.delete(ptr %1)
  ret void
}

; Function Attrs: nounwind
define private void @test_variant_param_destructor(ptr %0) #0 {
entry:
  call void @OptDestructible.delete(ptr %0)
  ret void
}

; Function Attrs: nounwind
define private void @test_return_variant_param(ptr %0, ptr %1) #0 {
entry:
  call void @llvm.memcpy.p0.p0.i64(ptr %0, ptr %1, i64 32, i1 false)
  ret void
}

; Function Attrs: nounwind
define private void @test_variant_destruction_at_early_return(ptr %0, i1 %1) #0 {
entry:
  %2 = alloca %OptDestructible, align 8
  %3 = getelementptr inbounds %OptDestructible, ptr %2, i32 0, i32 0
  store i32 0, ptr %3, align 4
  %4 = getelementptr inbounds %OptDestructible, ptr %2, i32 0, i32 1
  %5 = getelementptr inbounds %Destructible, ptr %4, i32 0, i32 1
  store ptr %0, ptr %5, align 8
  %6 = getelementptr inbounds %Destructible, ptr %4, i32 0, i32 2
  store ptr @lambda.261, ptr %6, align 8
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  call void @OptDestructible.delete(ptr %2)
  ret void

ifend:                                            ; preds = %entry
  %7 = alloca %OptDestructible, align 8
  %8 = getelementptr inbounds %OptDestructible, ptr %7, i32 0, i32 0
  store i32 0, ptr %8, align 4
  %9 = getelementptr inbounds %OptDestructible, ptr %7, i32 0, i32 1
  %10 = getelementptr inbounds %Destructible, ptr %9, i32 0, i32 1
  store ptr %0, ptr %10, align 8
  %11 = getelementptr inbounds %Destructible, ptr %9, i32 0, i32 2
  store ptr @lambda.262, ptr %11, align 8
  call void @OptDestructible.delete(ptr %7)
  call void @OptDestructible.delete(ptr %2)
  ret void
}

; Function Attrs: nounwind
define private void @test_variant_conditional_destruction(ptr %0, i1 %1) #0 {
entry:
  %2 = alloca %OptDestructible, align 8
  %3 = getelementptr inbounds %OptDestructible, ptr %2, i32 0, i32 0
  store i32 0, ptr %3, align 4
  %4 = getelementptr inbounds %OptDestructible, ptr %2, i32 0, i32 1
  %5 = getelementptr inbounds %Destructible, ptr %4, i32 0, i32 1
  store ptr %0, ptr %5, align 8
  %6 = getelementptr inbounds %Destructible, ptr %4, i32 0, i32 2
  store ptr @lambda.263, ptr %6, align 8
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %7 = alloca %OptDestructible, align 8
  %8 = getelementptr inbounds %OptDestructible, ptr %7, i32 0, i32 0
  store i32 0, ptr %8, align 4
  %9 = getelementptr inbounds %OptDestructible, ptr %7, i32 0, i32 1
  %10 = getelementptr inbounds %Destructible, ptr %9, i32 0, i32 1
  store ptr %0, ptr %10, align 8
  %11 = getelementptr inbounds %Destructible, ptr %9, i32 0, i32 2
  store ptr @lambda.264, ptr %11, align 8
  call void @OptDestructible.delete(ptr %7)
  call void @OptDestructible.delete(ptr %2)
  ret void

ifend:                                            ; preds = %entry
  call void @OptDestructible.delete(ptr %2)
  ret void
}

; Function Attrs: nounwind
define private void @test_destructors() #0 {
entry:
  call void @test(ptr @260, ptr @lambda.265)
  call void @test(ptr @261, ptr @lambda.267)
  call void @test(ptr @262, ptr @lambda.268)
  call void @test(ptr @263, ptr @lambda.270)
  call void @test(ptr @264, ptr @lambda.271)
  call void @test(ptr @265, ptr @lambda.272)
  call void @test(ptr @266, ptr @lambda.273)
  call void @test(ptr @267, ptr @lambda.274)
  call void @test(ptr @268, ptr @lambda.275)
  call void @test(ptr @269, ptr @lambda.277)
  call void @test(ptr @270, ptr @lambda.279)
  call void @test(ptr @271, ptr @lambda.281)
  call void @test(ptr @272, ptr @lambda.283)
  call void @test(ptr @273, ptr @lambda.284)
  call void @test(ptr @274, ptr @lambda.285)
  call void @test(ptr @275, ptr @lambda.286)
  call void @test(ptr @276, ptr @lambda.288)
  call void @test(ptr @277, ptr @lambda.289)
  call void @test(ptr @278, ptr @lambda.290)
  call void @test(ptr @279, ptr @lambda.291)
  call void @test(ptr @280, ptr @lambda.292)
  call void @test(ptr @281, ptr @lambda.293)
  call void @test(ptr @282, ptr @lambda.294)
  call void @test(ptr @283, ptr @lambda.295)
  call void @test(ptr @284, ptr @lambda.296)
  call void @test(ptr @285, ptr @lambda.297)
  call void @test(ptr @287, ptr @lambda.298)
  call void @test(ptr @289, ptr @lambda.299)
  call void @test(ptr @290, ptr @lambda.301)
  call void @test(ptr @291, ptr @lambda.302)
  call void @test(ptr @292, ptr @lambda.305)
  call void @test(ptr @293, ptr @lambda.307)
  call void @test(ptr @294, ptr @lambda.309)
  call void @test(ptr @295, ptr @lambda.310)
  call void @test(ptr @296, ptr @lambda.311)
  call void @test(ptr @297, ptr @lambda.312)
  call void @test(ptr @298, ptr @lambda.313)
  call void @test(ptr @299, ptr @lambda.314)
  ret void
}

; Function Attrs: nounwind
define private void @Destructible.delete(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, ptr, ptr }, ptr %0, i32 0, i32 1
  %acc = load ptr, ptr %1, align 8
  %2 = getelementptr inbounds { i32, ptr, ptr }, ptr %0, i32 0, i32 2
  %acc1 = load ptr, ptr %2, align 8
  call void %acc1(ptr %acc)
  ret void

3:                                                ; No predecessors!
  ret void
}

; Function Attrs: nounwind
define private void @GenDestruct.delete(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i16, ptr, ptr }, ptr %0, i32 0, i32 1
  %acc = load ptr, ptr %1, align 8
  %2 = getelementptr inbounds { i16, ptr, ptr }, ptr %0, i32 0, i32 2
  %acc1 = load ptr, ptr %2, align 8
  call void %acc1(ptr %acc)
  ret void

3:                                                ; No predecessors!
  ret void
}

; Function Attrs: nounwind
define private void @GenDestruct.delete.252(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i64, ptr, ptr }, ptr %0, i32 0, i32 1
  %acc = load ptr, ptr %1, align 8
  %2 = getelementptr inbounds { i64, ptr, ptr }, ptr %0, i32 0, i32 2
  %acc1 = load ptr, ptr %2, align 8
  call void %acc1(ptr %acc)
  ret void

3:                                                ; No predecessors!
  ret void
}

; Function Attrs: nounwind
define private void @GenDestruct.delete.253(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, ptr, ptr }, ptr %0, i32 0, i32 1
  %acc = load ptr, ptr %1, align 8
  %2 = getelementptr inbounds { i32, ptr, ptr }, ptr %0, i32 0, i32 2
  %acc1 = load ptr, ptr %2, align 8
  call void %acc1(ptr %acc)
  ret void

3:                                                ; No predecessors!
  ret void
}

; Function Attrs: nounwind
define private void @GenDestructOwner.delete(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %GenDestructOwner, ptr %0, i32 0, i32 0
  call void @GenDestruct.delete.253(ptr %1)
  ret void
}

; Function Attrs: nounwind
define private void @Holder1.delete(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %Holder1, ptr %0, i32 0, i32 0
  call void @Destructible.delete(ptr %1)
  ret void
}

define private void @lambda.254(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private void @lambda.255(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private void @lambda.256(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private void @lambda.257(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private void @lambda.258(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private void @lambda.259(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private void @lambda.260(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

; Function Attrs: nounwind
define private void @my_string.constructor(ptr %0, ptr %1, i64 %2) #0 {
entry:
  ret void
}

; Function Attrs: nounwind
define private void @my_string.delete(ptr %0) #0 {
entry:
  %my_string_destr_count = load i32, ptr @my_string_destr_count, align 4
  %1 = add i32 %my_string_destr_count, 1
  store i32 %1, ptr @my_string_destr_count, align 4
  ret void

2:                                                ; No predecessors!
  ret void
}

; Function Attrs: nounwind
define private void @OptDestructible.delete(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %OptDestructible, ptr %0, i32 0, i32 0
  %2 = load i32, ptr %1, align 4
  %3 = getelementptr inbounds %OptDestructible, ptr %0, i32 0, i32 1
  switch i32 %2, label %4 [
    i32 0, label %5
  ]

4:                                                ; preds = %5, %entry
  ret void

5:                                                ; preds = %entry
  %6 = getelementptr inbounds { %Destructible }, ptr %3, i32 0, i32 0
  call void @Destructible.delete(ptr %6)
  br label %4
}

define private void @lambda.261(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private void @lambda.262(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private void @lambda.263(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private void @lambda.264(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private i1 @lambda.265() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %1 = alloca i1, align 1
  store i1 false, ptr %1, align 1
  %count = load i32, ptr %0, align 4
  %2 = icmp eq i32 %count, 0
  br i1 %2, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %3 = alloca %Destructible, align 8
  %4 = getelementptr inbounds %Destructible, ptr %3, i32 0, i32 0
  store i32 892, ptr %4, align 4
  %5 = getelementptr inbounds %Destructible, ptr %3, i32 0, i32 1
  store ptr %0, ptr %5, align 8
  %6 = getelementptr inbounds %Destructible, ptr %3, i32 0, i32 2
  store ptr @lambda.266, ptr %6, align 8
  %7 = getelementptr inbounds %Destructible, ptr %3, i32 0, i32 0
  %acc = load i32, ptr %7, align 4
  %8 = icmp eq i32 %acc, 892
  store i1 %8, ptr %1, align 1
  call void @Destructible.delete(ptr %3)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %count1 = load i32, ptr %0, align 4
  %9 = icmp eq i32 %count1, 1
  br i1 %9, label %10, label %11

10:                                               ; preds = %ifend
  %data_usable = load i1, ptr %1, align 1
  br label %11

11:                                               ; preds = %10, %ifend
  %12 = phi i1 [ false, %ifend ], [ %data_usable, %10 ]
  ret i1 %12
}

define private void @lambda.266(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private i1 @lambda.267() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %1 = alloca i1, align 1
  store i1 false, ptr %1, align 1
  %count = load i32, ptr %0, align 4
  %2 = icmp eq i32 %count, 0
  br i1 %2, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %3 = alloca %Destructible, align 8
  call void @create_destructible(ptr %3, ptr %0, i32 334)
  %4 = getelementptr inbounds %Destructible, ptr %3, i32 0, i32 0
  %acc = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc, 334
  br i1 %5, label %7, label %9

ifend:                                            ; preds = %9, %entry
  %count2 = load i32, ptr %0, align 4
  %6 = icmp eq i32 %count2, 1
  br i1 %6, label %11, label %12

7:                                                ; preds = %ifthen
  %count1 = load i32, ptr %0, align 4
  %8 = icmp eq i32 %count1, 0
  br label %9

9:                                                ; preds = %7, %ifthen
  %10 = phi i1 [ false, %ifthen ], [ %8, %7 ]
  store i1 %10, ptr %1, align 1
  call void @Destructible.delete(ptr %3)
  br label %ifend

11:                                               ; preds = %ifend
  %data_usable = load i1, ptr %1, align 1
  br label %12

12:                                               ; preds = %11, %ifend
  %13 = phi i1 [ false, %ifend ], [ %data_usable, %11 ]
  ret i1 %13
}

define private i1 @lambda.268() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %1 = alloca i1, align 1
  store i1 false, ptr %1, align 1
  %count = load i32, ptr %0, align 4
  %2 = icmp eq i32 %count, 0
  br i1 %2, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %d = alloca %Destructible, align 8
  %3 = getelementptr inbounds { i32, ptr, ptr }, ptr %d, i32 0, i32 0
  store i32 426, ptr %3, align 4
  %4 = getelementptr inbounds { i32, ptr, ptr }, ptr %d, i32 0, i32 1
  store ptr %0, ptr %4, align 8
  %5 = getelementptr inbounds { i32, ptr, ptr }, ptr %d, i32 0, i32 2
  store ptr @lambda.269, ptr %5, align 8
  %6 = getelementptr inbounds { i32, ptr, ptr }, ptr %d, i32 0, i32 0
  %acc = load i32, ptr %6, align 4
  %7 = icmp eq i32 %acc, 426
  store i1 %7, ptr %1, align 1
  call void @Destructible.delete(ptr %d)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %count1 = load i32, ptr %0, align 4
  %8 = icmp eq i32 %count1, 1
  br i1 %8, label %9, label %10

9:                                                ; preds = %ifend
  %data_usable = load i1, ptr %1, align 1
  br label %10

10:                                               ; preds = %9, %ifend
  %11 = phi i1 [ false, %ifend ], [ %data_usable, %9 ]
  ret i1 %11
}

define private void @lambda.269(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private i1 @lambda.270() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  call void @test_destruction_at_early_return(ptr %0, i1 true)
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 1
  ret i1 %1
}

define private i1 @lambda.271() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  call void @test_destruction_at_early_return(ptr %0, i1 false)
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 2
  ret i1 %1
}

define private i1 @lambda.272() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  call void @test_conditional_destruction(ptr %0, i1 true)
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 2
  ret i1 %1
}

define private i1 @lambda.273() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  call void @test_conditional_destruction(ptr %0, i1 false)
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 1
  ret i1 %1
}

define private i1 @lambda.274() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %1 = alloca %Destructible, align 8
  call void @create_destructible(ptr %1, ptr %0, i32 858)
  %2 = getelementptr inbounds { i32, ptr, ptr }, ptr %1, i32 0, i32 0
  %acc = load i32, ptr %2, align 4
  call void @Destructible.delete(ptr %1)
  %3 = alloca i32, align 4
  store i32 %acc, ptr %3, align 4
  %count = load i32, ptr %0, align 4
  %4 = icmp eq i32 %count, 1
  br i1 %4, label %5, label %7

5:                                                ; preds = %entry
  %data = load i32, ptr %3, align 4
  %6 = icmp eq i32 %data, 858
  br label %7

7:                                                ; preds = %5, %entry
  %8 = phi i1 [ false, %entry ], [ %6, %5 ]
  ret i1 %8
}

define private i1 @lambda.275() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %1 = alloca ptr, align 8
  store ptr @lambda.276, ptr %1, align 8
  %2 = alloca %Destructible, align 8
  call void @create_destructible(ptr %2, ptr %0, i32 363)
  %3 = getelementptr inbounds { i32, ptr, ptr }, ptr %2, i32 0, i32 0
  %acc = load i32, ptr %3, align 4
  call void @Destructible.delete(ptr %2)
  %get_int = load ptr, ptr %1, align 8
  %4 = call i32 %get_int(i32 %acc)
  %5 = alloca i32, align 4
  store i32 %4, ptr %5, align 4
  %count = load i32, ptr %0, align 4
  %6 = icmp eq i32 %count, 1
  br i1 %6, label %7, label %9

7:                                                ; preds = %entry
  %data = load i32, ptr %5, align 4
  %8 = icmp eq i32 %data, 363
  br label %9

9:                                                ; preds = %7, %entry
  %10 = phi i1 [ false, %entry ], [ %8, %7 ]
  ret i1 %10
}

define private i32 @lambda.276(i32 %0) {
entry:
  ret i32 %0
}

define private i1 @lambda.277() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %d = alloca %Destructible, align 8
  %2 = getelementptr inbounds { i32, ptr, ptr }, ptr %d, i32 0, i32 1
  store ptr %0, ptr %2, align 8
  %3 = getelementptr inbounds { i32, ptr, ptr }, ptr %d, i32 0, i32 2
  store ptr @lambda.278, ptr %3, align 8
  %x = alloca ptr, align 8
  store ptr %d, ptr %x, align 8
  %4 = alloca ptr, align 8
  store ptr %d, ptr %4, align 8
  call void @Destructible.delete(ptr %d)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %count1 = load i32, ptr %0, align 4
  %5 = icmp eq i32 %count1, 1
  ret i1 %5
}

define private void @lambda.278(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private i1 @lambda.279() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %arr = alloca [10 x %Destructible], align 8
  %2 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  %ptr = alloca ptr, align 8
  br label %loopcond

ifend:                                            ; preds = %16, %entry
  %count3 = load i32, ptr %0, align 4
  %3 = icmp eq i32 %count3, 10
  ret i1 %3

loopcond:                                         ; preds = %loopthen, %ifthen
  %i = load i32, ptr %2, align 4
  %4 = icmp slt i32 %i, 10
  br i1 %4, label %loopthen, label %loopexit

loopthen:                                         ; preds = %loopcond
  %i1 = load i32, ptr %2, align 4
  %5 = getelementptr inbounds [10 x %Destructible], ptr %arr, i32 0, i32 %i1
  store ptr %5, ptr %ptr, align 8
  %6 = load ptr, ptr %ptr, align 8
  %7 = getelementptr inbounds { i32, ptr, ptr }, ptr %6, i32 0, i32 1
  store ptr %0, ptr %7, align 8
  %8 = load ptr, ptr %ptr, align 8
  %9 = getelementptr inbounds { i32, ptr, ptr }, ptr %8, i32 0, i32 2
  store ptr @lambda.280, ptr %9, align 8
  %i2 = load i32, ptr %2, align 4
  %10 = add i32 %i2, 1
  store i32 %10, ptr %2, align 4
  br label %loopcond

loopexit:                                         ; preds = %loopcond
  %11 = getelementptr inbounds %Destructible, ptr %arr, i32 10
  br label %12

12:                                               ; preds = %12, %loopexit
  %13 = phi ptr [ %11, %loopexit ], [ %14, %12 ]
  %14 = getelementptr inbounds %Destructible, ptr %13, i32 -1
  call void @Destructible.delete(ptr %14)
  %15 = icmp eq ptr %14, %arr
  br i1 %15, label %16, label %12

16:                                               ; preds = %12
  br label %ifend
}

define private void @lambda.280(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private i1 @lambda.281() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %arr = alloca [10 x %Destructible], align 8
  %2 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  %ptr = alloca ptr, align 8
  br label %loopcond

ifend:                                            ; preds = %16, %entry
  %count3 = load i32, ptr %0, align 4
  %3 = icmp eq i32 %count3, 10
  ret i1 %3

loopcond:                                         ; preds = %loopthen, %ifthen
  %i = load i32, ptr %2, align 4
  %4 = icmp slt i32 %i, 10
  br i1 %4, label %loopthen, label %loopexit

loopthen:                                         ; preds = %loopcond
  %i1 = load i32, ptr %2, align 4
  %5 = getelementptr inbounds [10 x %Destructible], ptr %arr, i32 0, i32 %i1
  store ptr %5, ptr %ptr, align 8
  %6 = load ptr, ptr %ptr, align 8
  %7 = getelementptr inbounds { i32, ptr, ptr }, ptr %6, i32 0, i32 1
  store ptr %0, ptr %7, align 8
  %8 = load ptr, ptr %ptr, align 8
  %9 = getelementptr inbounds { i32, ptr, ptr }, ptr %8, i32 0, i32 2
  store ptr @lambda.282, ptr %9, align 8
  %i2 = load i32, ptr %2, align 4
  %10 = add i32 %i2, 1
  store i32 %10, ptr %2, align 4
  br label %loopcond

loopexit:                                         ; preds = %loopcond
  %11 = getelementptr inbounds %Destructible, ptr %arr, i32 10
  br label %12

12:                                               ; preds = %12, %loopexit
  %13 = phi ptr [ %11, %loopexit ], [ %14, %12 ]
  %14 = getelementptr inbounds %Destructible, ptr %13, i32 -1
  call void @Destructible.delete(ptr %14)
  %15 = icmp eq ptr %14, %arr
  br i1 %15, label %16, label %12

16:                                               ; preds = %12
  br label %ifend
}

define private void @lambda.282(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private i1 @lambda.283() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %2 = alloca %Holder1, align 8
  %3 = getelementptr inbounds %Holder1, ptr %2, i32 0, i32 0
  call void @create_destructible(ptr %3, ptr %0, i32 332)
  call void @Holder1.delete(ptr %2)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %count1 = load i32, ptr %0, align 4
  %4 = icmp eq i32 %count1, 1
  ret i1 %4
}

define private i1 @lambda.284() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  call void @destructible_but_last_if(ptr %0, i32 454)
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 1
  ret i1 %1
}

define private i1 @lambda.285() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  call void @destructible_but_last_if_returns(ptr %0, i32 655)
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 1
  ret i1 %1
}

define private i1 @lambda.286() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %2 = alloca %Destructible, align 8
  %3 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 1
  store ptr %0, ptr %3, align 8
  %4 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 2
  store ptr @lambda.287, ptr %4, align 8
  call void @test_struct_param_destructor(ptr %2)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %count1 = load i32, ptr %0, align 4
  %5 = icmp eq i32 %count1, 1
  ret i1 %5
}

define private void @lambda.287(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private i1 @lambda.288() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %2 = alloca %Destructible, align 8
  call void @create_destructible(ptr %2, ptr %0, i32 223)
  %3 = getelementptr inbounds { i32, i32, ptr }, ptr %2
  call void @test_struct_param_destructor(ptr %3)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %count1 = load i32, ptr %0, align 4
  %4 = icmp eq i32 %count1, 1
  ret i1 %4
}

define private i1 @lambda.289() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %2 = alloca %Destructible, align 8
  call void @create_destructible(ptr %2, ptr %0, i32 676)
  call void @Destructible.delete(ptr %2)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %count1 = load i32, ptr %0, align 4
  %3 = icmp eq i32 %count1, 1
  ret i1 %3
}

define private i1 @lambda.290() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %2 = alloca %GenDestruct.0, align 8
  %3 = getelementptr inbounds %GenDestruct.0, ptr %2, i32 0, i32 0
  store i32 454, ptr %3, align 4
  %4 = getelementptr inbounds %GenDestruct.0, ptr %2, i32 0, i32 1
  store ptr %0, ptr %4, align 8
  %5 = getelementptr inbounds %GenDestruct.0, ptr %2, i32 0, i32 2
  store ptr @destruct_inc_count, ptr %5, align 8
  call void @GenDestruct.delete.253(ptr %2)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %count1 = load i32, ptr %0, align 4
  %6 = icmp eq i32 %count1, 1
  ret i1 %6
}

define private i1 @lambda.291() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %2 = alloca %GenDestruct, align 8
  call void @create_long_gen_dest(ptr %2, i64 343, ptr %0, ptr @destruct_inc_count)
  call void @GenDestruct.delete.252(ptr %2)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %count1 = load i32, ptr %0, align 4
  %3 = icmp eq i32 %count1, 1
  ret i1 %3
}

define private i1 @lambda.292() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %2 = alloca %GenDestructOwner, align 8
  %3 = getelementptr inbounds %GenDestruct.0, ptr %2, i32 0, i32 0
  store i32 454, ptr %3, align 4
  %4 = getelementptr inbounds %GenDestruct.0, ptr %2, i32 0, i32 1
  store ptr %0, ptr %4, align 8
  %5 = getelementptr inbounds %GenDestruct.0, ptr %2, i32 0, i32 2
  store ptr @destruct_inc_count, ptr %5, align 8
  call void @GenDestructOwner.delete(ptr %2)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %count1 = load i32, ptr %0, align 4
  %6 = icmp eq i32 %count1, 1
  ret i1 %6
}

define private i1 @lambda.293() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %d = alloca [1 x %GenDestruct.0], align 8
  %2 = getelementptr inbounds [1 x %GenDestruct.0], ptr %d, i32 0, i32 0, i32 0
  store i32 454, ptr %2, align 4
  %3 = getelementptr inbounds [1 x %GenDestruct.0], ptr %d, i32 0, i32 0, i32 1
  store ptr %0, ptr %3, align 8
  %4 = getelementptr inbounds [1 x %GenDestruct.0], ptr %d, i32 0, i32 0, i32 2
  store ptr @destruct_inc_count, ptr %4, align 8
  %5 = getelementptr inbounds %GenDestruct.0, ptr %d, i32 1
  br label %7

ifend:                                            ; preds = %11, %entry
  %count1 = load i32, ptr %0, align 4
  %6 = icmp eq i32 %count1, 1
  ret i1 %6

7:                                                ; preds = %7, %ifthen
  %8 = phi ptr [ %5, %ifthen ], [ %9, %7 ]
  %9 = getelementptr inbounds %GenDestruct.0, ptr %8, i32 -1
  call void @GenDestruct.delete(ptr %9)
  %10 = icmp eq ptr %9, %d
  br i1 %10, label %11, label %7

11:                                               ; preds = %7
  br label %ifend
}

define private i1 @lambda.294() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %2 = alloca %GenDestruct.1, align 8
  %3 = getelementptr inbounds %GenDestruct.1, ptr %2, i32 0, i32 0
  store i16 889, ptr %3, align 2
  %4 = getelementptr inbounds %GenDestruct.1, ptr %2, i32 0, i32 1
  store ptr %0, ptr %4, align 8
  %5 = getelementptr inbounds %GenDestruct.1, ptr %2, i32 0, i32 2
  store ptr @destruct_inc_count, ptr %5, align 8
  call void @take_gen_destruct_short(ptr %2)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %count1 = load i32, ptr %0, align 4
  %6 = icmp eq i32 %count1, 1
  ret i1 %6
}

define private i1 @lambda.295() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %2 = alloca %GenDestruct, align 8
  call void @create_long_gen_dest(ptr %2, i64 343, ptr %0, ptr @destruct_inc_count)
  %3 = getelementptr inbounds %GenDestruct, ptr %2
  call void @take_gen_destruct_short(ptr %3)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %count1 = load i32, ptr %0, align 4
  %4 = icmp eq i32 %count1, 1
  ret i1 %4
}

define private i1 @lambda.296() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %1 = alloca %GenDestruct, align 8
  call void @create_long_gen_dest(ptr %1, i64 343, ptr %0, ptr @destruct_inc_count)
  %2 = getelementptr inbounds %GenDestruct, ptr %1, i32 0, i32 0
  %acc = load i64, ptr %2, align 4
  call void @GenDestruct.delete.252(ptr %1)
  %count = load i32, ptr %0, align 4
  %3 = icmp eq i32 %count, 1
  ret i1 %3
}

define private i1 @lambda.297() {
entry:
  store i32 0, ptr @my_string_destr_count, align 4
  br i1 true, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %0 = alloca %my_string, align 8
  call void @my_string.constructor(ptr %0, ptr @286, i64 10)
  call void @my_string.delete(ptr %0)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %my_string_destr_count = load i32, ptr @my_string_destr_count, align 4
  %1 = icmp eq i32 %my_string_destr_count, 1
  ret i1 %1
}

define private i1 @lambda.298() {
entry:
  store i32 0, ptr @my_string_destr_count, align 4
  br i1 true, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %0 = alloca %my_string, align 8
  %1 = alloca %my_string, align 8
  call void @my_string.constructor(ptr %1, ptr @288, i64 10)
  %2 = getelementptr inbounds {}, ptr %1
  call void @relative_path(ptr %0, ptr %2)
  call void @my_string.delete(ptr %0)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %my_string_destr_count = load i32, ptr @my_string_destr_count, align 4
  %3 = icmp eq i32 %my_string_destr_count, 2
  ret i1 %3
}

define private i1 @lambda.299() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  call void @send_lambda_struct(i32 347, ptr %0, ptr @lambda.300)
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 1
  ret i1 %1
}

define private void @lambda.300(ptr %0) {
entry:
  call void @Destructible.delete(ptr %0)
  ret void
}

define private i1 @lambda.301() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %1 = alloca %Destructible, align 8
  %2 = alloca %Destructible, align 8
  %3 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 0
  store i32 777, ptr %3, align 4
  %4 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 1
  store ptr %0, ptr %4, align 8
  %5 = getelementptr inbounds %Destructible, ptr %2, i32 0, i32 2
  store ptr @destruct_inc_count, ptr %5, align 8
  call void @test_return_struct_param(ptr %1, ptr %2)
  %6 = getelementptr inbounds %Destructible, ptr %1, i32 0, i32 0
  %acc = load i32, ptr %6, align 4
  %7 = icmp eq i32 %acc, 777
  br i1 %7, label %8, label %10

8:                                                ; preds = %entry
  %count = load i32, ptr %0, align 4
  %9 = icmp eq i32 %count, 0
  br label %10

10:                                               ; preds = %8, %entry
  %11 = phi i1 [ false, %entry ], [ %9, %8 ]
  call void @Destructible.delete(ptr %1)
  ret i1 %11
}

define private i1 @lambda.302() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %1 = alloca %Destructible, align 8
  %2 = getelementptr inbounds %Destructible, ptr %1, i32 0, i32 0
  store i32 677, ptr %2, align 4
  %3 = getelementptr inbounds %Destructible, ptr %1, i32 0, i32 1
  store ptr %0, ptr %3, align 8
  %4 = getelementptr inbounds %Destructible, ptr %1, i32 0, i32 2
  store ptr @destruct_inc_count, ptr %4, align 8
  %5 = alloca ptr, align 8
  store ptr @lambda.303, ptr %5, align 8
  %6 = alloca ptr, align 8
  store ptr @lambda.304, ptr %6, align 8
  %lamb = load ptr, ptr %5, align 8
  call void %lamb()
  %lamb2 = load ptr, ptr %6, align 8
  call void %lamb2()
  %count = load i32, ptr %0, align 4
  %7 = icmp eq i32 %count, 0
  br i1 %7, label %8, label %11

8:                                                ; preds = %entry
  %9 = getelementptr inbounds %Destructible, ptr %1, i32 0, i32 0
  %acc = load i32, ptr %9, align 4
  %10 = icmp eq i32 %acc, 677
  br label %11

11:                                               ; preds = %8, %entry
  %12 = phi i1 [ false, %entry ], [ %10, %8 ]
  call void @Destructible.delete(ptr %1)
  ret i1 %12
}

define private void @lambda.303() {
entry:
  ret void
}

define private void @lambda.304() {
entry:
  ret void
}

define private i1 @lambda.305() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %1 = alloca i1, align 1
  store i1 false, ptr %1, align 1
  %count = load i32, ptr %0, align 4
  %2 = icmp eq i32 %count, 0
  br i1 %2, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %3 = alloca %OptDestructible, align 8
  %4 = getelementptr inbounds %OptDestructible, ptr %3, i32 0, i32 0
  store i32 0, ptr %4, align 4
  %5 = getelementptr inbounds %OptDestructible, ptr %3, i32 0, i32 1
  %6 = getelementptr inbounds %Destructible, ptr %5, i32 0, i32 0
  store i32 892, ptr %6, align 4
  %7 = getelementptr inbounds %Destructible, ptr %5, i32 0, i32 1
  store ptr %0, ptr %7, align 8
  %8 = getelementptr inbounds %Destructible, ptr %5, i32 0, i32 2
  store ptr @lambda.306, ptr %8, align 8
  %9 = getelementptr inbounds %OptDestructible, ptr %3, i32 0, i32 0
  %10 = load i32, ptr %9, align 4
  switch i32 %10, label %end [
    i32 0, label %case
    i32 1, label %case1
  ]

ifend:                                            ; preds = %end, %entry
  %count2 = load i32, ptr %0, align 4
  %11 = icmp eq i32 %count2, 1
  br i1 %11, label %15, label %16

end:                                              ; preds = %case1, %case, %ifthen
  call void @OptDestructible.delete(ptr %3)
  br label %ifend

case:                                             ; preds = %ifthen
  %12 = getelementptr inbounds %OptDestructible, ptr %3, i32 0, i32 1, i32 0, i32 0
  %13 = getelementptr inbounds %Destructible, ptr %12, i32 0, i32 0
  %acc = load i32, ptr %13, align 4
  %14 = icmp eq i32 %acc, 892
  store i1 %14, ptr %1, align 1
  br label %end

case1:                                            ; preds = %ifthen
  br label %end

15:                                               ; preds = %ifend
  %data_usable = load i1, ptr %1, align 1
  br label %16

16:                                               ; preds = %15, %ifend
  %17 = phi i1 [ false, %ifend ], [ %data_usable, %15 ]
  ret i1 %17
}

define private void @lambda.306(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private i1 @lambda.307() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %2 = alloca %OptDestructible, align 8
  %3 = getelementptr inbounds %OptDestructible, ptr %2, i32 0, i32 0
  store i32 0, ptr %3, align 4
  %4 = getelementptr inbounds %OptDestructible, ptr %2, i32 0, i32 1
  %5 = getelementptr inbounds %Destructible, ptr %4, i32 0, i32 1
  store ptr %0, ptr %5, align 8
  %6 = getelementptr inbounds %Destructible, ptr %4, i32 0, i32 2
  store ptr @lambda.308, ptr %6, align 8
  call void @test_variant_param_destructor(ptr %2)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %count1 = load i32, ptr %0, align 4
  %7 = icmp eq i32 %count1, 1
  ret i1 %7
}

define private void @lambda.308(ptr %0) {
entry:
  %deref = load i32, ptr %0, align 4
  %1 = add i32 %deref, 1
  store i32 %1, ptr %0, align 4
  ret void
}

define private i1 @lambda.309() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 0
  br i1 %1, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %2 = alloca %OptDestructible, align 8
  %3 = getelementptr inbounds %OptDestructible, ptr %2, i32 0, i32 0
  store i32 0, ptr %3, align 4
  %4 = getelementptr inbounds %OptDestructible, ptr %2, i32 0, i32 1
  %5 = getelementptr inbounds { %Destructible }, ptr %4, i32 0, i32 0
  call void @create_destructible(ptr %5, ptr %0, i32 223)
  call void @test_variant_param_destructor(ptr %2)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %count1 = load i32, ptr %0, align 4
  %6 = icmp eq i32 %count1, 1
  ret i1 %6
}

define private i1 @lambda.310() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %1 = alloca %OptDestructible, align 8
  %2 = alloca %OptDestructible, align 8
  %3 = getelementptr inbounds %OptDestructible, ptr %2, i32 0, i32 0
  store i32 0, ptr %3, align 4
  %4 = getelementptr inbounds %OptDestructible, ptr %2, i32 0, i32 1
  %5 = getelementptr inbounds %Destructible, ptr %4, i32 0, i32 0
  store i32 777, ptr %5, align 4
  %6 = getelementptr inbounds %Destructible, ptr %4, i32 0, i32 1
  store ptr %0, ptr %6, align 8
  %7 = getelementptr inbounds %Destructible, ptr %4, i32 0, i32 2
  store ptr @destruct_inc_count, ptr %7, align 8
  call void @test_return_variant_param(ptr %1, ptr %2)
  %count = load i32, ptr %0, align 4
  %8 = icmp eq i32 %count, 0
  call void @OptDestructible.delete(ptr %1)
  ret i1 %8
}

define private i1 @lambda.311() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  call void @test_variant_destruction_at_early_return(ptr %0, i1 true)
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 1
  ret i1 %1
}

define private i1 @lambda.312() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  call void @test_variant_destruction_at_early_return(ptr %0, i1 false)
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 2
  ret i1 %1
}

define private i1 @lambda.313() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  call void @test_variant_conditional_destruction(ptr %0, i1 true)
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 2
  ret i1 %1
}

define private i1 @lambda.314() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  call void @test_variant_conditional_destruction(ptr %0, i1 false)
  %count = load i32, ptr %0, align 4
  %1 = icmp eq i32 %count, 1
  ret i1 %1
}

; Function Attrs: nounwind
define private void @test_unions() #0 {
entry:
  call void @test(ptr @300, ptr @lambda.315)
  call void @test(ptr @301, ptr @lambda.316)
  call void @test(ptr @302, ptr @lambda.317)
  call void @test(ptr @303, ptr @lambda.318)
  ret void
}

define private i1 @lambda.315() {
entry:
  %u = alloca %union.IntDoubleUnion, align 8
  %0 = getelementptr inbounds { i32 }, ptr %u
  store i32 5, ptr %0, align 4
  %1 = getelementptr inbounds { i32 }, ptr %u
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 5
  ret i1 %2
}

define private i1 @lambda.316() {
entry:
  %u = alloca %union.IntDoubleUnion, align 8
  %0 = getelementptr inbounds { double }, ptr %u
  store float 0x3FF3333340000000, ptr %0, align 4
  %1 = getelementptr inbounds { double }, ptr %u
  %acc = load double, ptr %1, align 8
  %2 = fcmp oeq double %acc, float 0x3FF3333340000000
  ret i1 %2
}

define private i1 @lambda.317() {
entry:
  %tu = alloca %union.TwoStructs, align 8
  %0 = alloca i32, align 4
  store i32 55, ptr %0, align 4
  %1 = getelementptr inbounds { { ptr, i64 } }, ptr %tu, i32 0, i32 0, i32 0
  store ptr %0, ptr %1, align 8
  %2 = getelementptr inbounds { { ptr, i64 } }, ptr %tu, i32 0, i32 0, i32 1
  store i64 345678, ptr %2, align 4
  %3 = getelementptr inbounds { { ptr, i64 } }, ptr %tu, i32 0, i32 0, i32 0
  %acc = load ptr, ptr %3, align 8
  %deref = load i32, ptr %acc, align 4
  %4 = icmp eq i32 %deref, 55
  br i1 %4, label %5, label %8

5:                                                ; preds = %entry
  %6 = getelementptr inbounds { { ptr, i64 } }, ptr %tu, i32 0, i32 0, i32 1
  %acc1 = load i64, ptr %6, align 4
  %7 = icmp eq i64 %acc1, 345678
  br label %8

8:                                                ; preds = %5, %entry
  %9 = phi i1 [ false, %entry ], [ %7, %5 ]
  ret i1 %9
}

define private i1 @lambda.318() {
entry:
  %tu = alloca %union.TwoStructs, align 8
  %0 = getelementptr inbounds { { i32, i32 } }, ptr %tu, i32 0, i32 0, i32 0
  store i32 123, ptr %0, align 4
  %1 = getelementptr inbounds { { i32, i32 } }, ptr %tu, i32 0, i32 0, i32 1
  store i32 456, ptr %1, align 4
  %2 = getelementptr inbounds { { i32, i32 } }, ptr %tu, i32 0, i32 0, i32 0
  %acc = load i32, ptr %2, align 4
  %3 = icmp eq i32 %acc, 123
  br i1 %3, label %4, label %7

4:                                                ; preds = %entry
  %5 = getelementptr inbounds { { i32, i32 } }, ptr %tu, i32 0, i32 0, i32 1
  %acc1 = load i32, ptr %5, align 4
  %6 = icmp eq i32 %acc1, 456
  br label %7

7:                                                ; preds = %4, %entry
  %8 = phi i1 [ false, %entry ], [ %6, %4 ]
  ret i1 %8
}

; Function Attrs: nounwind
define private i32 @pair2_sum_call(ptr %0) #0 {
entry:
  %1 = call i32 @pair2_sum(ptr %0)
  ret i32 %1
}

; Function Attrs: nounwind
define private i32 @pair2_sum(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %2, align 4
  %3 = add i32 %acc, %acc1
  ret i32 %3
}

; Function Attrs: nounwind
define private i32 @pair2_ext_sum(ptr %0) #0 {
entry:
  %1 = call i32 @pair2_sum(ptr %0)
  ret i32 %1
}

; Function Attrs: nounwind
define private i32 @pair2_indirect_mul(ptr %0) #0 {
entry:
  %1 = call i32 @pair2_mul(ptr %0)
  ret i32 %1
}

; Function Attrs: nounwind
define private i32 @pair2_mul(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %2, align 4
  %3 = mul i32 %acc, %acc1
  ret i32 %3
}

; Function Attrs: nounwind
define private i32 @bring_me_in() #0 {
entry:
  ret i32 11
}

; Function Attrs: nounwind
define private i32 @check_im_closed() #0 {
entry:
  ret i32 22
}

; Function Attrs: nounwind
define private void @test_namespaces() #0 {
entry:
  call void @test(ptr @304, ptr @lambda.319)
  call void @test(ptr @305, ptr @lambda.320)
  call void @test(ptr @306, ptr @lambda.321)
  call void @test(ptr @307, ptr @lambda.322)
  call void @test(ptr @308, ptr @lambda.323)
  call void @test(ptr @309, ptr @lambda.324)
  call void @test(ptr @310, ptr @lambda.325)
  call void @test(ptr @311, ptr @lambda.326)
  call void @test(ptr @312, ptr @lambda.327)
  ret void
}

define private i1 @lambda.319() {
entry:
  %0 = alloca %Pair2, align 8
  %1 = getelementptr inbounds %Pair2, ptr %0, i32 0, i32 0
  store i32 1, ptr %1, align 4
  %2 = getelementptr inbounds %Pair2, ptr %0, i32 0, i32 1
  store i32 2, ptr %2, align 4
  %3 = getelementptr inbounds %Pair2, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %3, align 4
  %4 = icmp eq i32 %acc, 1
  br i1 %4, label %5, label %8

5:                                                ; preds = %entry
  %6 = getelementptr inbounds %Pair2, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %6, align 4
  %7 = icmp eq i32 %acc1, 2
  br label %8

8:                                                ; preds = %5, %entry
  %9 = phi i1 [ false, %entry ], [ %7, %5 ]
  ret i1 %9
}

define private i1 @lambda.320() {
entry:
  %p = alloca %Pair2, align 8
  %0 = getelementptr inbounds { i32, i32 }, ptr %p, i32 0, i32 0
  store i32 1, ptr %0, align 4
  %1 = getelementptr inbounds { i32, i32 }, ptr %p, i32 0, i32 1
  store i32 2, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %p, i32 0, i32 0
  %acc = load i32, ptr %2, align 4
  %3 = icmp eq i32 %acc, 1
  br i1 %3, label %4, label %7

4:                                                ; preds = %entry
  %5 = getelementptr inbounds { i32, i32 }, ptr %p, i32 0, i32 1
  %acc1 = load i32, ptr %5, align 4
  %6 = icmp eq i32 %acc1, 2
  br label %7

7:                                                ; preds = %4, %entry
  %8 = phi i1 [ false, %entry ], [ %6, %4 ]
  ret i1 %8
}

define private i1 @lambda.321() {
entry:
  %0 = alloca %Pair2, align 8
  %1 = getelementptr inbounds %Pair2, ptr %0, i32 0, i32 0
  store i32 1, ptr %1, align 4
  %2 = getelementptr inbounds %Pair2, ptr %0, i32 0, i32 1
  store i32 2, ptr %2, align 4
  %3 = call i32 @pair2_sum(ptr %0)
  %4 = icmp eq i32 %3, 3
  ret i1 %4
}

define private i1 @lambda.322() {
entry:
  %0 = alloca %Pair2, align 8
  %1 = getelementptr inbounds %Pair2, ptr %0, i32 0, i32 0
  store i32 1, ptr %1, align 4
  %2 = getelementptr inbounds %Pair2, ptr %0, i32 0, i32 1
  store i32 2, ptr %2, align 4
  %3 = call i32 @pair2_mul(ptr %0)
  %4 = icmp eq i32 %3, 2
  ret i1 %4
}

define private i1 @lambda.323() {
entry:
  %0 = alloca %Pair2, align 8
  %1 = getelementptr inbounds %Pair2, ptr %0, i32 0, i32 0
  store i32 1, ptr %1, align 4
  %2 = getelementptr inbounds %Pair2, ptr %0, i32 0, i32 1
  store i32 2, ptr %2, align 4
  %3 = call i32 @pair2_indirect_mul(ptr %0)
  %4 = icmp eq i32 %3, 2
  ret i1 %4
}

define private i1 @lambda.324() {
entry:
  %0 = alloca %Pair2, align 8
  %1 = getelementptr inbounds %Pair2, ptr %0, i32 0, i32 0
  store i32 1, ptr %1, align 4
  %2 = getelementptr inbounds %Pair2, ptr %0, i32 0, i32 1
  store i32 2, ptr %2, align 4
  %3 = call i32 @pair2_ext_sum(ptr %0)
  %4 = icmp eq i32 %3, 3
  ret i1 %4
}

define private i1 @lambda.325() {
entry:
  %t = alloca i32, align 4
  store i32 5, ptr %t, align 4
  %t1 = load i32, ptr %t, align 4
  %0 = icmp eq i32 %t1, 5
  ret i1 %0
}

define private i1 @lambda.326() {
entry:
  %0 = call i32 @check_im_closed()
  %1 = icmp eq i32 %0, 22
  ret i1 %1
}

define private i1 @lambda.327() {
entry:
  %0 = call i32 @bring_me_in()
  %1 = icmp eq i32 %0, 11
  ret i1 %1
}

; Function Attrs: nounwind
define private i32 @runtime_sum(i32 %0, i32 %1) #0 {
entry:
  %2 = add i32 %0, %1
  ret i32 %2
}

; Function Attrs: nounwind
define private void @ret_struct_boi(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  store i32 343, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  store i32 979, ptr %2, align 4
  ret void
}

; Function Attrs: nounwind
define private void @ret_struct_comptime(ptr %0) #0 {
entry:
  %1 = alloca %Pair66, align 8
  call void @Pair66.first(ptr %1)
  %2 = getelementptr inbounds { i32, i32 }, ptr %1
  call void @llvm.memcpy.p0.p0.i64(ptr %0, ptr %2, i64 8, i1 false)
  ret void
}

; Function Attrs: nounwind
define private void @ret_struct_comptime_b(ptr %0) #0 {
entry:
  %1 = alloca %Pair66, align 8
  call void @Pair66.second(ptr %1)
  %2 = getelementptr inbounds { i32, i32 }, ptr %1
  call void @llvm.memcpy.p0.p0.i64(ptr %0, ptr %2, i64 8, i1 false)
  ret void
}

; Function Attrs: nounwind
define private void @ret_struct_implicit(ptr %0) #0 {
entry:
  %1 = alloca %Pair66, align 8
  call void @Pair66.first(ptr %1)
  %2 = getelementptr inbounds { i32, i32 }, ptr %1
  call void @llvm.memcpy.p0.p0.i64(ptr %0, ptr %2, i64 8, i1 false)
  ret void
}

; Function Attrs: nounwind
define private void @ret_struct_implicit_b(ptr %0) #0 {
entry:
  %1 = alloca %Pair66, align 8
  call void @Pair66.second(ptr %1)
  %2 = getelementptr inbounds { i32, i32 }, ptr %1
  call void @llvm.memcpy.p0.p0.i64(ptr %0, ptr %2, i64 8, i1 false)
  ret void
}

; Function Attrs: nounwind
define private void @test_comptime() #0 {
entry:
  call void @test(ptr @313, ptr @lambda.328)
  call void @test(ptr @314, ptr @lambda.329)
  call void @test(ptr @315, ptr @lambda.330)
  call void @test(ptr @316, ptr @lambda.331)
  call void @test(ptr @317, ptr @lambda.332)
  call void @test(ptr @318, ptr @lambda.333)
  call void @test(ptr @319, ptr @lambda.334)
  call void @test(ptr @320, ptr @lambda.335)
  call void @test(ptr @321, ptr @lambda.336)
  call void @test(ptr @322, ptr @lambda.337)
  call void @test(ptr @323, ptr @lambda.338)
  call void @test(ptr @324, ptr @lambda.339)
  call void @test(ptr @325, ptr @lambda.340)
  call void @test(ptr @326, ptr @lambda.341)
  call void @test(ptr @327, ptr @lambda.342)
  call void @test(ptr @328, ptr @lambda.343)
  call void @test(ptr @329, ptr @lambda.344)
  call void @test(ptr @330, ptr @lambda.345)
  ret void
}

; Function Attrs: nounwind
define private void @Pair66.first(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  store i32 15, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  store i32 15, ptr %2, align 4
  ret void
}

; Function Attrs: nounwind
define private void @Pair66.second(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  store i32 20, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  store i32 20, ptr %2, align 4
  ret void
}

; Function Attrs: nounwind
define private i32 @Pair66.sum(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %2, align 4
  %3 = add i32 %acc, %acc1
  ret i32 %3
}

; Function Attrs: nounwind
define private void @CompTimeCounter.actual(ptr %0, ptr %1, i32 %2) #0 {
entry:
  %deref = load i32, ptr %1, align 4
  %3 = add i32 %deref, %2
  store i32 %3, ptr %1, align 4
  ret void
}

define private i1 @lambda.328() {
entry:
  ret i1 true
}

define private i1 @lambda.329() {
entry:
  %0 = alloca %Pair66, align 8
  %1 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  store i32 33, ptr %1, align 4
  %2 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  store i32 11, ptr %2, align 4
  %3 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %3, align 4
  %4 = icmp eq i32 %acc, 33
  br i1 %4, label %5, label %8

5:                                                ; preds = %entry
  %6 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %6, align 4
  %7 = icmp eq i32 %acc1, 11
  br label %8

8:                                                ; preds = %5, %entry
  %9 = phi i1 [ false, %entry ], [ %7, %5 ]
  ret i1 %9
}

define private i1 @lambda.330() {
entry:
  %0 = alloca %Pair66, align 8
  %1 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  store i32 33, ptr %1, align 4
  %2 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  store i32 11, ptr %2, align 4
  %3 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %3, align 4
  %4 = icmp eq i32 %acc, 33
  br i1 %4, label %5, label %8

5:                                                ; preds = %entry
  %6 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %6, align 4
  %7 = icmp eq i32 %acc1, 11
  br label %8

8:                                                ; preds = %5, %entry
  %9 = phi i1 [ false, %entry ], [ %7, %5 ]
  ret i1 %9
}

define private i1 @lambda.331() {
entry:
  ret i1 true
}

define private i1 @lambda.332() {
entry:
  %0 = alloca %Pair66, align 8
  %1 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  store i32 10, ptr %1, align 4
  %2 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  store i32 10, ptr %2, align 4
  %3 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %3, align 4
  %4 = icmp eq i32 %acc, 10
  br i1 %4, label %5, label %8

5:                                                ; preds = %entry
  %6 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %6, align 4
  %7 = icmp eq i32 %acc1, 10
  br label %8

8:                                                ; preds = %5, %entry
  %9 = phi i1 [ false, %entry ], [ %7, %5 ]
  ret i1 %9
}

define private i1 @lambda.333() {
entry:
  %0 = alloca %Pair66, align 8
  %1 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  store i32 5, ptr %1, align 4
  %2 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  store i32 5, ptr %2, align 4
  %3 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %3, align 4
  %4 = icmp eq i32 %acc, 5
  br i1 %4, label %5, label %8

5:                                                ; preds = %entry
  %6 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %6, align 4
  %7 = icmp eq i32 %acc1, 5
  br label %8

8:                                                ; preds = %5, %entry
  %9 = phi i1 [ false, %entry ], [ %7, %5 ]
  ret i1 %9
}

define private i1 @lambda.334() {
entry:
  %0 = alloca %Pair66, align 8
  call void @Pair66.first(ptr %0)
  %1 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 15
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc1, 15
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  ret i1 %7
}

define private i1 @lambda.335() {
entry:
  %0 = alloca %Pair66, align 8
  call void @Pair66.second(ptr %0)
  %1 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 20
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc1, 20
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  ret i1 %7
}

define private i1 @lambda.336() {
entry:
  ret i1 true
}

define private i1 @lambda.337() {
entry:
  %0 = call i32 @runtime_sum(i32 40, i32 40)
  %1 = icmp eq i32 %0, 80
  ret i1 %1
}

define private i1 @lambda.338() {
entry:
  %0 = alloca %Pair66, align 8
  call void @ret_struct_boi(ptr %0)
  %1 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 343
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc1, 979
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  ret i1 %7
}

define private i1 @lambda.339() {
entry:
  ret i1 true
}

define private i1 @lambda.340() {
entry:
  ret i1 true
}

define private i1 @lambda.341() {
entry:
  %0 = alloca i32, align 4
  store i32 0, ptr %0, align 4
  %1 = alloca %CompTimeCounter, align 8
  call void @CompTimeCounter.actual(ptr %1, ptr %0, i32 1)
  %i = load i32, ptr %0, align 4
  %2 = icmp eq i32 %i, 1
  ret i1 %2
}

define private i1 @lambda.342() {
entry:
  %0 = alloca %Pair66, align 8
  call void @ret_struct_comptime(ptr %0)
  %1 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 15
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc1, 15
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  ret i1 %7
}

define private i1 @lambda.343() {
entry:
  %0 = alloca %Pair66, align 8
  call void @ret_struct_comptime_b(ptr %0)
  %1 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 20
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc1, 20
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  ret i1 %7
}

define private i1 @lambda.344() {
entry:
  %0 = alloca %Pair66, align 8
  call void @ret_struct_implicit(ptr %0)
  %1 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 15
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc1, 15
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  ret i1 %7
}

define private i1 @lambda.345() {
entry:
  %0 = alloca %Pair66, align 8
  call void @ret_struct_implicit_b(ptr %0)
  %1 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = icmp eq i32 %acc, 20
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = getelementptr inbounds %Pair66, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %4, align 4
  %5 = icmp eq i32 %acc1, 20
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  ret i1 %7
}

; Function Attrs: nounwind
define private void @test_compiler_vector() #0 {
entry:
  call void @test(ptr @331, ptr @lambda.346)
  call void @test(ptr @332, ptr @lambda.347)
  ret void
}

define private i1 @lambda.346() {
entry:
  ret i1 true
}

define private i1 @lambda.347() {
entry:
  ret i1 true
}

declare i32 @check_external_sum(i32 %0, i32 %1)

; Function Attrs: nounwind
define private void @test_external_functions() #0 {
entry:
  call void @test(ptr @333, ptr @lambda.348)
  ret void
}

define private i1 @lambda.348() {
entry:
  %0 = call i32 @check_external_sum(i32 80, i32 20)
  %1 = icmp eq i32 %0, 100
  ret i1 %1
}

; Function Attrs: nounwind
define private void @get_other_gen(ptr %0, i32 %1) #0 {
entry:
  %2 = getelementptr inbounds %OtherGen9, ptr %0, i32 0, i32 0
  store i32 %1, ptr %2, align 4
  ret void
}

; Function Attrs: nounwind
define private i32 @get_other_gen_value(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %OtherGen9, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  ret i32 %acc
}

; Function Attrs: nounwind
define private void @get_other_var1(ptr %0, i32 %1, i1 %2) #0 {
entry:
  br i1 %2, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %3 = getelementptr inbounds %OtherVar1, ptr %0, i32 0, i32 0
  store i32 0, ptr %3, align 4
  %4 = getelementptr inbounds %OtherVar1, ptr %0, i32 0, i32 1
  %5 = getelementptr inbounds { i32 }, ptr %4, i32 0, i32 0
  store i32 %1, ptr %5, align 4
  ret void

ifelse:                                           ; preds = %entry
  %6 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 0
  store i32 1, ptr %6, align 4
  %7 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 1
  ret void
}

; Function Attrs: nounwind
define private i32 @get_other_var1_value(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %OtherVar1, ptr %0, i32 0, i32 0
  %2 = load i32, ptr %1, align 4
  switch i32 %2, label %case1 [
    i32 0, label %case
    i32 1, label %case1
  ]

case:                                             ; preds = %entry
  %3 = getelementptr inbounds %OtherVar1, ptr %0, i32 0, i32 1, i32 0, i32 0
  %4 = load i32, ptr %3, align 4
  ret i32 %4

case1:                                            ; preds = %entry, %entry
  ret i32 -1
}

; Function Attrs: nounwind
define private i32 @gen_sum(i32 %0, i32 %1) #0 {
entry:
  %2 = add i32 %0, %1
  ret i32 %2
}

; Function Attrs: nounwind
define private i64 @gen_sum.349(i64 %0, i64 %1) #0 {
entry:
  %2 = add i64 %0, %1
  ret i64 %2
}

; Function Attrs: nounwind
define private i1 @is_this_60(i64 %0) #0 {
entry:
  %1 = icmp eq i64 %0, 60
  ret i1 %1
}

; Function Attrs: nounwind
define private void @create_pair_gen(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %PairGen, ptr %0, i32 0, i32 0
  store i32 12, ptr %1, align 4
  %2 = getelementptr inbounds %PairGen, ptr %0, i32 0, i32 1
  store i32 13, ptr %2, align 4
  ret void
}

; Function Attrs: nounwind
define private void @create_pair_gen_long(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %PairGen.3, ptr %0, i32 0, i32 0
  store i64 12, ptr %1, align 4
  %2 = getelementptr inbounds %PairGen.3, ptr %0, i32 0, i32 1
  store i64 14, ptr %2, align 4
  ret void
}

; Function Attrs: nounwind
define private i32 @mul_int_pair(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %PairGen, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = getelementptr inbounds %PairGen, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %2, align 4
  %3 = mul i32 %acc, %acc1
  ret i32 %3
}

; Function Attrs: nounwind
define private i16 @ext_div(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %PairGen.4, ptr %0, i32 0, i32 0
  %acc = load i16, ptr %1, align 2
  %2 = getelementptr inbounds %PairGen.4, ptr %0, i32 0, i32 1
  %acc1 = load i16, ptr %2, align 2
  %3 = sdiv i16 %acc, %acc1
  ret i16 %3
}

; Function Attrs: nounwind
define private void @get_other_gen_long(ptr %0, i64 %1) #0 {
entry:
  %2 = getelementptr inbounds %OtherGen9.5, ptr %0, i32 0, i32 0
  store i64 %1, ptr %2, align 4
  ret void
}

; Function Attrs: nounwind
define private i64 @get_other_gen_long_value(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %OtherGen9.5, ptr %0, i32 0, i32 0
  %acc = load i64, ptr %1, align 4
  ret i64 %acc
}

; Function Attrs: nounwind
define private void @get_other_var1_point(ptr %0, i32 %1, i1 %2) #0 {
entry:
  br i1 %2, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %3 = getelementptr inbounds %OtherVar1, ptr %0, i32 0, i32 0
  store i32 0, ptr %3, align 4
  %4 = getelementptr inbounds %OtherVar1, ptr %0, i32 0, i32 1
  %5 = getelementptr inbounds %OV1Point, ptr %4, i32 0, i32 0
  store i32 %1, ptr %5, align 4
  %6 = getelementptr inbounds %OV1Point, ptr %4, i32 0, i32 1
  store i32 %1, ptr %6, align 4
  %7 = getelementptr inbounds %OV1Point, ptr %4, i32 0, i32 2
  store i32 %1, ptr %7, align 4
  ret void

ifelse:                                           ; preds = %entry
  %8 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 0
  store i32 1, ptr %8, align 4
  %9 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 1
  ret void
}

; Function Attrs: nounwind
define private i32 @get_other_var1_point_value(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %OtherVar1, ptr %0, i32 0, i32 0
  %2 = load i32, ptr %1, align 4
  switch i32 %2, label %case3 [
    i32 0, label %case
    i32 1, label %case3
  ]

case:                                             ; preds = %entry
  %3 = getelementptr inbounds %OtherVar1, ptr %0, i32 0, i32 1, i32 0, i32 0
  %4 = getelementptr inbounds %OV1Point, ptr %3, i32 0, i32 0
  %acc = load i32, ptr %4, align 4
  %5 = getelementptr inbounds %OtherVar1, ptr %0, i32 0, i32 1, i32 0, i32 0
  %6 = getelementptr inbounds %OV1Point, ptr %5, i32 0, i32 1
  %acc1 = load i32, ptr %6, align 4
  %7 = add i32 %acc, %acc1
  %8 = getelementptr inbounds %OtherVar1, ptr %0, i32 0, i32 1, i32 0, i32 0
  %9 = getelementptr inbounds %OV1Point, ptr %8, i32 0, i32 2
  %acc2 = load i32, ptr %9, align 4
  %10 = add i32 %7, %acc2
  ret i32 %10

case3:                                            ; preds = %entry, %entry
  ret i32 -1
}

; Function Attrs: nounwind
define private void @test_basic_generics() #0 {
entry:
  call void @test(ptr @334, ptr @lambda.352)
  call void @test(ptr @335, ptr @lambda.353)
  call void @test(ptr @336, ptr @lambda.354)
  call void @test(ptr @337, ptr @lambda.355)
  call void @test(ptr @338, ptr @lambda.356)
  call void @test(ptr @339, ptr @lambda.357)
  call void @test(ptr @340, ptr @lambda.358)
  call void @test(ptr @341, ptr @lambda.359)
  call void @test(ptr @342, ptr @lambda.360)
  call void @test(ptr @343, ptr @lambda.361)
  call void @test(ptr @344, ptr @lambda.362)
  call void @test(ptr @345, ptr @lambda.363)
  call void @test(ptr @346, ptr @lambda.364)
  call void @test(ptr @347, ptr @lambda.365)
  call void @test(ptr @348, ptr @lambda.366)
  call void @test(ptr @349, ptr @lambda.367)
  call void @test(ptr @350, ptr @lambda.368)
  call void @test(ptr @351, ptr @lambda.369)
  ret void
}

; Function Attrs: nounwind
define private i32 @PairGen.add(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc1 = load i32, ptr %2, align 4
  %3 = add i32 %acc, %acc1
  ret i32 %3
}

; Function Attrs: nounwind
define private i64 @PairGen.add.350(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i64, i64 }, ptr %0, i32 0, i32 0
  %acc = load i64, ptr %1, align 4
  %2 = getelementptr inbounds { i64, i64 }, ptr %0, i32 0, i32 1
  %acc1 = load i64, ptr %2, align 4
  %3 = add i64 %acc, %acc1
  ret i64 %3
}

; Function Attrs: nounwind
define private i16 @PairGen.add.351(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i16, i16 }, ptr %0, i32 0, i32 0
  %acc = load i16, ptr %1, align 2
  %2 = getelementptr inbounds { i16, i16 }, ptr %0, i32 0, i32 1
  %acc1 = load i16, ptr %2, align 2
  %3 = add i16 %acc, %acc1
  ret i16 %3
}

; Function Attrs: nounwind
define private void @ShortPairGen.make(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { %PairGen.4 }, ptr %0, i32 0, i32 0, i32 0
  store i16 33, ptr %1, align 2
  %2 = getelementptr inbounds { %PairGen.4 }, ptr %0, i32 0, i32 0, i32 1
  store i16 10, ptr %2, align 2
  ret void
}

; Function Attrs: nounwind
define private i16 @ShortPairGen.add(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { %PairGen.4 }, ptr %0, i32 0, i32 0
  %2 = call i16 @PairGen.add.351(ptr %1)
  ret i16 %2
}

define private i1 @lambda.352() {
entry:
  %0 = call i32 @gen_sum(i32 10, i32 20)
  %1 = icmp eq i32 %0, 30
  ret i1 %1
}

define private i1 @lambda.353() {
entry:
  %0 = call i64 @gen_sum.349(i64 20, i64 20)
  %1 = icmp eq i64 %0, 40
  ret i1 %1
}

define private i1 @lambda.354() {
entry:
  %0 = call i64 @gen_sum.349(i64 30, i64 30)
  %1 = call i1 @is_this_60(i64 %0)
  ret i1 %1
}

define private i1 @lambda.355() {
entry:
  %0 = call i64 @gen_sum.349(i64 30, i64 40)
  %1 = alloca i64, align 8
  store i64 %0, ptr %1, align 4
  %i = load i64, ptr %1, align 4
  %2 = icmp eq i64 %i, 70
  ret i1 %2
}

define private i1 @lambda.356() {
entry:
  %0 = alloca %PairGen, align 8
  %1 = getelementptr inbounds %PairGen, ptr %0, i32 0, i32 0
  store i32 10, ptr %1, align 4
  %2 = getelementptr inbounds %PairGen, ptr %0, i32 0, i32 1
  store i32 12, ptr %2, align 4
  %3 = call i32 @PairGen.add(ptr %0)
  %4 = icmp eq i32 %3, 22
  ret i1 %4
}

define private i1 @lambda.357() {
entry:
  %0 = alloca %PairGen.3, align 8
  %1 = getelementptr inbounds %PairGen.3, ptr %0, i32 0, i32 0
  store i64 20, ptr %1, align 4
  %2 = getelementptr inbounds %PairGen.3, ptr %0, i32 0, i32 1
  store i64 15, ptr %2, align 4
  %3 = call i64 @PairGen.add.350(ptr %0)
  %4 = icmp eq i64 %3, 35
  ret i1 %4
}

define private i1 @lambda.358() {
entry:
  %0 = alloca %ShortPairGen, align 8
  call void @ShortPairGen.make(ptr %0)
  %1 = call i16 @ShortPairGen.add(ptr %0)
  %2 = icmp eq i16 %1, 43
  ret i1 %2
}

define private i1 @lambda.359() {
entry:
  %0 = alloca %ShortPairGen, align 8
  %1 = getelementptr inbounds %PairGen.4, ptr %0, i32 0, i32 0
  store i16 20, ptr %1, align 2
  %2 = getelementptr inbounds %PairGen.4, ptr %0, i32 0, i32 1
  store i16 41, ptr %2, align 2
  %3 = call i16 @ShortPairGen.add(ptr %0)
  %4 = icmp eq i16 %3, 61
  br i1 %4, label %5, label %9

5:                                                ; preds = %entry
  %6 = getelementptr inbounds %ShortPairGen, ptr %0, i32 0, i32 0
  %7 = call i16 @PairGen.add.351(ptr %6)
  %8 = icmp eq i16 %7, 61
  br label %9

9:                                                ; preds = %5, %entry
  %10 = phi i1 [ false, %entry ], [ %8, %5 ]
  ret i1 %10
}

define private i1 @lambda.360() {
entry:
  %0 = alloca %PairGen, align 8
  %1 = getelementptr inbounds %PairGen, ptr %0, i32 0, i32 0
  store i32 2, ptr %1, align 4
  %2 = getelementptr inbounds %PairGen, ptr %0, i32 0, i32 1
  store i32 9, ptr %2, align 4
  %3 = call i32 @mul_int_pair(ptr %0)
  %4 = icmp eq i32 %3, 18
  ret i1 %4
}

define private i1 @lambda.361() {
entry:
  %0 = alloca %PairGen, align 8
  call void @create_pair_gen(ptr %0)
  %1 = call i32 @PairGen.add(ptr %0)
  %2 = icmp eq i32 %1, 25
  ret i1 %2
}

define private i1 @lambda.362() {
entry:
  %0 = alloca %PairGen.3, align 8
  call void @create_pair_gen_long(ptr %0)
  %1 = call i64 @PairGen.add.350(ptr %0)
  %2 = icmp eq i64 %1, 26
  ret i1 %2
}

define private i1 @lambda.363() {
entry:
  %0 = alloca %PairGen.4, align 8
  %1 = getelementptr inbounds %PairGen.4, ptr %0, i32 0, i32 0
  store i16 56, ptr %1, align 2
  %2 = getelementptr inbounds %PairGen.4, ptr %0, i32 0, i32 1
  store i16 7, ptr %2, align 2
  %3 = call i16 @ext_div(ptr %0)
  %4 = icmp eq i16 %3, 8
  ret i1 %4
}

define private i1 @lambda.364() {
entry:
  %0 = alloca %OtherGen9, align 8
  call void @get_other_gen(ptr %0, i32 20)
  %1 = call i32 @get_other_gen_value(ptr %0)
  %2 = icmp eq i32 %1, 20
  ret i1 %2
}

define private i1 @lambda.365() {
entry:
  %0 = alloca %OtherGen9.5, align 8
  call void @get_other_gen_long(ptr %0, i64 22)
  %1 = call i64 @get_other_gen_long_value(ptr %0)
  %2 = icmp eq i64 %1, 22
  ret i1 %2
}

define private i1 @lambda.366() {
entry:
  %0 = alloca %OtherVar1, align 8
  call void @get_other_var1(ptr %0, i32 10, i1 true)
  %1 = call i32 @get_other_var1_value(ptr %0)
  %2 = icmp eq i32 %1, 10
  ret i1 %2
}

define private i1 @lambda.367() {
entry:
  %0 = alloca %OtherVar1, align 8
  call void @get_other_var1(ptr %0, i32 10, i1 false)
  %1 = call i32 @get_other_var1_value(ptr %0)
  %2 = icmp eq i32 %1, -1
  ret i1 %2
}

define private i1 @lambda.368() {
entry:
  %0 = alloca %OtherVar1.2, align 8
  call void @get_other_var1_point(ptr %0, i32 10, i1 true)
  %1 = call i32 @get_other_var1_point_value(ptr %0)
  %2 = icmp eq i32 %1, 30
  ret i1 %2
}

define private i1 @lambda.369() {
entry:
  %0 = alloca %OtherVar1.2, align 8
  call void @get_other_var1_point(ptr %0, i32 10, i1 false)
  %1 = call i32 @get_other_var1_point_value(ptr %0)
  %2 = icmp eq i32 %1, -1
  ret i1 %2
}

; Function Attrs: nounwind
define private i32 @deduce_gen_sum(i32 %0, i32 %1) #0 {
entry:
  %2 = add i32 %0, %1
  ret i32 %2
}

; Function Attrs: nounwind
define private i64 @deduce_gen_sum.370(i64 %0, i64 %1) #0 {
entry:
  %2 = add i64 %0, %1
  ret i64 %2
}

; Function Attrs: nounwind
define private i32 @deduce_thing(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %DeduceThing, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  ret i32 %acc
}

; Function Attrs: nounwind
define private i64 @deduce_thing.371(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %DeduceThing.6, ptr %0, i32 0, i32 0
  %acc = load i64, ptr %1, align 4
  ret i64 %acc
}

; Function Attrs: nounwind
define private i32 @give_gen_ret(i32 %0, i32 %1) #0 {
entry:
  %2 = add i32 %0, %1
  ret i32 %2
}

; Function Attrs: nounwind
define private i64 @give_gen_ret.372(i32 %0, i32 %1) #0 {
entry:
  %2 = add i32 %0, %1
  %3 = sext i32 %2 to i64
  ret i64 %3
}

; Function Attrs: nounwind
define private i32 @take_gen_ret(i32 %0) #0 {
entry:
  %1 = add i32 %0, 10
  ret i32 %1
}

; Function Attrs: nounwind
define private i64 @take_gen_ret_long(i64 %0) #0 {
entry:
  %1 = add i64 %0, 20
  ret i64 %1
}

; Function Attrs: nounwind
define private void @test_generic_type_deduction() #0 {
entry:
  call void @test(ptr @352, ptr @lambda.373)
  call void @test(ptr @353, ptr @lambda.374)
  call void @test(ptr @354, ptr @lambda.375)
  call void @test(ptr @355, ptr @lambda.376)
  call void @test(ptr @356, ptr @lambda.377)
  call void @test(ptr @357, ptr @lambda.378)
  ret void
}

define private i1 @lambda.373() {
entry:
  %0 = call i32 @deduce_gen_sum(i32 10, i32 10)
  %1 = icmp eq i32 %0, 20
  ret i1 %1
}

define private i1 @lambda.374() {
entry:
  %0 = call i64 @deduce_gen_sum.370(i64 10, i64 10)
  %1 = icmp eq i64 %0, 20
  ret i1 %1
}

define private i1 @lambda.375() {
entry:
  %0 = alloca %DeduceThing, align 8
  %1 = getelementptr inbounds %DeduceThing, ptr %0, i32 0, i32 0
  store i32 20, ptr %1, align 4
  %2 = call i32 @deduce_thing(ptr %0)
  %3 = icmp eq i32 %2, 20
  ret i1 %3
}

define private i1 @lambda.376() {
entry:
  %0 = alloca %DeduceThing.6, align 8
  %1 = getelementptr inbounds %DeduceThing.6, ptr %0, i32 0, i32 0
  store i64 40, ptr %1, align 4
  %2 = call i64 @deduce_thing.371(ptr %0)
  %3 = icmp eq i64 %2, 40
  ret i1 %3
}

define private i1 @lambda.377() {
entry:
  %0 = call i32 @give_gen_ret(i32 16, i32 16)
  %1 = call i32 @take_gen_ret(i32 %0)
  %2 = icmp eq i32 %1, 42
  ret i1 %2
}

define private i1 @lambda.378() {
entry:
  %0 = call i64 @give_gen_ret.372(i32 15, i32 15)
  %1 = call i64 @take_gen_ret_long(i64 %0)
  %2 = icmp eq i64 %1, 50
  ret i1 %2
}

; Function Attrs: nounwind
define private void @vector.make(ptr %0) #0 {
entry:
  %1 = call ptr @malloc(i64 0)
  %2 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 0
  store ptr %1, ptr %2, align 8
  %3 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 0, ptr %3, align 4
  %4 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 2
  store i64 2, ptr %4, align 4
  ret void
}

; Function Attrs: nounwind
define private void @vector.make_with_capacity(ptr %0, i64 %1) #0 {
entry:
  %2 = mul i64 4, %1
  %3 = call ptr @malloc(i64 %2)
  %4 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 0
  store ptr %3, ptr %4, align 8
  %5 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 0, ptr %5, align 4
  %6 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 2
  store i64 %1, ptr %6, align 4
  ret void
}

; Function Attrs: nounwind
define private void @vector.resize(ptr %0, i64 %1) #0 {
entry:
  %2 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %2, align 8
  %3 = mul i64 4, %1
  %4 = call ptr @realloc(ptr %acc, i64 %3)
  %5 = alloca ptr, align 8
  store ptr %4, ptr %5, align 8
  %new_data = load ptr, ptr %5, align 8
  %6 = icmp ne ptr %new_data, null
  br i1 %6, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %new_data1 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 0
  store ptr %new_data1, ptr %7, align 8
  %8 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 2
  store i64 %1, ptr %8, align 4
  br label %ifend

ifelse:                                           ; preds = %entry
  %9 = call i32 (ptr, ...) @printf(ptr @358, i64 %1)
  br label %ifend

ifend:                                            ; preds = %ifelse, %ifthen
  ret void
}

; Function Attrs: nounwind
define private void @vector.push(ptr %0, i32 %1) #0 {
entry:
  %2 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  %acc = load i64, ptr %2, align 4
  %3 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 2
  %acc1 = load i64, ptr %3, align 4
  %4 = icmp uge i64 %acc, %acc1
  br i1 %4, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %5 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 2
  %acc2 = load i64, ptr %5, align 4
  %6 = mul i64 %acc2, 2
  call void @vector.resize(ptr %0, i64 %6)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %7 = getelementptr inbounds { i32, i64, i64 }, ptr %0, i32 0, i32 0
  %acc3 = load ptr, ptr %7, align 8
  %8 = getelementptr inbounds i32, ptr %acc3, i64 %acc
  store i32 %1, ptr %8, align 4
  %9 = add i64 %acc, 1
  %10 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 %9, ptr %10, align 4
  ret void
}

; Function Attrs: nounwind
define private i32 @vector.get(ptr %0, i64 %1) #0 {
entry:
  %2 = getelementptr inbounds { i32, i64, i64 }, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %2, align 8
  %3 = getelementptr inbounds i32, ptr %acc, i64 %1
  %acc1 = load i32, ptr %3, align 4
  ret i32 %acc1
}

; Function Attrs: nounwind
define private void @vector.set(ptr %0, i64 %1, i32 %2) #0 {
entry:
  %3 = getelementptr inbounds { i32, i64, i64 }, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %3, align 8
  %4 = getelementptr inbounds i32, ptr %acc, i64 %1
  store i32 %2, ptr %4, align 4
  ret void
}

; Function Attrs: nounwind
define private i64 @vector.size(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  %acc = load i64, ptr %1, align 4
  ret i64 %acc
}

; Function Attrs: nounwind
define private i64 @vector.capacity(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 2
  %acc = load i64, ptr %1, align 4
  ret i64 %acc
}

; Function Attrs: nounwind
define private ptr @vector.data(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %1, align 8
  ret ptr %acc
}

; Function Attrs: nounwind
define private void @vector.remove(ptr %0, i64 %1) #0 {
entry:
  %2 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  %acc = load i64, ptr %2, align 4
  %3 = sub i64 %acc, 1
  %4 = icmp eq i64 %1, %3
  br i1 %4, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %5 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 %3, ptr %5, align 4
  br label %ifend

ifelse:                                           ; preds = %entry
  %6 = alloca i64, align 8
  store i64 %1, ptr %6, align 4
  br label %forcond

ifend:                                            ; preds = %forend, %ifthen
  ret void

forcond:                                          ; preds = %forthen, %ifelse
  %i = load i64, ptr %6, align 4
  %7 = icmp ult i64 %i, %3
  br i1 %7, label %forthen, label %forend

forthen:                                          ; preds = %forcond
  %8 = getelementptr inbounds { i32, i64, i64 }, ptr %0, i32 0, i32 0
  %acc1 = load ptr, ptr %8, align 8
  %i2 = load i64, ptr %6, align 4
  %9 = add i64 %i2, 1
  %10 = getelementptr inbounds i32, ptr %acc1, i64 %9
  %acc3 = load i32, ptr %10, align 4
  %11 = getelementptr inbounds { i32, i64, i64 }, ptr %0, i32 0, i32 0
  %acc4 = load ptr, ptr %11, align 8
  %i5 = load i64, ptr %6, align 4
  %12 = getelementptr inbounds i32, ptr %acc4, i64 %i5
  store i32 %acc3, ptr %12, align 4
  %i6 = load i64, ptr %6, align 4
  %13 = add i64 %i6, 1
  store i64 %13, ptr %6, align 4
  br label %forcond

forend:                                           ; preds = %forcond
  %14 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 %3, ptr %14, align 4
  br label %ifend
}

; Function Attrs: nounwind
define private void @vector.remove_last(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  %acc = load i64, ptr %1, align 4
  %2 = sub i64 %acc, 1
  %3 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 %2, ptr %3, align 4
  ret void
}

; Function Attrs: nounwind
define private void @vector.clear(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 0, ptr %1, align 4
  ret void
}

; Function Attrs: nounwind
define private void @vector.delete(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %1, align 8
  call void @free(ptr %acc)
  %2 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 0
  store ptr null, ptr %2, align 8
  %3 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 0, ptr %3, align 4
  %4 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 2
  store i64 0, ptr %4, align 4
  ret void

5:                                                ; No predecessors!
  ret void
}

; Function Attrs: nounwind
define private void @vector.make.379(ptr %0) #0 {
entry:
  %1 = call ptr @malloc(i64 0)
  %2 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 0
  store ptr %1, ptr %2, align 8
  %3 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 0, ptr %3, align 4
  %4 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 2
  store i64 2, ptr %4, align 4
  ret void
}

; Function Attrs: nounwind
define private void @vector.make_with_capacity.380(ptr %0, i64 %1) #0 {
entry:
  %2 = mul i64 8, %1
  %3 = call ptr @malloc(i64 %2)
  %4 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 0
  store ptr %3, ptr %4, align 8
  %5 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 0, ptr %5, align 4
  %6 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 2
  store i64 %1, ptr %6, align 4
  ret void
}

; Function Attrs: nounwind
define private void @vector.resize.381(ptr %0, i64 %1) #0 {
entry:
  %2 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %2, align 8
  %3 = mul i64 8, %1
  %4 = call ptr @realloc(ptr %acc, i64 %3)
  %5 = alloca ptr, align 8
  store ptr %4, ptr %5, align 8
  %new_data = load ptr, ptr %5, align 8
  %6 = icmp ne ptr %new_data, null
  br i1 %6, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %new_data1 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 0
  store ptr %new_data1, ptr %7, align 8
  %8 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 2
  store i64 %1, ptr %8, align 4
  br label %ifend

ifelse:                                           ; preds = %entry
  %9 = call i32 (ptr, ...) @printf(ptr @359, i64 %1)
  br label %ifend

ifend:                                            ; preds = %ifelse, %ifthen
  ret void
}

; Function Attrs: nounwind
define private void @vector.push.382(ptr %0, i64 %1) #0 {
entry:
  %2 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  %acc = load i64, ptr %2, align 4
  %3 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 2
  %acc1 = load i64, ptr %3, align 4
  %4 = icmp uge i64 %acc, %acc1
  br i1 %4, label %ifthen, label %ifend

ifthen:                                           ; preds = %entry
  %5 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 2
  %acc2 = load i64, ptr %5, align 4
  %6 = mul i64 %acc2, 2
  call void @vector.resize.381(ptr %0, i64 %6)
  br label %ifend

ifend:                                            ; preds = %ifthen, %entry
  %7 = getelementptr inbounds { i64, i64, i64 }, ptr %0, i32 0, i32 0
  %acc3 = load ptr, ptr %7, align 8
  %8 = getelementptr inbounds i64, ptr %acc3, i64 %acc
  store i64 %1, ptr %8, align 4
  %9 = add i64 %acc, 1
  %10 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 %9, ptr %10, align 4
  ret void
}

; Function Attrs: nounwind
define private i64 @vector.get.383(ptr %0, i64 %1) #0 {
entry:
  %2 = getelementptr inbounds { i64, i64, i64 }, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %2, align 8
  %3 = getelementptr inbounds i64, ptr %acc, i64 %1
  %acc1 = load i64, ptr %3, align 4
  ret i64 %acc1
}

; Function Attrs: nounwind
define private void @vector.set.384(ptr %0, i64 %1, i64 %2) #0 {
entry:
  %3 = getelementptr inbounds { i64, i64, i64 }, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %3, align 8
  %4 = getelementptr inbounds i64, ptr %acc, i64 %1
  store i64 %2, ptr %4, align 4
  ret void
}

; Function Attrs: nounwind
define private i64 @vector.size.385(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  %acc = load i64, ptr %1, align 4
  ret i64 %acc
}

; Function Attrs: nounwind
define private i64 @vector.capacity.386(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 2
  %acc = load i64, ptr %1, align 4
  ret i64 %acc
}

; Function Attrs: nounwind
define private ptr @vector.data.387(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %1, align 8
  ret ptr %acc
}

; Function Attrs: nounwind
define private void @vector.remove.388(ptr %0, i64 %1) #0 {
entry:
  %2 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  %acc = load i64, ptr %2, align 4
  %3 = sub i64 %acc, 1
  %4 = icmp eq i64 %1, %3
  br i1 %4, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %5 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 %3, ptr %5, align 4
  br label %ifend

ifelse:                                           ; preds = %entry
  %6 = alloca i64, align 8
  store i64 %1, ptr %6, align 4
  br label %forcond

ifend:                                            ; preds = %forend, %ifthen
  ret void

forcond:                                          ; preds = %forthen, %ifelse
  %i = load i64, ptr %6, align 4
  %7 = icmp ult i64 %i, %3
  br i1 %7, label %forthen, label %forend

forthen:                                          ; preds = %forcond
  %8 = getelementptr inbounds { i64, i64, i64 }, ptr %0, i32 0, i32 0
  %acc1 = load ptr, ptr %8, align 8
  %i2 = load i64, ptr %6, align 4
  %9 = add i64 %i2, 1
  %10 = getelementptr inbounds i64, ptr %acc1, i64 %9
  %acc3 = load i64, ptr %10, align 4
  %11 = getelementptr inbounds { i64, i64, i64 }, ptr %0, i32 0, i32 0
  %acc4 = load ptr, ptr %11, align 8
  %i5 = load i64, ptr %6, align 4
  %12 = getelementptr inbounds i64, ptr %acc4, i64 %i5
  store i64 %acc3, ptr %12, align 4
  %i6 = load i64, ptr %6, align 4
  %13 = add i64 %i6, 1
  store i64 %13, ptr %6, align 4
  br label %forcond

forend:                                           ; preds = %forcond
  %14 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 %3, ptr %14, align 4
  br label %ifend
}

; Function Attrs: nounwind
define private void @vector.remove_last.389(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  %acc = load i64, ptr %1, align 4
  %2 = sub i64 %acc, 1
  %3 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 %2, ptr %3, align 4
  ret void
}

; Function Attrs: nounwind
define private void @vector.clear.390(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 0, ptr %1, align 4
  ret void
}

; Function Attrs: nounwind
define private void @vector.delete.391(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %1, align 8
  call void @free(ptr %acc)
  %2 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 0
  store ptr null, ptr %2, align 8
  %3 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 1
  store i64 0, ptr %3, align 4
  %4 = getelementptr inbounds { ptr, i64, i64 }, ptr %0, i32 0, i32 2
  store i64 0, ptr %4, align 4
  ret void

5:                                                ; No predecessors!
  ret void
}

; Function Attrs: nounwind
define private void @test_vectors() #0 {
entry:
  call void @test(ptr @360, ptr @lambda.392)
  call void @test(ptr @361, ptr @lambda.393)
  call void @test(ptr @362, ptr @lambda.394)
  call void @test(ptr @363, ptr @lambda.395)
  call void @test(ptr @364, ptr @lambda.396)
  call void @test(ptr @365, ptr @lambda.397)
  ret void
}

define private i1 @lambda.392() {
entry:
  %0 = alloca %vector, align 8
  call void @vector.make.379(ptr %0)
  call void @vector.push(ptr %0, i32 10)
  call void @vector.push(ptr %0, i32 20)
  %1 = call i64 @vector.size(ptr %0)
  %2 = icmp eq i64 %1, 2
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = call i32 @vector.get(ptr %0, i64 0)
  %5 = icmp eq i32 %4, 10
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  br i1 %7, label %8, label %11

8:                                                ; preds = %6
  %9 = call i32 @vector.get(ptr %0, i64 1)
  %10 = icmp eq i32 %9, 20
  br label %11

11:                                               ; preds = %8, %6
  %12 = phi i1 [ false, %6 ], [ %10, %8 ]
  call void @vector.delete(ptr %0)
  ret i1 %12
}

define private i1 @lambda.393() {
entry:
  %0 = alloca %vector.7, align 8
  call void @vector.make.379(ptr %0)
  call void @vector.push.382(ptr %0, i64 10)
  call void @vector.push.382(ptr %0, i64 20)
  %1 = call i64 @vector.size.385(ptr %0)
  %2 = icmp eq i64 %1, 2
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = call i64 @vector.get.383(ptr %0, i64 0)
  %5 = icmp eq i64 %4, 10
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  br i1 %7, label %8, label %11

8:                                                ; preds = %6
  %9 = call i64 @vector.get.383(ptr %0, i64 1)
  %10 = icmp eq i64 %9, 20
  br label %11

11:                                               ; preds = %8, %6
  %12 = phi i1 [ false, %6 ], [ %10, %8 ]
  call void @vector.delete(ptr %0)
  ret i1 %12
}

define private i1 @lambda.394() {
entry:
  %0 = alloca %vector, align 8
  call void @vector.make.379(ptr %0)
  call void @vector.push(ptr %0, i32 10)
  call void @vector.push(ptr %0, i32 20)
  call void @vector.remove_last(ptr %0)
  %1 = call i64 @vector.size(ptr %0)
  %2 = icmp eq i64 %1, 1
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = call i32 @vector.get(ptr %0, i64 0)
  %5 = icmp eq i32 %4, 10
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  call void @vector.delete(ptr %0)
  ret i1 %7
}

define private i1 @lambda.395() {
entry:
  %0 = alloca %vector, align 8
  call void @vector.make.379(ptr %0)
  call void @vector.push(ptr %0, i32 10)
  call void @vector.push(ptr %0, i32 20)
  call void @vector.remove(ptr %0, i64 0)
  %1 = call i64 @vector.size(ptr %0)
  %2 = icmp eq i64 %1, 1
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = call i32 @vector.get(ptr %0, i64 0)
  %5 = icmp eq i32 %4, 20
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  call void @vector.delete(ptr %0)
  ret i1 %7
}

define private i1 @lambda.396() {
entry:
  %0 = alloca %vector, align 8
  call void @vector.make.379(ptr %0)
  %1 = alloca i32, align 4
  store i32 10, ptr %1, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  br label %loopcond

loopcond:                                         ; preds = %loopthen, %entry
  %i = load i32, ptr %1, align 4
  %3 = icmp slt i32 %i, 300
  br i1 %3, label %loopthen, label %loopexit

loopthen:                                         ; preds = %loopcond
  call void @vector.push(ptr %0, i32 10)
  %sum = load i32, ptr %2, align 4
  %4 = add i32 %sum, 10
  store i32 %4, ptr %2, align 4
  %i1 = load i32, ptr %1, align 4
  %5 = add i32 %i1, 10
  store i32 %5, ptr %1, align 4
  br label %loopcond

loopexit:                                         ; preds = %loopcond
  %6 = alloca i32, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %1, align 4
  br label %loopcond2

loopcond2:                                        ; preds = %loopthen3, %loopexit
  %i5 = load i32, ptr %1, align 4
  %7 = call i64 @vector.size(ptr %0)
  %8 = sext i32 %i5 to i64
  %9 = icmp slt i64 %8, %7
  br i1 %9, label %loopthen3, label %loopexit4

loopthen3:                                        ; preds = %loopcond2
  %act_sum = load i32, ptr %6, align 4
  %i6 = load i32, ptr %1, align 4
  %10 = call i32 @vector.get(ptr %0, i32 %i6)
  %11 = add i32 %act_sum, %10
  store i32 %11, ptr %6, align 4
  %i7 = load i32, ptr %1, align 4
  %12 = add i32 %i7, 1
  store i32 %12, ptr %1, align 4
  br label %loopcond2

loopexit4:                                        ; preds = %loopcond2
  %sum8 = load i32, ptr %2, align 4
  %act_sum9 = load i32, ptr %6, align 4
  %13 = icmp eq i32 %sum8, %act_sum9
  call void @vector.delete(ptr %0)
  ret i1 %13
}

define private i1 @lambda.397() {
entry:
  %0 = alloca %vector, align 8
  call void @vector.make.379(ptr %0)
  call void @vector.push(ptr %0, i32 10)
  call void @vector.push(ptr %0, i32 20)
  call void @vector.push(ptr %0, i32 30)
  call void @vector.push(ptr %0, i32 40)
  call void @vector.push(ptr %0, i32 50)
  call void @vector.set(ptr %0, i64 0, i32 50)
  call void @vector.set(ptr %0, i64 1, i32 40)
  call void @vector.set(ptr %0, i64 2, i32 30)
  call void @vector.set(ptr %0, i64 3, i32 20)
  call void @vector.set(ptr %0, i64 4, i32 10)
  %1 = call i32 @vector.get(ptr %0, i64 0)
  %2 = icmp eq i32 %1, 50
  br i1 %2, label %3, label %6

3:                                                ; preds = %entry
  %4 = call i32 @vector.get(ptr %0, i64 1)
  %5 = icmp eq i32 %4, 40
  br label %6

6:                                                ; preds = %3, %entry
  %7 = phi i1 [ false, %entry ], [ %5, %3 ]
  br i1 %7, label %8, label %11

8:                                                ; preds = %6
  %9 = call i32 @vector.get(ptr %0, i64 2)
  %10 = icmp eq i32 %9, 30
  br label %11

11:                                               ; preds = %8, %6
  %12 = phi i1 [ false, %6 ], [ %10, %8 ]
  br i1 %12, label %13, label %16

13:                                               ; preds = %11
  %14 = call i32 @vector.get(ptr %0, i64 3)
  %15 = icmp eq i32 %14, 20
  br label %16

16:                                               ; preds = %13, %11
  %17 = phi i1 [ false, %11 ], [ %15, %13 ]
  br i1 %17, label %18, label %21

18:                                               ; preds = %16
  %19 = call i32 @vector.get(ptr %0, i64 4)
  %20 = icmp eq i32 %19, 10
  br label %21

21:                                               ; preds = %18, %16
  %22 = phi i1 [ false, %16 ], [ %20, %18 ]
  call void @vector.delete(ptr %0)
  ret i1 %22
}

; Function Attrs: nounwind
define private void @ArrayRef.constructor(ptr %0, ptr %1, i64 %2) #0 {
entry:
  %3 = getelementptr inbounds { ptr, i64 }, ptr %0, i32 0, i32 0
  store ptr %1, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, i64 }, ptr %0, i32 0, i32 1
  store i64 %2, ptr %4, align 4
  ret void
}

; Function Attrs: nounwind
define private i64 @array_ref_size(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %ArrayRef, ptr %0, i32 0, i32 1
  %acc = load i64, ptr %1, align 4
  ret i64 %acc
}

; Function Attrs: nounwind
define private i32 @array_ref_at(ptr %0, i32 %1) #0 {
entry:
  %2 = getelementptr inbounds %ArrayRef, ptr %0, i32 0, i32 0
  %acc = load ptr, ptr %2, align 8
  %3 = getelementptr inbounds i32, ptr %acc, i32 %1
  %acc1 = load i32, ptr %3, align 4
  ret i32 %acc1
}

; Function Attrs: nounwind
define private void @test_array_refs() #0 {
entry:
  call void @test(ptr @366, ptr @lambda.398)
  call void @test(ptr @367, ptr @lambda.399)
  call void @test(ptr @368, ptr @lambda.400)
  call void @test(ptr @369, ptr @lambda.401)
  call void @test(ptr @370, ptr @lambda.402)
  call void @test(ptr @371, ptr @lambda.403)
  call void @test(ptr @372, ptr @lambda.404)
  call void @test(ptr @373, ptr @lambda.405)
  ret void
}

define private i1 @lambda.398() {
entry:
  %0 = alloca %ArrayRef, align 8
  %1 = alloca [2 x i32], align 4
  %2 = getelementptr inbounds [2 x i32], ptr %1, i32 0, i32 0
  store i32 10, ptr %2, align 4
  %3 = getelementptr inbounds [2 x i32], ptr %1, i32 0, i32 1
  store i32 20, ptr %3, align 4
  call void @ArrayRef.constructor(ptr %0, ptr %1, i64 2)
  %4 = getelementptr inbounds %ArrayRef, ptr %0
  %5 = call i64 @array_ref_size(ptr %4)
  %6 = icmp eq i64 %5, 2
  ret i1 %6
}

define private i1 @lambda.399() {
entry:
  %arr = alloca [1 x i32], align 4
  %0 = getelementptr inbounds [1 x i32], ptr %arr, i32 0, i32 0
  store i32 10, ptr %0, align 4
  %1 = alloca %ArrayRef, align 8
  %2 = getelementptr inbounds [1 x i32], ptr %arr, i32 0, i32 0
  call void @ArrayRef.constructor(ptr %1, ptr %2, i64 1)
  %3 = getelementptr inbounds %ArrayRef, ptr %1
  %4 = call i64 @array_ref_size(ptr %3)
  %5 = icmp eq i64 %4, 1
  ret i1 %5
}

define private i1 @lambda.400() {
entry:
  %arr = alloca [1 x i32], align 4
  %0 = getelementptr inbounds [1 x i32], ptr %arr, i32 0, i32 0
  store i32 10, ptr %0, align 4
  %1 = alloca %ArrayRef, align 8
  %2 = getelementptr inbounds [1 x i32], ptr %arr, i32 0, i32 0
  call void @ArrayRef.constructor(ptr %1, ptr %2, i64 1)
  %3 = getelementptr inbounds %ArrayRef, ptr %1
  %4 = call i32 @array_ref_at(ptr %3, i32 0)
  %5 = icmp eq i32 %4, 10
  ret i1 %5
}

define private i1 @lambda.401() {
entry:
  %0 = alloca %ArrayRef, align 8
  %1 = alloca [3 x i32], align 4
  %2 = getelementptr inbounds [3 x i32], ptr %1, i32 0, i32 0
  store i32 10, ptr %2, align 4
  %3 = getelementptr inbounds [3 x i32], ptr %1, i32 0, i32 1
  store i32 20, ptr %3, align 4
  %4 = getelementptr inbounds [3 x i32], ptr %1, i32 0, i32 2
  store i32 30, ptr %4, align 4
  call void @ArrayRef.constructor(ptr %0, ptr %1, i64 3)
  %5 = getelementptr inbounds %ArrayRef, ptr %0
  %6 = call i32 @array_ref_at(ptr %5, i32 2)
  %7 = icmp eq i32 %6, 30
  br i1 %7, label %8, label %17

8:                                                ; preds = %entry
  %9 = alloca %ArrayRef, align 8
  %10 = alloca [3 x i32], align 4
  %11 = getelementptr inbounds [3 x i32], ptr %10, i32 0, i32 0
  store i32 10, ptr %11, align 4
  %12 = getelementptr inbounds [3 x i32], ptr %10, i32 0, i32 1
  store i32 20, ptr %12, align 4
  %13 = getelementptr inbounds [3 x i32], ptr %10, i32 0, i32 2
  store i32 30, ptr %13, align 4
  call void @ArrayRef.constructor(ptr %9, ptr %10, i64 3)
  %14 = getelementptr inbounds %ArrayRef, ptr %9
  %15 = call i32 @array_ref_at(ptr %14, i32 1)
  %16 = icmp eq i32 %15, 20
  br label %17

17:                                               ; preds = %8, %entry
  %18 = phi i1 [ false, %entry ], [ %16, %8 ]
  ret i1 %18
}

define private i1 @lambda.402() {
entry:
  %0 = alloca %vector, align 8
  call void @vector.make.379(ptr %0)
  call void @vector.push(ptr %0, i32 10)
  call void @vector.push(ptr %0, i32 20)
  call void @vector.push(ptr %0, i32 30)
  %1 = alloca %ArrayRef, align 8
  %2 = call ptr @vector.data(ptr %0)
  %3 = call i64 @vector.size(ptr %0)
  call void @ArrayRef.constructor(ptr %1, ptr %2, i64 %3)
  %4 = getelementptr inbounds %ArrayRef, ptr %1
  %5 = call i32 @array_ref_at(ptr %4, i32 2)
  %6 = icmp eq i32 %5, 30
  br i1 %6, label %7, label %14

7:                                                ; preds = %entry
  %8 = alloca %ArrayRef, align 8
  %9 = call ptr @vector.data(ptr %0)
  %10 = call i64 @vector.size(ptr %0)
  call void @ArrayRef.constructor(ptr %8, ptr %9, i64 %10)
  %11 = getelementptr inbounds %ArrayRef, ptr %8
  %12 = call i32 @array_ref_at(ptr %11, i32 1)
  %13 = icmp eq i32 %12, 20
  br label %14

14:                                               ; preds = %7, %entry
  %15 = phi i1 [ false, %entry ], [ %13, %7 ]
  call void @vector.delete(ptr %0)
  ret i1 %15
}

define private i1 @lambda.403() {
entry:
  %0 = alloca %vector, align 8
  call void @vector.make.379(ptr %0)
  call void @vector.push(ptr %0, i32 10)
  %1 = alloca %ArrayRef, align 8
  %2 = call ptr @vector.data(ptr %0)
  %3 = call i64 @vector.size(ptr %0)
  call void @ArrayRef.constructor(ptr %1, ptr %2, i64 %3)
  %4 = getelementptr inbounds %ArrayRef, ptr %1
  %5 = call i64 @array_ref_size(ptr %4)
  %6 = icmp eq i64 %5, 1
  call void @vector.delete(ptr %0)
  ret i1 %6
}

define private i1 @lambda.404() {
entry:
  %0 = alloca %vector, align 8
  call void @vector.make.379(ptr %0)
  call void @vector.push(ptr %0, i32 10)
  %1 = alloca %ArrayRef, align 8
  %2 = call ptr @vector.data(ptr %0)
  %3 = call i64 @vector.size(ptr %0)
  call void @ArrayRef.constructor(ptr %1, ptr %2, i64 %3)
  %4 = getelementptr inbounds %ArrayRef, ptr %1
  %5 = call i32 @array_ref_at(ptr %4, i32 0)
  %6 = icmp eq i32 %5, 10
  call void @vector.delete(ptr %0)
  ret i1 %6
}

define private i1 @lambda.405() {
entry:
  %0 = alloca %vector, align 8
  call void @vector.make.379(ptr %0)
  call void @vector.push(ptr %0, i32 10)
  call void @vector.push(ptr %0, i32 20)
  call void @vector.push(ptr %0, i32 30)
  %1 = alloca %ArrayRef, align 8
  %2 = call ptr @vector.data(ptr %0)
  %3 = call i64 @vector.size(ptr %0)
  call void @ArrayRef.constructor(ptr %1, ptr %2, i64 %3)
  %4 = getelementptr inbounds %ArrayRef, ptr %1
  %5 = call i32 @array_ref_at(ptr %4, i32 2)
  %6 = icmp eq i32 %5, 30
  br i1 %6, label %7, label %14

7:                                                ; preds = %entry
  %8 = alloca %ArrayRef, align 8
  %9 = call ptr @vector.data(ptr %0)
  %10 = call i64 @vector.size(ptr %0)
  call void @ArrayRef.constructor(ptr %8, ptr %9, i64 %10)
  %11 = getelementptr inbounds %ArrayRef, ptr %8
  %12 = call i32 @array_ref_at(ptr %11, i32 1)
  %13 = icmp eq i32 %12, 20
  br label %14

14:                                               ; preds = %7, %entry
  %15 = phi i1 [ false, %entry ], [ %13, %7 ]
  call void @vector.delete(ptr %0)
  ret i1 %15
}

; Function Attrs: nounwind
define private void @get_optional_int(ptr %0, i1 %1) #0 {
entry:
  br i1 %1, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %2 = getelementptr inbounds %Option, ptr %0, i32 0, i32 0
  store i32 0, ptr %2, align 4
  %3 = getelementptr inbounds %Option, ptr %0, i32 0, i32 1
  %4 = getelementptr inbounds { i32 }, ptr %3, i32 0, i32 0
  store i32 32, ptr %4, align 4
  ret void

ifelse:                                           ; preds = %entry
  %5 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 0
  store i32 1, ptr %5, align 4
  %6 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 1
  ret void
}

; Function Attrs: nounwind
define private i32 @get_opt_value(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %Option, ptr %0, i32 0, i32 0
  %2 = load i32, ptr %1, align 4
  switch i32 %2, label %case1 [
    i32 0, label %case
    i32 1, label %case1
  ]

case:                                             ; preds = %entry
  %3 = getelementptr inbounds %Option, ptr %0, i32 0, i32 1, i32 0, i32 0
  %4 = load i32, ptr %3, align 4
  ret i32 %4

case1:                                            ; preds = %entry, %entry
  ret i32 -1
}

; Function Attrs: nounwind
define private void @test_optional_type() #0 {
entry:
  call void @test(ptr @374, ptr @lambda.406)
  call void @test(ptr @375, ptr @lambda.407)
  ret void
}

define private i1 @lambda.406() {
entry:
  %0 = alloca %Option, align 8
  call void @get_optional_int(ptr %0, i1 true)
  %1 = call i32 @get_opt_value(ptr %0)
  %2 = icmp eq i32 %1, 32
  ret i1 %2
}

define private i1 @lambda.407() {
entry:
  %0 = alloca %Option, align 8
  call void @get_optional_int(ptr %0, i1 false)
  %1 = call i32 @get_opt_value(ptr %0)
  %2 = icmp eq i32 %1, -1
  ret i1 %2
}

; Function Attrs: nounwind
define private void @get_result_int(ptr %0, i1 %1, i1 %2) #0 {
entry:
  br i1 %1, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %3 = getelementptr inbounds %Result, ptr %0, i32 0, i32 0
  store i32 0, ptr %3, align 4
  %4 = getelementptr inbounds %Result, ptr %0, i32 0, i32 1
  %5 = getelementptr inbounds { i32 }, ptr %4, i32 0, i32 0
  store i32 42, ptr %5, align 4
  ret void

ifelse:                                           ; preds = %entry
  br i1 %2, label %ifthen1, label %ifelse2

ifthen1:                                          ; preds = %ifelse
  %6 = getelementptr inbounds { i32, { { i32 } } }, ptr %0, i32 0, i32 0
  store i32 1, ptr %6, align 4
  %7 = getelementptr inbounds { i32, { { i32 } } }, ptr %0, i32 0, i32 1
  %8 = getelementptr inbounds { i32 }, ptr %7, i32 0, i32 0
  store i32 0, ptr %8, align 4
  ret void

ifelse2:                                          ; preds = %ifelse
  %9 = getelementptr inbounds { i32, { { i32 } } }, ptr %0, i32 0, i32 0
  store i32 1, ptr %9, align 4
  %10 = getelementptr inbounds { i32, { { i32 } } }, ptr %0, i32 0, i32 1
  %11 = getelementptr inbounds { i32 }, ptr %10, i32 0, i32 0
  store i32 1, ptr %11, align 4
  ret void
}

; Function Attrs: nounwind
define private i32 @get_result_value(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %Result, ptr %0, i32 0, i32 0
  %2 = load i32, ptr %1, align 4
  switch i32 %2, label %case1 [
    i32 0, label %case
    i32 1, label %case1
  ]

case:                                             ; preds = %entry
  %3 = getelementptr inbounds %Result, ptr %0, i32 0, i32 1, i32 0, i32 0
  %4 = load i32, ptr %3, align 4
  ret i32 %4

case1:                                            ; preds = %entry, %entry
  %5 = getelementptr inbounds { i32, { { i32 } } }, ptr %0, i32 0, i32 1, i32 0, i32 0
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %ifthen, label %elseifcond0

ifthen:                                           ; preds = %case1
  ret i32 -1

elseifcond0:                                      ; preds = %case1
  %8 = getelementptr inbounds { i32, { { i32 } } }, ptr %0, i32 0, i32 1, i32 0, i32 0
  %9 = load i32, ptr %8, align 4
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %elseifbody0, label %ifelse

elseifbody0:                                      ; preds = %elseifcond0
  ret i32 -2

ifelse:                                           ; preds = %elseifcond0
  ret i32 -3
}

; Function Attrs: nounwind
define private void @test_result_type() #0 {
entry:
  call void @test(ptr @376, ptr @lambda.408)
  call void @test(ptr @377, ptr @lambda.409)
  call void @test(ptr @378, ptr @lambda.410)
  ret void
}

define private i1 @lambda.408() {
entry:
  %0 = alloca %Result, align 8
  call void @get_result_int(ptr %0, i1 true, i1 false)
  %1 = call i32 @get_result_value(ptr %0)
  %2 = icmp eq i32 %1, 42
  ret i1 %2
}

define private i1 @lambda.409() {
entry:
  %0 = alloca %Result, align 8
  call void @get_result_int(ptr %0, i1 false, i1 true)
  %1 = call i32 @get_result_value(ptr %0)
  %2 = icmp eq i32 %1, -1
  ret i1 %2
}

define private i1 @lambda.410() {
entry:
  %0 = alloca %Result, align 8
  call void @get_result_int(ptr %0, i1 false, i1 false)
  %1 = call i32 @get_result_value(ptr %0)
  %2 = icmp eq i32 %1, -2
  ret i1 %2
}

; Function Attrs: nounwind
define private i32 @call_actual(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  %2 = load ptr, ptr %1, align 8
  %3 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  %4 = load ptr, ptr %3, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = call i32 %5(ptr %2)
  ret i32 %6
}

; Function Attrs: nounwind
define private void @ret_dyn_obj1(ptr %0, ptr %1) #0 {
entry:
  %2 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr %1, ptr %2, align 8
  %3 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr @379, ptr %3, align 8
  ret void
}

; Function Attrs: nounwind
define private void @ret_dyn_obj2(ptr %0, ptr %1) #0 {
entry:
  %2 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr %1, ptr %2, align 8
  %3 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr @380, ptr %3, align 8
  ret void
}

; Function Attrs: nounwind
define private void @test_dynamic_dispatch() #0 {
entry:
  call void @test(ptr @381, ptr @lambda.412)
  call void @test(ptr @382, ptr @lambda.413)
  call void @test(ptr @383, ptr @lambda.414)
  call void @test(ptr @384, ptr @lambda.415)
  call void @test(ptr @385, ptr @lambda.416)
  call void @test(ptr @386, ptr @lambda.417)
  call void @test(ptr @387, ptr @lambda.418)
  call void @test(ptr @388, ptr @lambda.419)
  call void @test(ptr @389, ptr @lambda.420)
  call void @test(ptr @390, ptr @lambda.421)
  call void @test(ptr @391, ptr @lambda.422)
  call void @test(ptr @392, ptr @lambda.423)
  call void @test(ptr @393, ptr @lambda.424)
  call void @test(ptr @394, ptr @lambda.425)
  call void @test(ptr @395, ptr @lambda.426)
  call void @test(ptr @396, ptr @lambda.427)
  ret void
}

; Function Attrs: nounwind
define private i32 @Phone.call(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 0
  %acc = load i32, ptr %1, align 4
  ret i32 %acc
}

; Function Attrs: nounwind
define private i32 @Phone.call.411(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds { i32, i32 }, ptr %0, i32 0, i32 1
  %acc = load i32, ptr %1, align 4
  ret i32 %acc
}

define private i1 @lambda.412() {
entry:
  %0 = alloca %SmartPhone, align 8
  %1 = getelementptr inbounds %SmartPhone, ptr %0, i32 0, i32 0
  store i32 99, ptr %1, align 4
  %2 = alloca { ptr, ptr }, align 8
  %3 = getelementptr inbounds { ptr, ptr }, ptr %2, i32 0, i32 0
  store ptr %0, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %2, i32 0, i32 1
  store ptr @379, ptr %4, align 8
  %5 = call i32 @call_actual(ptr %2)
  %6 = icmp eq i32 %5, 99
  ret i1 %6
}

define private i1 @lambda.413() {
entry:
  %0 = alloca %CellPhone, align 8
  %1 = getelementptr inbounds %CellPhone, ptr %0, i32 0, i32 1
  store i32 22, ptr %1, align 4
  %2 = alloca { ptr, ptr }, align 8
  %3 = getelementptr inbounds { ptr, ptr }, ptr %2, i32 0, i32 0
  store ptr %0, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %2, i32 0, i32 1
  store ptr @380, ptr %4, align 8
  %5 = call i32 @call_actual(ptr %2)
  %6 = icmp eq i32 %5, 22
  ret i1 %6
}

define private i1 @lambda.414() {
entry:
  %0 = alloca %SmartPhone, align 8
  %1 = getelementptr inbounds %SmartPhone, ptr %0, i32 0, i32 0
  store i32 88, ptr %1, align 4
  %2 = alloca { ptr, ptr }, align 8
  call void @ret_dyn_obj1(ptr %2, ptr %0)
  %3 = getelementptr inbounds { ptr, ptr }, ptr %2, i32 0, i32 0
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds { ptr, ptr }, ptr %2, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  %7 = load ptr, ptr %6, align 8
  %8 = call i32 %7(ptr %4)
  %9 = icmp eq i32 %8, 88
  ret i1 %9
}

define private i1 @lambda.415() {
entry:
  %0 = alloca %CellPhone, align 8
  %1 = getelementptr inbounds %CellPhone, ptr %0, i32 0, i32 1
  store i32 66, ptr %1, align 4
  %2 = alloca { ptr, ptr }, align 8
  call void @ret_dyn_obj2(ptr %2, ptr %0)
  %3 = getelementptr inbounds { ptr, ptr }, ptr %2, i32 0, i32 0
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds { ptr, ptr }, ptr %2, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  %7 = load ptr, ptr %6, align 8
  %8 = call i32 %7(ptr %4)
  %9 = icmp eq i32 %8, 66
  ret i1 %9
}

define private i1 @lambda.416() {
entry:
  %0 = alloca { ptr, ptr }, align 8
  %1 = alloca %SmartPhone, align 8
  %2 = getelementptr inbounds %SmartPhone, ptr %1, i32 0, i32 0
  store i32 45, ptr %2, align 4
  %3 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr %1, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr @379, ptr %4, align 8
  %5 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 %9(ptr %6)
  %11 = icmp eq i32 %10, 45
  ret i1 %11
}

define private i1 @lambda.417() {
entry:
  %0 = alloca { ptr, ptr }, align 8
  %1 = alloca %CellPhone, align 8
  %2 = getelementptr inbounds %CellPhone, ptr %1, i32 0, i32 1
  store i32 35, ptr %2, align 4
  %3 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr %1, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr @380, ptr %4, align 8
  %5 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 %9(ptr %6)
  %11 = icmp eq i32 %10, 35
  ret i1 %11
}

define private i1 @lambda.418() {
entry:
  %0 = alloca %SmartPhone, align 8
  %1 = getelementptr inbounds %SmartPhone, ptr %0, i32 0, i32 0
  store i32 73, ptr %1, align 4
  %2 = alloca { ptr, ptr }, align 8
  store ptr %0, ptr %2, align 8
  %3 = getelementptr inbounds { ptr, ptr }, ptr %2, i32 0, i32 1
  store ptr @379, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %2, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds { ptr, ptr }, ptr %2, i32 0, i32 1
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 %8(ptr %5)
  %10 = icmp eq i32 %9, 73
  ret i1 %10
}

define private i1 @lambda.419() {
entry:
  %0 = alloca %CellPhone, align 8
  %1 = getelementptr inbounds %CellPhone, ptr %0, i32 0, i32 1
  store i32 26, ptr %1, align 4
  %2 = alloca { ptr, ptr }, align 8
  store ptr %0, ptr %2, align 8
  %3 = getelementptr inbounds { ptr, ptr }, ptr %2, i32 0, i32 1
  store ptr @380, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %2, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds { ptr, ptr }, ptr %2, i32 0, i32 1
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 %8(ptr %5)
  %10 = icmp eq i32 %9, 26
  ret i1 %10
}

define private i1 @lambda.420() {
entry:
  %0 = alloca { ptr, ptr }, align 8
  %1 = alloca %SmartPhone, align 8
  %2 = getelementptr inbounds %SmartPhone, ptr %1, i32 0, i32 0
  store i32 57, ptr %2, align 4
  %3 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr %1, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr @379, ptr %4, align 8
  %5 = alloca %CellPhone, align 8
  %6 = getelementptr inbounds %CellPhone, ptr %5, i32 0, i32 1
  store i32 73, ptr %6, align 4
  %7 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr %5, ptr %7, align 8
  %8 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr @380, ptr %8, align 8
  %9 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 %13(ptr %10)
  %15 = icmp eq i32 %14, 73
  ret i1 %15
}

define private i1 @lambda.421() {
entry:
  %0 = alloca { ptr, ptr }, align 8
  %1 = alloca %CellPhone, align 8
  %2 = getelementptr inbounds %CellPhone, ptr %1, i32 0, i32 1
  store i32 35, ptr %2, align 4
  %3 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr %1, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr @380, ptr %4, align 8
  %5 = alloca %SmartPhone, align 8
  %6 = getelementptr inbounds %SmartPhone, ptr %5, i32 0, i32 0
  store i32 26, ptr %6, align 4
  %7 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr %5, ptr %7, align 8
  %8 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr @379, ptr %8, align 8
  %9 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 %13(ptr %10)
  %15 = icmp eq i32 %14, 26
  ret i1 %15
}

define private i1 @lambda.422() {
entry:
  %0 = alloca { ptr, ptr }, align 8
  %1 = alloca %SmartPhone, align 8
  %2 = getelementptr inbounds %SmartPhone, ptr %1, i32 0, i32 0
  store i32 57, ptr %2, align 4
  %3 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr %1, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr @379, ptr %4, align 8
  %5 = alloca %CellPhone, align 8
  %6 = getelementptr inbounds %CellPhone, ptr %5, i32 0, i32 1
  store i32 73, ptr %6, align 4
  %7 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr %5, ptr %7, align 8
  %8 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr @380, ptr %8, align 8
  %9 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 %13(ptr %10)
  %15 = icmp eq i32 %14, 73
  ret i1 %15
}

define private i1 @lambda.423() {
entry:
  %0 = alloca { ptr, ptr }, align 8
  %1 = alloca %CellPhone, align 8
  %2 = getelementptr inbounds %CellPhone, ptr %1, i32 0, i32 1
  store i32 35, ptr %2, align 4
  %3 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr %1, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr @380, ptr %4, align 8
  %5 = alloca %SmartPhone, align 8
  %6 = getelementptr inbounds %SmartPhone, ptr %5, i32 0, i32 0
  store i32 26, ptr %6, align 4
  %7 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr %5, ptr %7, align 8
  %8 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr @379, ptr %8, align 8
  %9 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 %13(ptr %10)
  %15 = icmp eq i32 %14, 26
  ret i1 %15
}

define private i1 @lambda.424() {
entry:
  %0 = alloca %PhoneContainer, align 8
  %1 = getelementptr inbounds %PhoneContainer, ptr %0, i32 0, i32 0
  %2 = alloca %SmartPhone, align 8
  %3 = getelementptr inbounds %SmartPhone, ptr %2, i32 0, i32 0
  store i32 33, ptr %3, align 4
  %4 = getelementptr inbounds { ptr, ptr }, ptr %1, i32 0, i32 0
  store ptr %2, ptr %4, align 8
  %5 = getelementptr inbounds { ptr, ptr }, ptr %1, i32 0, i32 1
  store ptr @379, ptr %5, align 8
  %6 = getelementptr inbounds %PhoneContainer, ptr %0, i32 0, i32 0
  %7 = getelementptr inbounds { ptr, ptr }, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds { ptr, ptr }, ptr %6, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 %11(ptr %8)
  %13 = icmp eq i32 %12, 33
  ret i1 %13
}

define private i1 @lambda.425() {
entry:
  %0 = alloca %PhoneContainer, align 8
  %1 = getelementptr inbounds %PhoneContainer, ptr %0, i32 0, i32 0
  %2 = alloca %CellPhone, align 8
  %3 = getelementptr inbounds %CellPhone, ptr %2, i32 0, i32 1
  store i32 55, ptr %3, align 4
  %4 = getelementptr inbounds { ptr, ptr }, ptr %1, i32 0, i32 0
  store ptr %2, ptr %4, align 8
  %5 = getelementptr inbounds { ptr, ptr }, ptr %1, i32 0, i32 1
  store ptr @380, ptr %5, align 8
  %6 = getelementptr inbounds %PhoneContainer, ptr %0, i32 0, i32 0
  %7 = getelementptr inbounds { ptr, ptr }, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds { ptr, ptr }, ptr %6, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 %11(ptr %8)
  %13 = icmp eq i32 %12, 55
  ret i1 %13
}

define private i1 @lambda.426() {
entry:
  %p = alloca [1 x { ptr, ptr }], align 8
  %0 = getelementptr inbounds [1 x { ptr, ptr }], ptr %p, i32 0, i32 0
  %1 = alloca %SmartPhone, align 8
  %2 = getelementptr inbounds %SmartPhone, ptr %1, i32 0, i32 0
  store i32 11, ptr %2, align 4
  %3 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr %1, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr @379, ptr %4, align 8
  %5 = getelementptr inbounds [1 x { ptr, ptr }], ptr %p, i32 0, i32 0
  %6 = getelementptr inbounds { ptr, ptr }, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr inbounds { ptr, ptr }, ptr %5, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %9, align 8
  %11 = call i32 %10(ptr %7)
  %12 = icmp eq i32 %11, 11
  ret i1 %12
}

define private i1 @lambda.427() {
entry:
  %p = alloca [1 x { ptr, ptr }], align 8
  %0 = getelementptr inbounds [1 x { ptr, ptr }], ptr %p, i32 0, i32 0
  %1 = alloca %CellPhone, align 8
  %2 = getelementptr inbounds %CellPhone, ptr %1, i32 0, i32 1
  store i32 88, ptr %2, align 4
  %3 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 0
  store ptr %1, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, ptr }, ptr %0, i32 0, i32 1
  store ptr @380, ptr %4, align 8
  %5 = getelementptr inbounds [1 x { ptr, ptr }], ptr %p, i32 0, i32 0
  %6 = getelementptr inbounds { ptr, ptr }, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr inbounds { ptr, ptr }, ptr %5, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %9, align 8
  %11 = call i32 %10(ptr %7)
  %12 = icmp eq i32 %11, 88
  ret i1 %12
}

; Function Attrs: nounwind
define private i32 @get_value(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %OptVariant, ptr %0, i32 0, i32 0
  %2 = load i32, ptr %1, align 4
  switch i32 %2, label %case1 [
    i32 0, label %case
    i32 1, label %case1
  ]

case:                                             ; preds = %entry
  %3 = getelementptr inbounds %OptVariant, ptr %0, i32 0, i32 1, i32 0, i32 0
  %4 = load i32, ptr %3, align 4
  ret i32 %4

case1:                                            ; preds = %entry, %entry
  ret i32 -1
}

; Function Attrs: nounwind
define private void @give_variant(ptr %0, i1 %1) #0 {
entry:
  br i1 %1, label %ifthen, label %ifelse

ifthen:                                           ; preds = %entry
  %2 = getelementptr inbounds %OptVariant, ptr %0, i32 0, i32 0
  store i32 0, ptr %2, align 4
  %3 = getelementptr inbounds %OptVariant, ptr %0, i32 0, i32 1
  %4 = getelementptr inbounds { i32 }, ptr %3, i32 0, i32 0
  store i32 30, ptr %4, align 4
  ret void

ifelse:                                           ; preds = %entry
  %5 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 0
  store i32 1, ptr %5, align 4
  %6 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 1
  ret void
}

; Function Attrs: nounwind
define private i32 @get_sum(ptr %0) #0 {
entry:
  %1 = getelementptr inbounds %GenVar, ptr %0, i32 0, i32 0
  %2 = load i32, ptr %1, align 4
  switch i32 %2, label %case1 [
    i32 0, label %case
    i32 1, label %case1
  ]

case:                                             ; preds = %entry
  %3 = getelementptr inbounds { i32, { { i32, i32 } } }, ptr %0, i32 0, i32 1, i32 0, i32 0
  %4 = load i32, ptr %3, align 4
  %5 = getelementptr inbounds { i32, { { i32, i32 } } }, ptr %0, i32 0, i32 1, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = add i32 %4, %6
  ret i32 %7

case1:                                            ; preds = %entry, %entry
  %8 = getelementptr inbounds %GenVar, ptr %0, i32 0, i32 1, i32 0, i32 0
  %9 = load i32, ptr %8, align 4
  %10 = getelementptr inbounds %GenVar, ptr %0, i32 0, i32 1, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = add i32 %9, %11
  %13 = getelementptr inbounds %GenVar, ptr %0, i32 0, i32 1, i32 0, i32 2
  %14 = load i32, ptr %13, align 4
  %15 = add i32 %12, %14
  ret i32 %15
}

; Function Attrs: nounwind
define private void @test_variants() #0 {
entry:
  call void @test(ptr @397, ptr @lambda.428)
  call void @test(ptr @398, ptr @lambda.429)
  call void @test(ptr @399, ptr @lambda.430)
  call void @test(ptr @400, ptr @lambda.431)
  call void @test(ptr @401, ptr @lambda.432)
  call void @test(ptr @402, ptr @lambda.433)
  call void @test(ptr @403, ptr @lambda.434)
  call void @test(ptr @404, ptr @lambda.435)
  call void @test(ptr @405, ptr @lambda.436)
  call void @test(ptr @406, ptr @lambda.437)
  call void @test(ptr @407, ptr @lambda.438)
  call void @test(ptr @408, ptr @lambda.439)
  call void @test(ptr @409, ptr @lambda.440)
  call void @test(ptr @410, ptr @lambda.441)
  call void @test(ptr @411, ptr @lambda.442)
  ret void
}

define private i1 @lambda.428() {
entry:
  %0 = alloca %OptVariant, align 8
  %1 = getelementptr inbounds %OptVariant, ptr %0, i32 0, i32 0
  store i32 0, ptr %1, align 4
  %2 = getelementptr inbounds %OptVariant, ptr %0, i32 0, i32 1
  %3 = getelementptr inbounds { i32 }, ptr %2, i32 0, i32 0
  store i32 10, ptr %3, align 4
  %4 = call i32 @get_value(ptr %0)
  %5 = icmp eq i32 %4, 10
  ret i1 %5
}

define private i1 @lambda.429() {
entry:
  %0 = alloca { i32, { {} } }, align 8
  %1 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 0
  store i32 1, ptr %1, align 4
  %2 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 1
  %3 = call i32 @get_value(ptr %0)
  %4 = icmp eq i32 %3, -1
  ret i1 %4
}

define private i1 @lambda.430() {
entry:
  %0 = alloca { i32, { {} } }, align 8
  %1 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 0
  store i32 1, ptr %1, align 4
  %2 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 1
  %3 = call i32 @get_value(ptr %0)
  %4 = icmp eq i32 %3, -1
  ret i1 %4
}

define private i1 @lambda.431() {
entry:
  %v = alloca %OptVariant, align 8
  %v1 = load %OptVariant, ptr %v, align 4
  %0 = getelementptr inbounds %OptVariant, %OptVariant %v1, i32 0, i32 0
  %1 = load i32, %OptVariant %0, align 4
  switch i32 %1, label %end [
    i32 0, label %case
    i32 1, label %case2
  ]

end:                                              ; preds = %entry
  ret i1 true

case:                                             ; preds = %entry
  ret i1 false

case2:                                            ; preds = %entry
  ret i1 false
}

define private i1 @lambda.432() {
entry:
  %0 = alloca %OptVariant, align 8
  call void @give_variant(ptr %0, i1 true)
  %1 = call i32 @get_value(ptr %0)
  %2 = icmp eq i32 %1, 30
  ret i1 %2
}

define private i1 @lambda.433() {
entry:
  %0 = alloca %OptVariant, align 8
  call void @give_variant(ptr %0, i1 false)
  %1 = call i32 @get_value(ptr %0)
  %2 = icmp eq i32 %1, -1
  ret i1 %2
}

define private i1 @lambda.434() {
entry:
  %0 = alloca %ContOptVariant, align 8
  %1 = getelementptr inbounds %ContOptVariant, ptr %0, i32 0, i32 0
  %2 = getelementptr inbounds %OptVariant, ptr %1, i32 0, i32 0
  store i32 0, ptr %2, align 4
  %3 = getelementptr inbounds %OptVariant, ptr %1, i32 0, i32 1
  %4 = getelementptr inbounds { i32 }, ptr %3, i32 0, i32 0
  store i32 55, ptr %4, align 4
  %5 = getelementptr inbounds %ContOptVariant, ptr %0, i32 0, i32 0
  %6 = call i32 @get_value(ptr %5)
  %7 = icmp eq i32 %6, 55
  ret i1 %7
}

define private i1 @lambda.435() {
entry:
  %0 = alloca %ContOptVariant, align 8
  %1 = getelementptr inbounds %ContOptVariant, ptr %0, i32 0, i32 0
  %2 = getelementptr inbounds { i32, { {} } }, ptr %1, i32 0, i32 0
  store i32 1, ptr %2, align 4
  %3 = getelementptr inbounds { i32, { {} } }, ptr %1, i32 0, i32 1
  %4 = getelementptr inbounds %ContOptVariant, ptr %0, i32 0, i32 0
  %5 = call i32 @get_value(ptr %4)
  %6 = icmp eq i32 %5, -1
  ret i1 %6
}

define private i1 @lambda.436() {
entry:
  %c = alloca [1 x %OptVariant], align 8
  %0 = getelementptr inbounds [1 x %OptVariant], ptr %c, i32 0, i32 0
  %1 = getelementptr inbounds %OptVariant, ptr %0, i32 0, i32 0
  store i32 0, ptr %1, align 4
  %2 = getelementptr inbounds %OptVariant, ptr %0, i32 0, i32 1
  %3 = getelementptr inbounds { i32 }, ptr %2, i32 0, i32 0
  store i32 76, ptr %3, align 4
  %4 = getelementptr inbounds [1 x %OptVariant], ptr %c, i32 0, i32 0
  %5 = call i32 @get_value(ptr %4)
  %6 = icmp eq i32 %5, 76
  ret i1 %6
}

define private i1 @lambda.437() {
entry:
  %c = alloca [1 x { i32, { {} } }], align 8
  %0 = getelementptr inbounds [1 x { i32, { {} } }], ptr %c, i32 0, i32 0
  %1 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 0
  store i32 1, ptr %1, align 4
  %2 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 1
  %3 = getelementptr inbounds [1 x %OptVariant], ptr %c, i32 0, i32 0
  %4 = call i32 @get_value(ptr %3)
  %5 = icmp eq i32 %4, -1
  ret i1 %5
}

define private i1 @lambda.438() {
entry:
  %c = alloca [2 x %OptVariant], align 8
  %0 = getelementptr inbounds [2 x %OptVariant], ptr %c, i32 0, i32 0
  %1 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 0
  store i32 1, ptr %1, align 4
  %2 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 1
  %3 = getelementptr inbounds [2 x %OptVariant], ptr %c, i32 0, i32 1
  %4 = getelementptr inbounds %OptVariant, ptr %3, i32 0, i32 0
  store i32 0, ptr %4, align 4
  %5 = getelementptr inbounds %OptVariant, ptr %3, i32 0, i32 1
  %6 = getelementptr inbounds { i32 }, ptr %5, i32 0, i32 0
  store i32 43, ptr %6, align 4
  %7 = getelementptr inbounds [2 x %OptVariant], ptr %c, i32 0, i32 0
  %8 = call i32 @get_value(ptr %7)
  %9 = icmp eq i32 %8, -1
  br i1 %9, label %10, label %14

10:                                               ; preds = %entry
  %11 = getelementptr inbounds [2 x %OptVariant], ptr %c, i32 0, i32 1
  %12 = call i32 @get_value(ptr %11)
  %13 = icmp eq i32 %12, 43
  br label %14

14:                                               ; preds = %10, %entry
  %15 = phi i1 [ false, %entry ], [ %13, %10 ]
  ret i1 %15
}

define private i1 @lambda.439() {
entry:
  %0 = alloca %OptVariant, align 8
  %1 = getelementptr inbounds %OptVariant, ptr %0, i32 0, i32 0
  store i32 0, ptr %1, align 4
  %2 = getelementptr inbounds %OptVariant, ptr %0, i32 0, i32 1
  %3 = getelementptr inbounds { i32 }, ptr %2, i32 0, i32 0
  store i32 12, ptr %3, align 4
  %4 = call i32 @get_value(ptr %0)
  %5 = icmp eq i32 %4, 12
  ret i1 %5
}

define private i1 @lambda.440() {
entry:
  %0 = alloca { i32, { {} } }, align 8
  %1 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 0
  store i32 1, ptr %1, align 4
  %2 = getelementptr inbounds { i32, { {} } }, ptr %0, i32 0, i32 1
  %3 = call i32 @get_value(ptr %0)
  %4 = icmp eq i32 %3, -1
  ret i1 %4
}

define private i1 @lambda.441() {
entry:
  %0 = alloca { i32, { { i32, i32 } } }, align 8
  %1 = getelementptr inbounds { i32, { { i32, i32 } } }, ptr %0, i32 0, i32 0
  store i32 0, ptr %1, align 4
  %2 = getelementptr inbounds { i32, { { i32, i32 } } }, ptr %0, i32 0, i32 1
  %3 = getelementptr inbounds { i32, i32 }, ptr %2, i32 0, i32 0
  store i32 20, ptr %3, align 4
  %4 = getelementptr inbounds { i32, i32 }, ptr %2, i32 0, i32 1
  store i32 30, ptr %4, align 4
  %5 = call i32 @get_sum(ptr %0)
  %6 = icmp eq i32 %5, 50
  ret i1 %6
}

define private i1 @lambda.442() {
entry:
  %0 = alloca %GenVar, align 8
  %1 = getelementptr inbounds %GenVar, ptr %0, i32 0, i32 0
  store i32 1, ptr %1, align 4
  %2 = getelementptr inbounds %GenVar, ptr %0, i32 0, i32 1
  %3 = getelementptr inbounds { i32, i32, i32 }, ptr %2, i32 0, i32 0
  store i32 20, ptr %3, align 4
  %4 = getelementptr inbounds { i32, i32, i32 }, ptr %2, i32 0, i32 1
  store i32 30, ptr %4, align 4
  %5 = getelementptr inbounds { i32, i32, i32 }, ptr %2, i32 0, i32 2
  store i32 2, ptr %5, align 4
  %6 = call i32 @get_sum(ptr %0)
  %7 = icmp eq i32 %6, 52
  ret i1 %7
}

; Function Attrs: nounwind
define dso_local void @main() #0 {
entry:
  call void @test_var_init()
  call void @test_lambda()
  call void @test_bodmas()
  call void @test_floating_expr()
  call void @test_nodes()
  call void @test_numbers()
  call void @test_structs()
  call void @test_enum()
  call void @test_strings()
  call void @test_macros()
  call void @test_arrays()
  call void @test_pointer_math()
  call void @test_casts()
  call void @test_functions()
  call void @test_destructors()
  call void @test_unions()
  call void @test_namespaces()
  call void @test_comptime()
  call void @test_compiler_vector()
  call void @test_external_functions()
  call void @test_basic_generics()
  call void @test_generic_type_deduction()
  call void @test_vectors()
  call void @test_array_refs()
  call void @test_dynamic_dispatch()
  call void @test_variants()
  call void @test_optional_type()
  call void @test_result_type()
  call void @print_test_stats()
  ret void
}

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
