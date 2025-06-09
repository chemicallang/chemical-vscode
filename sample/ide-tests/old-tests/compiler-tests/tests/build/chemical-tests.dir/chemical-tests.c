#include <stdbool.h>
#include <stddef.h>
typedef struct {
	void* first;
	void* second;
} __chemical_fat_pointer__;
int printf(char* format, ...);
int sprintf(char* to, char* format, ...);
void* malloc(size_t size);
void* realloc(void* block, size_t size);
void free(void* block);
void* memcpy(void* _Dst, void* _Src, size_t _Size);
size_t strlen(char* _Str);
int strcmp(char* str1, char* str2);
int strncmp(char* str1, char* str2, size_t n);
int memcmp(void* ptr1, void* ptr2, size_t num);
static void success_msg(char* message);
static void error_msg(char* message);
static void test(char* name, _Bool(*assert)());
static void print_test_stats();
static _Bool assertEquals(int actual, int expected);
/** var_init defining the value **/
static char* ANSI_COLOR_RESET = "\x1b[0m";
/** var_init defining the value **/
static char* ANSI_COLOR_RED = "\x1b[31m";
/** var_init defining the value **/
static char* ANSI_COLOR_GREEN = "\x1b[32m";
/** var_init defining the value **/
static char* ANSI_COLOR_YELLOW = "\x1b[33m";
/** var_init defining the value **/
static char* ANSI_COLOR_BLUE = "\x1b[34m";
/** var_init defining the value **/
static char* ANSI_COLOR_MAGENTA = "\x1b[35m";
/** var_init defining the value **/
static char* ANSI_COLOR_CYAN = "\x1b[36m";
/** var_init defining the value **/
static char* ANSI_COLOR_WHITE = "\x1b[37m";
/** var_init defining the value **/
static int total_tests = 0;
/** var_init defining the value **/
static int tests_passed = 0;
/** var_init defining the value **/
static int tests_failed = 0;
static void success_msg(char* message){
	printf("%s%s%s\n", ANSI_COLOR_GREEN, message, ANSI_COLOR_RESET);
}
static void error_msg(char* message){
	printf("%s%s%s\n", ANSI_COLOR_RED, message, ANSI_COLOR_RESET);
}
static void test(char* name, _Bool(*assert)()){
	if(assert()){
		printf("%sTest %d [%s] succeeded %s\n", ANSI_COLOR_GREEN, (total_tests + 1), name, ANSI_COLOR_RESET);
		tests_passed += 1;
	} else {
		printf("%sTest %d [%s] failed %s\n", ANSI_COLOR_RED, (total_tests + 1), name, ANSI_COLOR_RESET);
		tests_failed += 1;
	}
	total_tests += 1;
}
static void print_test_stats(){
	printf("Total %d", total_tests);
	printf(" %sPassed %d%s", ANSI_COLOR_GREEN, tests_passed, ANSI_COLOR_RESET);
	if((tests_failed == 0)){
		printf(" %s", ANSI_COLOR_GREEN);
	} else {
		printf(" %s", ANSI_COLOR_RED);
	}
	printf("Failed %d", tests_failed);
	printf("%s", ANSI_COLOR_RESET);
}
static _Bool assertEquals(int actual, int expected){
	if((actual != expected)){
		printf("%sExpected %s Got %s%s\n", ANSI_COLOR_RED, expected, actual, ANSI_COLOR_RESET);
		return 0;
	} else {
		return 1;
	}
}
struct LambdaProvider {
	int(*provide)();
};
struct Nested {
	struct LambdaProvider provider;
};
static _Bool capturing(__chemical_fat_pointer__* lambda);
static _Bool delegate(__chemical_fat_pointer__* lambda);
static _Bool dontCapture(_Bool(*lambda)());
static int passed(int(*pass)());
static int(*create_lamb(_Bool first))();
struct SelfLambda {
	int i;
	int(*lambda)(struct SelfLambda* self);
};
struct PointSome {
	int a;
	int b;
};
static void(*lamb_ret_struct())(struct PointSome* __chx_struct_ret_param_xx, int a, int b);
struct ProvideStructLamb {
	void(*lamb)(struct PointSome* __chx_struct_ret_param_xx, int a, int b);
};
struct ProvideSelfRefStructLamb {
	int mul;
	void(*lamb)(struct PointSome* __chx_struct_ret_param_xx, struct ProvideSelfRefStructLamb* self, int a, int b);
};
struct LambFactory {
};
static int(*LambFactorycreate_lamb())();
static void test_lambda();
static int fn_rets_1();
static int fn_rets_2();
static int __chemda_840_0(){
	return 5;
}
static int __chemda_318_1(){
	return 10;
}
static void __chemda_637_2(struct PointSome* __chx_struct_ret_param_xx, int a, int b){
	__chx_struct_ret_param_xx->a = a;
	__chx_struct_ret_param_xx->b = b;
}
static int __chemda_735_3(){
	return 233;
}
static _Bool __chemda_905_4(){
	return 1;
}
static _Bool __chemda_739_5(){
	return 1;
}
static _Bool __chemda_172_6(){
	return 1;
}
static _Bool __chemda_899_7(){
	return dontCapture(__chemda_172_6);;
}
static _Bool __chemda_583_8(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct LambFactory factory = {};
	return (LambFactorycreate_lamb()() == 233);
}
static _Bool __chemda_313_9(){
	return 1;
}
static _Bool __chemda_180_10(){
	return dontCapture(__chemda_313_9);;
}
static _Bool __chemda_659_11(void* this){
	return 1;
}
static _Bool __chemda_135_12(){
	return capturing((&(__chemical_fat_pointer__){__chemda_659_11,NULL}));;
}
static _Bool __chemda_617_13(void* this){
	return 1;
}
static _Bool __chemda_366_14(){
	return capturing((&(__chemical_fat_pointer__){__chemda_617_13,NULL}));;
}
struct __chemda_777_15_cap {
	_Bool captured;
};
static _Bool __chemda_777_15(void* this){
	return ((struct __chemda_777_15_cap*) this)->captured;
}
static _Bool __chemda_419_16(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool captured = 1;
	return capturing((&(__chemical_fat_pointer__){__chemda_777_15,(&(struct __chemda_777_15_cap){captured})}));;
}
struct __chemda_779_17_cap {
	_Bool captured;
};
static _Bool __chemda_779_17(void* this){
	return !((struct __chemda_779_17_cap*) this)->captured;
}
static _Bool __chemda_477_18(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool captured = 0;
	return capturing((&(__chemical_fat_pointer__){__chemda_779_17,(&(struct __chemda_779_17_cap){captured})}));;
}
struct __chemda_716_19_cap {
	_Bool* captured;
};
static _Bool __chemda_716_19(void* this){
	return *((struct __chemda_716_19_cap*) this)->captured;
}
static _Bool __chemda_768_20(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool captured = 1;
	return capturing((&(__chemical_fat_pointer__){__chemda_716_19,(&(struct __chemda_716_19_cap){&captured})}));;
}
struct __chemda_469_21_cap {
	_Bool captured;
};
static _Bool __chemda_469_21(void* this){
	return ((struct __chemda_469_21_cap*) this)->captured;
}
static _Bool __chemda_120_22(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool captured = 1;
	return delegate((&(__chemical_fat_pointer__){__chemda_469_21,(&(struct __chemda_469_21_cap){captured})}));;
}
struct __chemda_412_23_cap {
	_Bool x;
};
static _Bool __chemda_412_23(void* this){
	return ((struct __chemda_412_23_cap*) this)->x;
}
static _Bool __chemda_609_24(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool x = 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chemical_fat_pointer__* message = (&(__chemical_fat_pointer__){__chemda_412_23,(&(struct __chemda_412_23_cap){x})});
	return (((_Bool(*)(void*)) message->first)(message->second));;
}
static _Bool __chemda_518_25(){
	return (passed(fn_rets_1) == 1);
}
static _Bool __chemda_112_26(){
	return (passed(fn_rets_2) == 2);
}
typedef int(*__chx_functype_477_0)();
static int __chemda_720_27(){
	return 252;
}
static _Bool __chemda_266_28(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chx_functype_477_0 x = __chemda_720_27;
	return (x() == 252);
}
typedef int(*__chx_functype_778_1)();
static int __chemda_868_29(){
	return 253;
}
static _Bool __chemda_222_30(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chx_functype_778_1 x = __chemda_868_29;
	return (x() == 253);
}
static int __chemda_971_31(){
	return 252;
}
static _Bool __chemda_450_32(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct LambdaProvider p = {.provide = __chemda_971_31, };
	return (p.provide() == 252);
}
static int __chemda_535_33(){
	return 252;
}
static _Bool __chemda_144_34(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Nested n = {.provider = {.provide = __chemda_535_33, }, };
	return (n.provider.provide() == 252);
}
typedef int(*__chx_functype_549_2)();
static int __chemda_614_35(){
	return 5;
}
static int __chemda_923_36(){
	return 10;
}
static _Bool __chemda_267_37(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chx_functype_549_2 arr[2] = {};
	arr[0] = __chemda_614_35;
	arr[1] = __chemda_923_36;
	return ((arr[0]() == 5) && (arr[1]() == 10));
}
static _Bool __chemda_754_38(){
	return ((create_lamb(1)() == 5) && (create_lamb(0)() == 10));
}
static int __chemda_484_39(struct SelfLambda* self){
	return (self->i * 2);
}
static _Bool __chemda_215_40(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct SelfLambda self_lamb = {.i = 55, .lambda = __chemda_484_39, };
	return (self_lamb.lambda(&self_lamb) == 110);
}
static _Bool __chemda_723_41(){
	/** visiting var init in before **/
	struct PointSome p;
	/** function call being taken out that returns struct **/
	lamb_ret_struct()(&p, 10, 20);
	/** var_init defining the value **/
	
	return ((p.a == 10) && (p.b == 20));
}
static void __chemda_386_42(struct PointSome* __chx_struct_ret_param_xx, int a, int b){
	__chx_struct_ret_param_xx->a = a;
	__chx_struct_ret_param_xx->b = b;
}
static _Bool __chemda_873_43(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct ProvideStructLamb p = {.lamb = __chemda_386_42, };
	/** visiting var init in before **/
	struct PointSome c;
	/** function call being taken out that returns struct **/
	p.lamb(&c, 20, 30);
	/** var_init defining the value **/
	
	return ((c.a == 20) && (c.b == 30));
}
static void __chemda_602_44(struct PointSome* __chx_struct_ret_param_xx, struct ProvideSelfRefStructLamb* self, int a, int b){
	__chx_struct_ret_param_xx->a = (self->mul * a);
	__chx_struct_ret_param_xx->b = (self->mul * b);
}
static _Bool __chemda_324_45(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct ProvideSelfRefStructLamb provide = {.lamb = __chemda_602_44, .mul = 2, };
	/** visiting var init in before **/
	struct PointSome p;
	/** function call being taken out that returns struct **/
	provide.lamb(&p, &provide, 10, 20);
	/** var_init defining the value **/
	
	return ((p.a == 20) && (p.b == 40));
}
static _Bool capturing(__chemical_fat_pointer__* lambda){
	return (((_Bool(*)(void*)) lambda->first)(lambda->second));;
}
static _Bool delegate(__chemical_fat_pointer__* lambda){
	return capturing(lambda);;
}
static _Bool dontCapture(_Bool(*lambda)()){
	return lambda();;
}
static int passed(int(*pass)()){
	return pass();;
}
static int(*create_lamb(_Bool first))(){
	if(first){
		return __chemda_840_0;
	} else {
		return __chemda_318_1;
	}
}
static void(*lamb_ret_struct())(struct PointSome* __chx_struct_ret_param_xx, int a, int b){
	return __chemda_637_2;
}
static int(*LambFactorycreate_lamb())(){
	return __chemda_735_3;
}
static void test_lambda(){
	test("testing non capturing lambda works", __chemda_905_4);
	test("testing lambda without braces works", __chemda_739_5);
	test("testing non capturing lambda works", __chemda_899_7);
	test("lambdas created by structs work", __chemda_583_8);
	test("testing non capturing lambda works without body", __chemda_180_10);
	test("testing non capturing lambda can be passed to capturing lambda", __chemda_135_12);
	test("testing capturing lambda type works with empty capturing lambda", __chemda_366_14);
	test("testing capturing lambda can capture primitive bool value - 1", __chemda_419_16);
	test("testing capturing lambda can capture primitive bool value - 2", __chemda_477_18);
	test("testing capturing lambda can capture by ref", __chemda_768_20);
	test("testing capturing lambda can be passed between functions", __chemda_120_22);
	test("can initialize and call a capturing lambda", __chemda_609_24);
	test("can pass function pointer as lambda 1", __chemda_518_25);
	test("can pass function pointer as lambda 2", __chemda_112_26);
	test("can call lambda from a variable", __chemda_266_28);
	test("can call lambda without knowing type", __chemda_222_30);
	test("can call lambda stored in struct", __chemda_450_32);
	test("can call lambda stored nested in a struct", __chemda_144_34);
	test("can call lambda stored in an array", __chemda_267_37);
	test("a function can return lambdas", __chemda_754_38);
	test("supports self lambdas", __chemda_215_40);
	test("lambda can return struct - 1", __chemda_723_41);
	test("lambda can return struct - 2", __chemda_873_43);
	test("lambdas with self reference can return a struct", __chemda_324_45);
}
static int fn_rets_1(){
	return 1;
}
static int fn_rets_2(){
	return 2;
}
static void test_bodmas();
static _Bool __chemda_765_46(){
	return ((4 + (2 / 2)) == 5);
}
static _Bool __chemda_317_47(){
	return (((4 / 2) + 2) == 4);
}
static _Bool __chemda_393_48(){
	return ((4 + (2 / 2)) == 5);
}
static _Bool __chemda_137_49(){
	return (((3 * (4 + 2)) - (8 / 2)) == 14);
}
static _Bool __chemda_432_50(){
	return ((((8 / (2 + 2)) * 3) - 1) == 5);
}
static _Bool __chemda_147_51(){
	return ((((5 + 3) * 2) - (4 / (1 + 1))) == 14);
}
static _Bool __chemda_690_52(){
	return ((5 + 5) == 10);
}
static _Bool __chemda_706_53(){
	return ((2 + (3 * 4)) == 14);
}
static _Bool __chemda_365_54(){
	return (((10 - 4) + (2 * 3)) == 12);
}
static _Bool __chemda_552_55(){
	return (((20 / 4) * 2) == 10);
}
static _Bool __chemda_480_56(){
	return (((5 + 3) * 2) == 16);
}
static _Bool __chemda_479_57(){
	return ((8 / (2 + 2)) == 2);
}
static _Bool __chemda_945_58(){
	return ((((5 + 3) * 2) - (4 / (1 + 1))) == 14);
}
static _Bool __chemda_870_59(){
	return ((((4 * 2) + 3) * (10 / 5)) == 22);
}
static _Bool __chemda_225_60(){
	return ((-3 * (-4 + 2)) == 6);
}
static _Bool __chemda_778_61(){
	return ((4 + 1.500000) == 5.500000);
}
static _Bool __chemda_784_62(){
	return ((1.500000 * (4 + 1.500000)) == 8.250000);
}
static _Bool __chemda_513_63(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int a = 5;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int b = 3;
	return ((((a + b) * 2) - (4 / (1 + 1))) == 14);
}
static _Bool __chemda_920_64(){
	return ((10 % 3) == 1);
}
static _Bool __chemda_489_65(){
	return ((((5 + 3) * 2) - (4 / (1 + 1))) == 14);
}
static _Bool __chemda_636_66(){
	return (((((2 * (3 + 4)) / 2) - (7 % 3)) + 5) == 11);
}
static _Bool __chemda_563_67(){
	return ((((10 - ((2 * (3 + 4)) / 2)) + (7 % 3)) - 5) == -1);
}
static _Bool __chemda_966_68(){
	return (((((100 / 5) / 2) - (4 / 2)) - 3) == 5);
}
static _Bool __chemda_879_69(){
	return ((((2 * 3) * 4) * 5) == 120);
}
static _Bool __chemda_369_70(){
	return (((100 / 5) / 2) == 10);
}
static _Bool __chemda_589_71(){
	return (((((1 + 2) + 3) + 4) + 5) == 15);
}
static _Bool __chemda_799_72(){
	return ((((((20 - 5) - 4) - 3) - 2) - 1) == 5);
}
static _Bool __chemda_749_73(){
	return (((10 - (-3 * (4 + 2))) + (8 / 2)) == 32);
}
static _Bool __chemda_137_74(){
	return (((10 * ((5 + (3 * 2)) - (4 / 2))) - (2 * (7 % 3))) == 88);
}
static _Bool __chemda_382_75(){
	return ((((((2 + 3) * 4) / 2) - 1) + ((((8 / 2) + 1) * 3) - 2)) == 22);
}
static _Bool __chemda_688_76(){
	return (-(2 + 3) == -5);
}
static _Bool __chemda_699_77(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 22;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* p = &i;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* j = (p + 1);
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* k = (j - 1);
	return (*k == 22);
}
static void test_bodmas(){
	test("4 + 2 / 2 == 5", __chemda_765_46);
	test("4 / 2 + 2 == 4", __chemda_317_47);
	test("3 * (4 + 2) - 8 / 2 == 5", __chemda_393_48);
	test("3 * (4 + 2) - 8 / 2 == 14", __chemda_137_49);
	test("8 / (2 + 2) * 3 - 1 == 5", __chemda_432_50);
	test("(5 + 3) * 2 - 4 / (1 + 1) == 14", __chemda_147_51);
	test("single braced value", __chemda_690_52);
	test("Simple addition and multiplication", __chemda_706_53);
	test("Addition, subtraction, multiplication", __chemda_365_54);
	test("Division and multiplication", __chemda_552_55);
	test("Brackets and multiplication", __chemda_480_56);
	test("Brackets and division", __chemda_479_57);
	test("Complex expression", __chemda_945_58);
	test("Nested brackets", __chemda_870_59);
	test("Expression with negative numbers", __chemda_225_60);
	test("double with integer addition", __chemda_778_61);
	test("Expression with decimal numbers", __chemda_784_62);
	test("Expression with variables", __chemda_513_63);
	test("Expression with modulo", __chemda_920_64);
	test("Expression with mixed operations", __chemda_489_65);
	test("Longer expression with mixed operations", __chemda_636_66);
	test("Expression with nested brackets and subtraction", __chemda_563_67);
	test("Expression with multiple division and subtraction", __chemda_966_68);
	test("Expression with consecutive multiplication", __chemda_879_69);
	test("Expression with consecutive division", __chemda_369_70);
	test("Expression with consecutive addition", __chemda_589_71);
	test("Expression with consecutive subtraction", __chemda_799_72);
	test("Expression with mixed operations and negative numbers", __chemda_749_73);
	test("Expression with complex nested operations", __chemda_137_74);
	test("Expression with repeated brackets", __chemda_382_75);
	test("Negative braced expression", __chemda_688_76);
	test("test pointer math in expressions work", __chemda_699_77);
}
static void test_floating_expr();
static _Bool __chemda_166_78(){
	return (5.500000 == 5.500000);
}
static _Bool __chemda_870_79(){
	return ((4.000000 + 1.500000) == 5.500000);
}
static _Bool __chemda_640_80(){
	return ((4 + 1.500000) == 5.500000);
}
static _Bool __chemda_421_81(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	float result = (4.000000 + 1.500000);
	return (result == 5.500000);
}
static _Bool __chemda_292_82(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	float result = (4 + 1.500000);
	return (result == 5.500000);
}
static _Bool __chemda_581_83(){
	return (5.500000 == 5.500000);
}
static _Bool __chemda_932_84(){
	return ((4.000000 + 1.500000) == 5.500000);
}
static _Bool __chemda_227_85(){
	return ((4 + 1.500000) == 5.500000);
}
static _Bool __chemda_569_86(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	double result = (4.000000 + 1.500000);
	return (result == 5.500000);
}
static _Bool __chemda_232_87(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	double result = (4 + 1.500000);
	return (result == 5.500000);
}
static void test_floating_expr(){
	test("comparing floats", __chemda_166_78);
	test("comparing float expr with fp", __chemda_870_79);
	test("comparing float with int expr with fp", __chemda_640_80);
	test("comparing float with referenced fp", __chemda_421_81);
	test("comparing float with referenced int expr", __chemda_292_82);
	test("comparing doubles", __chemda_581_83);
	test("comparing double expr with double", __chemda_932_84);
	test("comparing double with int expr with double", __chemda_227_85);
	test("comparing double with referenced double", __chemda_569_86);
	test("comparing double with referenced int expr", __chemda_232_87);
}
static int UnInheritedInterfacecheck();
struct Point;
static int Calculatorsum(int x, int y);
static int Calculatordivide(int x, int y);
static int Calculatormultiply(int x, int y);
static int PointmultiplyP(struct Point* self);
static int PointdivideP(struct Point* self);
static int Pointavg(struct Point* self);
const struct {
	int(*multiplyP)(struct Point* self);
	int(*divideP)(struct Point* self);
	int(*avg)(struct Point* self);
} CalculatorPoint = {
	PointmultiplyP,
	PointdivideP,
	Pointavg,
};
struct Point {
	int x;
	int y;
};
static int Pointcall_divide(int x, int y);
static int Pointcall_multiply_p(struct Point* self);
static int PointsumP(struct Point* self);
static int double_sum(struct Point* point);
struct Container {
	int point[2];
	_Bool is_cool;
};
struct Point;
static int Pointsummer_sum(struct Point* self);
const struct {
	int(*summer_sum)(struct Point* self);
} SummerPoint = {
	Pointsummer_sum,
};
static void test_nodes();
static int declared_below();
/** var_init defining the value **/
static int MyInt = 5;
static _Bool __chemda_271_88(){
	return (MyInt == 5);
}
static _Bool __chemda_128_89(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int x = 5;
	printf("checkout the address %p\n", &x);
	return 1;
}
static _Bool __chemda_806_90(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int x = 5;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* y = &x;
	return (*y == 5);
}
static _Bool __chemda_896_91(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j = 0;
	/** visiting var init in before **/
	for(/** var_init defining the value **/
	int i = 0;(i < 5);i += 1){
		j += 1;
	}
	return (j == 5);
}
static _Bool __chemda_958_92(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j = 0;
	while((j != 5)) {
		j += 1;
	}
	return (j == 5);
}
static _Bool __chemda_546_93(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j = 0;
	do {
		j += 1;
	} while((j != 5));
	return (j == 5);
}
static _Bool __chemda_492_94(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j = 0;
	switch(j) {
		case 0:
			return 1;
			break;
		case 1:
			return 0;
			break;
		default:
			return 0;
			break;
	}
}
static _Bool __chemda_919_95(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j = 0;
	switch(j) {
		case 0:
			return 1;
			break;
		case 1:
			return 0;
			break;
		default:
			return 0;
			break;
	}
}
static _Bool __chemda_971_96(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j = 0;
	switch(j) {
		case 0:
			j += 1;
			break;
		case 1:
			j += 1;
			break;
		default:
			j += 1;
			break;
	}
	return (j == 1);
}
static _Bool __chemda_949_97(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Point p = {.x = 5, .y = 6, };
	return ((p.x == 5) && (p.y == 6));
}
static _Bool __chemda_590_98(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Point p = {.x = 0, .y = 0, };
	return (Calculatorsum(5, 6) == 11);
}
static _Bool __chemda_928_99(){
	return (Calculatorsum(6, 6) == 12);
}
static _Bool __chemda_892_100(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Point p = {.x = 7, .y = 6, };
	return (PointsumP(&p) == 13);
}
static _Bool __chemda_219_101(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int arr[5] = {2,4,6,8,10};
	return (((arr[0] == 2) && (arr[1] == 4)) && (arr[2] == 6));
}
static _Bool __chemda_573_102(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int arr[5] = {};
	arr[0] = 2;
	arr[1] = 4;
	arr[2] = 6;
	return (((arr[0] == 2) && (arr[1] == 4)) && (arr[2] == 6));
}
static _Bool __chemda_226_103(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int arr[2][2] = {};
	arr[0][0] = 2;
	arr[0][1] = 4;
	arr[1][0] = 6;
	arr[1][1] = 8;
	return ((((arr[0][0] == 2) && (arr[0][1] == 4)) && (arr[1][0] == 6)) && (arr[1][1] == 8));
}
static _Bool __chemda_402_104(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Container ct = {.point = {10,20}, .is_cool = 1, };
	return ((ct.is_cool && (ct.point[0] == 10)) && (ct.point[1] == 20));
}
static _Bool __chemda_763_105(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int arr[2][2] = {{1,2},{3,4}};
	return ((((arr[0][0] == 1) && (arr[0][1] == 2)) && (arr[1][0] == 3)) && (arr[1][1] == 4));
}
typedef int __chalias_146_0;
static _Bool __chemda_487_106(){
	
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chalias_146_0 y = 5;
	return (y == 5);
}
static _Bool __chemda_635_107(){
	return (declared_below() == 1);
}
static _Bool __chemda_464_108(){
	return (Calculatormultiply(5, 5) == 25);
}
static _Bool __chemda_146_109(){
	return (Calculatorsum(5, 5) == 10);
}
static _Bool __chemda_373_110(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Point p = {.x = 7, .y = 6, };
	return (Calculatormultiply(5, 5) == 25);
}
static _Bool __chemda_949_111(){
	return (Calculatordivide(5, 5) == 1);
}
static _Bool __chemda_863_112(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Point p = {.x = 7, .y = 6, };
	return (Calculatordivide(10, 5) == 2);
}
static _Bool __chemda_896_113(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Point p = {.x = 7, .y = 6, };
	return (Pointcall_divide(10, 5) == 2);
}
static _Bool __chemda_198_114(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Point p = {.x = 5, .y = 5, };
	return (PointmultiplyP(&p) == 25);
}
static _Bool __chemda_768_115(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Point p = {.x = 5, .y = 5, };
	return (Pointcall_multiply_p(&p) == 25);
}
static _Bool __chemda_735_116(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Point p = {.x = 5, .y = 5, };
	return (PointdivideP(&p) == 1);
}
static _Bool __chemda_662_117(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Point p = {.x = 15, .y = 5, };
	return (Pointavg(&p) == 10);
}
static _Bool __chemda_240_118(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int x = 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* y = &x;
	y = NULL;
	return (y == NULL);
}
static _Bool __chemda_401_119(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int x = 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* y = &x;
	return (y != NULL);
}
static _Bool __chemda_965_120(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Point arr[2] = {{.x = 3, .y = 4, },{.x = 5, .y = 6, }};
	return ((((arr[0].x == 3) && (arr[0].y == 4)) && (arr[1].x == 5)) && (arr[1].y == 6));
}
static _Bool __chemda_829_121(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Point p = {.x = 10, .y = 20, };
	return (double_sum(&p) == 60);
}
static _Bool __chemda_299_122(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Point p = {.x = 10, .y = 20, };
	return (Pointsummer_sum(&p) == 30);
}
static _Bool __chemda_820_123(){
	if(1){
		return 1;
	} else {
		return 0;
	}
}
static _Bool __chemda_229_124(){
	if(1){
		return 1;
	} else {
		return 0;
	}
}
static _Bool __chemda_255_125(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 0;
	switch(i) {
		case 0:
			return 1;
			break;
		default:
			return 0;
			break;
	}
}
static _Bool __chemda_174_126(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 0;
	switch(i) {
		case 0:
			return 1;
			break;
		default:
			return 0;
			break;
	}
}
static _Bool __chemda_959_127(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool val = 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i;
	if(val){
		i = 5;
	} else {
		i = 6;
	}
	return (i == 5);
}
static _Bool __chemda_308_128(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool val = 0;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i;
	if(val){
		i = 5;
	} else {
		i = 6;
	}
	return (i == 6);
}
static _Bool __chemda_185_129(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int val = 45;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i;
	switch(val) {
		case 45:
			i = 5;
			break;
		default:
			i = 6;
			break;
	}
	return (i == 5);
}
static _Bool __chemda_151_130(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int val = 50;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i;
	switch(val) {
		case 45:
			i = 5;
			break;
		default:
			i = 6;
			break;
	}
	return (i == 6);
}
static _Bool __chemda_632_131(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 2;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		if((i < 2)){
			j = 10;
		} else {
			j = 20;
		};
	} else {
		j = 30;
	}
	return (j == 20);
}
static _Bool __chemda_546_132(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		if((i < 2)){
			j = 10;
		} else {
			j = 20;
		};
	} else {
		j = 30;
	}
	return (j == 10);
}
static _Bool __chemda_650_133(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 0;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		if((i < 2)){
			j = 10;
		} else {
			j = 20;
		};
	} else {
		j = 30;
	}
	return (j == 30);
}
static _Bool __chemda_243_134(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 2;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		if((i < 2)){
			j = 10;
		} else {
			j = 20;
		}
	} else {
		j = 30;
	}
	return (j == 20);
}
static _Bool __chemda_705_135(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		if((i < 2)){
			j = 10;
		} else {
			j = 20;
		}
	} else {
		j = 30;
	}
	return (j == 10);
}
static _Bool __chemda_521_136(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 0;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		if((i < 2)){
			j = 10;
		} else {
			j = 20;
		}
	} else {
		j = 30;
	}
	return (j == 30);
}
static _Bool __chemda_133_137(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 2;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		switch(i) {
			case 1:
				j = 10;
				break;
			case 2:
				j = 20;
				break;
			default:
				j = 40;
				break;
		};
	} else {
		j = 0;
	}
	return (j == 20);
}
static _Bool __chemda_853_138(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 0;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		switch(i) {
			case 1:
				j = 10;
				break;
			case 2:
				j = 20;
				break;
			default:
				j = 40;
				break;
		};
	} else {
		j = 50;
	}
	return (j == 50);
}
static _Bool __chemda_846_139(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		switch(i) {
			case 1:
				j = 10;
				break;
			case 2:
				j = 20;
				break;
			default:
				j = 40;
				break;
		};
	} else {
		j = 0;
	}
	return (j == 10);
}
static _Bool __chemda_830_140(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 5;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		switch(i) {
			case 1:
				j = 10;
				break;
			case 2:
				j = 20;
				break;
			default:
				j = 40;
				break;
		};
	} else {
		j = 0;
	}
	return (j == 40);
}
static _Bool __chemda_966_141(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 2;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		switch(i) {
			case 1:
				j = 10;
				break;
			case 2:
				j = 20;
				break;
			default:
				j = 40;
				break;
		};
	} else {
		j = 0;
	}
	return (j == 20);
}
static _Bool __chemda_838_142(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 0;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		switch(i) {
			case 1:
				j = 10;
				break;
			case 2:
				j = 20;
				break;
			default:
				j = 40;
				break;
		}
	} else {
		j = 50;
	}
	return (j == 50);
}
static _Bool __chemda_899_143(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		switch(i) {
			case 1:
				j = 10;
				break;
			case 2:
				j = 20;
				break;
			default:
				j = 40;
				break;
		}
	} else {
		j = 0;
	}
	return (j == 10);
}
static _Bool __chemda_156_144(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 5;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		switch(i) {
			case 1:
				j = 10;
				break;
			case 2:
				j = 20;
				break;
			default:
				j = 40;
				break;
		}
	} else {
		j = 0;
	}
	return (j == 40);
}
static _Bool __chemda_940_145(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 5;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	if((i > 0)){
		i = 2;
		switch(i) {
			case 1:
				j = 10;
				break;
			case 2:
				j = 20;
				break;
			default:
				j = 40;
				break;
		}
	} else {
		j = 0;
	}
	return (j == 20);
}
static _Bool __chemda_505_146(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 0;
	/** visiting var init in before **/
	for(/** var_init defining the value **/
	int j = 0;(j < 10);j += 1){
		/** visiting var init in before **/
		for(/** var_init defining the value **/
		int x = 0;(x < 5);x += 1){
			if((x == 3)){
				break;
			}
			i += 1;
		}
		if((j == 7)){
			break;
		}
	}
	return (i == 24);
}
static _Bool __chemda_267_147(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 0;
	while(1){
		if((i == 5)){
			break;
		}
		i += 1;
	}
	return (i == 5);
}
static _Bool __chemda_687_148(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 0;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int j;
	while(1){
		if((i == 5)){
			j = i;
			break;
		}
		i += 1;
	}
	return ((j == i) && (i == 5));
}
static int Calculatordivide(int x, int y){
	return (x / y);
}
static int Calculatormultiply(int x, int y){
	return (x * y);
}
static int Calculatorsum(int x, int y){
	return (x + y);
}
static int Pointcall_divide(int x, int y){
	return Calculatordivide(x, y);;
}
static int Pointcall_multiply_p(struct Point* self){
	return PointmultiplyP(self);;
}
static int PointsumP(struct Point* self){
	return (self->x + self->y);
}
static int PointmultiplyP(struct Point* self){
	return (self->x * self->y);
}
static int double_sum(struct Point* point){
	return (2 * (point->x + point->y));
}
static int PointdivideP(struct Point* self){
	return (self->x / self->y);
}
static int Pointavg(struct Point* self){
	return (PointsumP(self) / 2);
}
static int Pointsummer_sum(struct Point* self){
	return (self->x + self->y);
}
static void test_nodes(){
	test("global constant int", __chemda_271_88);
	test("address of works", __chemda_128_89);
	test("dereferencing works", __chemda_806_90);
	test("for loop", __chemda_896_91);
	test("while loop", __chemda_958_92);
	test("do while loop", __chemda_546_93);
	test("switch statement", __chemda_492_94);
	test("switch statement case keyword is optional", __chemda_919_95);
	test("switch doesn't fallthrough by default", __chemda_971_96);
	test("struct value initialization", __chemda_949_97);
	test("struct functions without self ref", __chemda_590_98);
	test("direct calls to struct functions", __chemda_928_99);
	test("struct functions with self ref", __chemda_892_100);
	test("test array", __chemda_219_101);
	test("test uninitialized array", __chemda_573_102);
	test("test multidimensional uninitialized array", __chemda_226_103);
	test("array inside a struct", __chemda_402_104);
	test("test multi dimensional array", __chemda_763_105);
	test("typealias statement", __chemda_487_106);
	test("can call functions declared below call", __chemda_635_107);
	test("can call interface defined functions directly", __chemda_464_108);
	test("can call interface declared functions directly", __chemda_146_109);
	test("call interface method from overridden struct value", __chemda_373_110);
	test("can call implemented impl functions directly", __chemda_949_111);
	test("can call implemented impl functions using struct value", __chemda_863_112);
	test("functions inside struct can call functions inherited directly", __chemda_896_113);
	test("overridden interface struct functions implemented inside struct with self ref", __chemda_198_114);
	test("overridden interface struct functions implemented inside struct with self ref", __chemda_768_115);
	test("overridden interface struct functions implemented using impl keyword with self ref", __chemda_735_116);
	test("impl block can call functions in the struct", __chemda_662_117);
	test("supports null value - 1", __chemda_240_118);
	test("supports null value - 2", __chemda_401_119);
	test("can store struct in an array", __chemda_965_120);
	test("extension functions work", __chemda_829_121);
	test("functions of interface implemented outside struct", __chemda_299_122);
	test("single statement if statement works - 1", __chemda_820_123);
	test("single statement if statement works - 2", __chemda_229_124);
	test("switch statement can have single statement instead of block - 1", __chemda_255_125);
	test("switch statement can have single statement instead of block - 2", __chemda_174_126);
	test("if statement can be used as a value - 1", __chemda_959_127);
	test("if statement can be used as a value - 1", __chemda_308_128);
	test("switch statement can be used as a value - 1", __chemda_185_129);
	test("switch statement can be used as a value - 2", __chemda_151_130);
	test("nested if in if value statements - 1", __chemda_632_131);
	test("nested if in if value statements - 2", __chemda_546_132);
	test("nested if in if value statements - 3", __chemda_650_133);
	test("nested if in if braced value statements - 1", __chemda_243_134);
	test("nested if in if braced value statements - 2", __chemda_705_135);
	test("nested if in if braced value statements - 3", __chemda_521_136);
	test("nested switch in if value statements - 1", __chemda_133_137);
	test("nested switch in if value statements - 2", __chemda_853_138);
	test("nested switch in if value statements - 3", __chemda_846_139);
	test("nested switch in if value statements - 4", __chemda_830_140);
	test("nested switch in braced if value statements - 1", __chemda_966_141);
	test("nested switch in braced if value statements - 2", __chemda_838_142);
	test("nested switch in braced if value statements - 3", __chemda_899_143);
	test("nested switch in braced if value statements - 4", __chemda_156_144);
	test("nested switch in braced if value statement with additional statement", __chemda_940_145);
	test("loop continue and break work as needed", __chemda_505_146);
	test("loop block works", __chemda_267_147);
	test("loop block works as a value", __chemda_687_148);
}
static int declared_below(){
	return 1;
}
static void test_var_init();
/** var_init defining the value **/
static int glob_ct_const = (100 + 300);
/** var_init defining the value **/
static int glob_const = (300 + 500);
static _Bool __chemda_909_149(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int x = 5;
	return (x == 5);
}
static _Bool __chemda_652_150(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int x = 5;
	x = 6;
	return (x == 6);
}
static _Bool __chemda_612_151(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int x;
	x = 6;
	return (x == 6);
}
static _Bool __chemda_671_152(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int x = 5;
	return (x == 5);
}
static _Bool __chemda_907_153(){
	return (glob_ct_const == 400);
}
static _Bool __chemda_927_154(){
	return (glob_const == 800);
}
static _Bool __chemda_535_155(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int something = (1200 + 400);
	return (something == 1600);
}
static void test_var_init(){
	test("can initialize normal variables", __chemda_909_149);
	test("can modify variables", __chemda_652_150);
	test("can assign to a non initialized variable", __chemda_612_151);
	test("can initialize a typed variable", __chemda_671_152);
	test("global comptime constants work", __chemda_907_153);
	test("global constants work", __chemda_927_154);
	test("local constants work as well", __chemda_535_155);
}
struct Animal {
	long long a;
	long long b;
};
static long long Animalsum_animal(struct Animal* self);
static long long animal_sum(struct Animal* a);
struct WalkingAnimal {
	struct Animal Animal;
	long long speed;
};
static long long WalkingAnimalindirect_animal_sum(struct WalkingAnimal* self);
static long long WalkingAnimalget_speed(struct WalkingAnimal* self);
struct Dog {
	struct WalkingAnimal WalkingAnimal;
	long long c;
	long long d;
};
static long long Dogindirect_animal_sum_2(struct Dog* self);
static long long Dogsum_dog(struct Dog* self);
static long long get_dog_sum(struct Dog* d);
static void test_single_inheritance();
static void test_inheritance();
static _Bool __chemda_281_156(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Animal a = {.a = 12, .b = 13, };
	return (animal_sum(&a) == 25);
}
static _Bool __chemda_761_157(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Dog b = {.WalkingAnimal = {.Animal = {.a = 30, .b = 40, }, .speed = 90, }, .c = 40, .d = 40, };
	return ((animal_sum(&b) == 70) && (get_dog_sum(&b) == 80));
}
static _Bool __chemda_235_158(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Dog b = {.WalkingAnimal = {.Animal = {.a = 30, .b = 40, }, .speed = 90, }, .c = 40, .d = 20, };
	return (((b.WalkingAnimal.Animal.a + b.d) == 50) && ((b.WalkingAnimal.Animal.a + b.WalkingAnimal.Animal.b) == 70));
}
static _Bool __chemda_306_159(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Dog b = {.WalkingAnimal = {.Animal = {.a = 30, .b = 40, }, .speed = 90, }, .c = 40, .d = 20, };
	return (b.WalkingAnimal.speed == 90);
}
static _Bool __chemda_725_160(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Dog b = {.WalkingAnimal = {.Animal = {.a = 11, .b = 11, }, .speed = 90, }, .c = 40, .d = 20, };
	return (Animalsum_animal(&b) == 22);
}
static _Bool __chemda_273_161(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Dog b = {.WalkingAnimal = {.Animal = {.a = 12, .b = 11, }, .speed = 32, }, .c = 40, .d = 20, };
	return ((WalkingAnimalindirect_animal_sum(&b) == 23) && (Dogindirect_animal_sum_2(&b) == 23));
}
static _Bool __chemda_105_162(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Dog b = {.WalkingAnimal = {.Animal = {.a = 11, .b = 11, }, .speed = 32, }, .c = 40, .d = 20, };
	return (WalkingAnimalget_speed(&b) == 32);
}
static _Bool __chemda_924_163(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Dog b = {.WalkingAnimal = {.Animal = {.a = 11, .b = 11, }, .speed = 32, }, .c = 15, .d = 12, };
	return (Dogsum_dog(&b) == 27);
}
static long long Animalsum_animal(struct Animal* self){
	return (self->a + self->b);
}
static long long animal_sum(struct Animal* a){
	return (a->a + a->b);
}
static long long WalkingAnimalindirect_animal_sum(struct WalkingAnimal* self){
	return (self->Animal.a + self->Animal.b);
}
static long long WalkingAnimalget_speed(struct WalkingAnimal* self){
	return self->speed;
}
static long long Dogindirect_animal_sum_2(struct Dog* self){
	return (self->WalkingAnimal.Animal.a + self->WalkingAnimal.Animal.b);
}
static long long Dogsum_dog(struct Dog* self){
	return (self->c + self->d);
}
static long long get_dog_sum(struct Dog* d){
	return (d->c + d->d);
}
static void test_single_inheritance(){
	test("passing base struct as a base struct pointer", __chemda_281_156);
	test("passing a derived struct as a base class pointer", __chemda_761_157);
	test("can access base struct members from derived directly", __chemda_235_158);
	test("can access middle struct members from derived", __chemda_306_159);
	test("base struct function on derived succeeds", __chemda_725_160);
	test("can successfully access base struct members from derived struct", __chemda_273_161);
	test("middle struct function on derived succeeds", __chemda_105_162);
	test("derived struct functions on derived succeeds", __chemda_924_163);
}
static void test_inheritance(){
	test_single_inheritance();
}
static int sum_this_please(int a, int b);
struct Pair {
	int a;
	int b;
};
static void Pairpair(struct Pair* __chx_struct_ret_param_xx, int c);
static int Pairget_pair_sum(struct Pair* self);
static int Paircheck_direct_call(struct Pair* self);
static int Paircheck_indirect_call(struct Pair* self);
static int Paircheck_outside_call(struct Pair* self);
struct IntPair {
	struct Pair pair;
};
static void create_pair(struct Pair* __chx_struct_ret_param_xx);
static void create_pair_as_variable(struct Pair* __chx_struct_ret_param_xx);
struct DeeplyNested3 {
	int value;
};
struct DeeplyNested2 {
	struct DeeplyNested3 nested;
};
struct DeeplyNested1 {
	struct DeeplyNested2 nested;
};
struct DeeplyNested {
	struct DeeplyNested1 nested;
};
struct PointerStr {
	struct DeeplyNested3* value;
};
static void give_pair(struct Pair* __chx_struct_ret_param_xx);
static _Bool test_pair(struct Pair* p);
struct ImpPair {
	int data;
};
static void ImpPairmakexv(struct ImpPair* __chx_struct_ret_param_xx, int d);
static _Bool check_implicit(struct ImpPair* p);
struct ImpContainer {
	struct ImpPair imp;
};
static void give_implicit_return(struct ImpPair* __chx_struct_ret_param_xx);
static void give_explicit_return(struct ImpPair* __chx_struct_ret_param_xx);
static void test_structs();
static _Bool __chemda_276_164(){
	/** visiting var init in before **/
	struct Pair pair;
	/** function call being taken out that returns struct **/
	create_pair(&pair);
	/** var_init defining the value **/
	
	return ((pair.a == 33) && (pair.b == 55));
}
static _Bool __chemda_740_165(){
	/** visiting var init in before **/
	struct Pair pair;
	/** function call being taken out that returns struct **/
	create_pair_as_variable(&pair);
	/** var_init defining the value **/
	
	return ((pair.a == 44) && (pair.b == 66));
}
static _Bool __chemda_640_166(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct DeeplyNested n = {.nested = {.nested = {.nested = {.value = 55, }, }, }, };
	return (n.nested.nested.nested.value == 55);
}
static _Bool __chemda_205_167(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct DeeplyNested3 nested = {.value = 55, };
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct PointerStr str = {.value = &nested, };
	return (str.value->value == 55);
}
static _Bool __chemda_988_168(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Pair p = {.a = 10, .b = 10, };
	return (Pairget_pair_sum(&p) == 20);
}
static _Bool __chemda_531_169(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Pair p = {.a = 10, .b = 10, };
	return (Paircheck_direct_call(&p) == 20);
}
static _Bool __chemda_973_170(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Pair p = {.a = 10, .b = 10, };
	return (Paircheck_indirect_call(&p) == 20);
}
static _Bool __chemda_198_171(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Pair p = {.a = 10, .b = 10, };
	return (Paircheck_outside_call(&p) == 20);
}
static _Bool __chemda_598_172(){
	/** visiting var init in before **/
	struct Pair p;
	/** function call being taken out that returns struct **/
	Pairpair(&p, 4);
	/** var_init defining the value **/
	
	return ((p.a == 2) && (p.b == 2));
}
static _Bool __chemda_877_173(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Pair p = {.a = 99, .b = 98, };
	return test_pair(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/p);;
}
static _Bool __chemda_566_174(){
	/** visiting var init in before **/
	struct Pair p;
	/** function call being taken out that returns struct **/
	give_pair(&p);
	/** var_init defining the value **/
	
	return test_pair(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/p);;
}
static _Bool __chemda_856_175(){
	struct Pair __chx__lv__4 = {.a = 99, .b = 98, };
	return test_pair(&__chx__lv__4);;
}
static _Bool __chemda_491_176(){
	struct Pair __chx__lv__5;
	/** function call being taken out that returns struct **/
	give_pair(&__chx__lv__5);
	return test_pair(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__5);;
}
static _Bool __chemda_897_177(){
	struct ImpPair __chx__lv__6;
	/** function call being taken out that returns struct **/
	ImpPairmakexv(&__chx__lv__6, 55);
	return check_implicit(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__6);;
}
static _Bool __chemda_344_178(){
	struct ImpPair __chx__lv__7;
	/** function call being taken out that returns struct **/
	ImpPairmakexv(&__chx__lv__7, 55);
	return check_implicit(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__7);;
}
static _Bool __chemda_464_179(){
	/** visiting var init in before **/
	struct ImpPair __chx__lv__8;
	/** function call being taken out that returns struct **/
	ImpPairmakexv(&__chx__lv__8, 55);
	/** var_init defining the value **/
	struct ImpContainer p = {.imp = __chx__lv__8, };
	return (p.imp.data == 55);
}
static _Bool __chemda_627_180(){
	/** visiting var init in before **/
	struct ImpPair __chx__lv__9;
	/** function call being taken out that returns struct **/
	ImpPairmakexv(&__chx__lv__9, 55);
	/** var_init defining the value **/
	struct ImpContainer p = {.imp = __chx__lv__9, };
	return (p.imp.data == 55);
}
static _Bool __chemda_465_181(){
	/** visiting var init in before **/
	struct ImpPair __chx__lv__10;
	/** function call being taken out that returns struct **/
	ImpPairmakexv(&__chx__lv__10, 55);
	/** var_init defining the value **/
	struct ImpPair arr[1] = {__chx__lv__10};
	return (arr[0].data == 55);
}
static _Bool __chemda_656_182(){
	/** visiting var init in before **/
	struct ImpPair __chx__lv__11;
	/** function call being taken out that returns struct **/
	ImpPairmakexv(&__chx__lv__11, 55);
	/** var_init defining the value **/
	struct ImpPair arr[1] = {__chx__lv__11};
	return (arr[0].data == 55);
}
static _Bool __chemda_690_183(){
	/** visiting var init in before **/
	struct ImpPair p;
	/** function call being taken out that returns struct **/
	give_implicit_return(&p);
	/** var_init defining the value **/
	
	return (p.data == 65);
}
static _Bool __chemda_261_184(){
	/** visiting var init in before **/
	struct ImpPair p;
	/** function call being taken out that returns struct **/
	give_explicit_return(&p);
	/** var_init defining the value **/
	
	return (p.data == 65);
}
static _Bool __chemda_946_185(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct IntPair p = {.pair = {.a = 14, .b = 12, }, };
	return (Pairget_pair_sum(&p.pair) == 26);
}
static int sum_this_please(int a, int b){
	return (a + b);
}
static void Pairpair(struct Pair* __chx_struct_ret_param_xx, int c){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Pair* this = ((struct Pair*) __chx_struct_ret_param_xx);
	/** visiting var init in before **/
	/** var_init defining the value **/
	int r = (c / 2);
	this->a = r;
	this->b = r;
}
static int Pairget_pair_sum(struct Pair* self){
	return (self->a + self->b);
}
static int Paircheck_direct_call(struct Pair* self){
	return Pairget_pair_sum(self);;
}
static int Paircheck_indirect_call(struct Pair* self){
	return Pairget_pair_sum(self);;
}
static int Paircheck_outside_call(struct Pair* self){
	return sum_this_please(self->a, self->b);;
}
static void create_pair(struct Pair* __chx_struct_ret_param_xx){
	__chx_struct_ret_param_xx->a = 33;
	__chx_struct_ret_param_xx->b = 55;
}
static void create_pair_as_variable(struct Pair* __chx_struct_ret_param_xx){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Pair p = {.a = 44, .b = 66, };
	*__chx_struct_ret_param_xx = p;
}
static void give_pair(struct Pair* __chx_struct_ret_param_xx){
	__chx_struct_ret_param_xx->a = 99;
	__chx_struct_ret_param_xx->b = 98;
}
static _Bool test_pair(struct Pair* p){
	return ((p->a == 99) && (p->b == 98));
}
static void ImpPairmakexv(struct ImpPair* __chx_struct_ret_param_xx, int d){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct ImpPair* this = ((struct ImpPair*) __chx_struct_ret_param_xx);
	this->data = d;
}
static _Bool check_implicit(struct ImpPair* p){
	return (p->data == 55);
}
static void give_implicit_return(struct ImpPair* __chx_struct_ret_param_xx){
	struct ImpPair __chx__lv__14;
	/** function call being taken out that returns struct **/
	ImpPairmakexv(&__chx__lv__14, 65);
	*__chx_struct_ret_param_xx = __chx__lv__14;;
}
static void give_explicit_return(struct ImpPair* __chx_struct_ret_param_xx){
	struct ImpPair __chx__lv__15;
	/** function call being taken out that returns struct **/
	ImpPairmakexv(&__chx__lv__15, 65);
	*__chx_struct_ret_param_xx = __chx__lv__15;;
}
static void test_structs(){
	test("can return a newly created struct", __chemda_276_164);
	test("can return a newly created struct that is referenced", __chemda_740_165);
	test("deeply nested struct works", __chemda_640_166);
	test("pointer to struct inside a struct allows access", __chemda_205_167);
	test("struct members can be accessed without using self. or this.", __chemda_988_168);
	test("struct functions can be accessed using self. or this.", __chemda_531_169);
	test("struct functions can be accessed without using self. or this.", __chemda_973_170);
	test("functions present outside struct can be called inside struct", __chemda_198_171);
	test("test struct constructor can be called", __chemda_598_172);
	test("test direct struct values can be passed as args", __chemda_877_173);
	test("test const function calls returning struct values can be passed as args", __chemda_566_174);
	test("test const struct values can be passed as args", __chemda_856_175);
	test("test that function calls that return struct, can be passed as args", __chemda_491_176);
	test("implicit constructors work in function parameters - 1", __chemda_897_177);
	test("implicit constructors work in function parameters - 2", __chemda_344_178);
	test("implicit constructors inside structs work - 1", __chemda_464_179);
	test("implicit constructors inside structs work - 2", __chemda_627_180);
	test("implicit constructors inside array values work - 1", __chemda_465_181);
	test("implicit constructors inside array values work - 2", __chemda_656_182);
	test("implicit constructors in return work - 1", __chemda_690_183);
	test("implicit constructors in return work - 2", __chemda_261_184);
	test("contained pair can be initialized properly", __chemda_946_185);
	test_inheritance();
}
struct EnumThing {
	int value;
};
static _Bool take_my_enum_dawg(int numnum);
static _Bool take_my_enum_again_dawg(int numnum);
static int take_my_thing();
static void test_enum();
static _Bool __chemda_324_186(){
	return ((0 == 0) && (1 == 1));
}
static _Bool __chemda_362_187(){
	return (((0 == 0) && (1 == 1)) && (0 != 1));
}
static _Bool __chemda_383_188(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int x = 0;
	return ((x == 0) && (x != 1));
}
static _Bool __chemda_199_189(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int x;
	x = 1;
	return ((x == 1) && (x != 0));
}
static _Bool __chemda_575_190(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct EnumThing p = {.value = 0, };
	return ((p.value == 0) && (p.value != 1));
}
static _Bool __chemda_154_191(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct EnumThing p = {.value = 1, };
	return ((p.value == 1) && (p.value != 0));
}
static _Bool __chemda_864_192(){
	return take_my_enum_dawg(0);;
}
static _Bool __chemda_780_193(){
	return take_my_enum_again_dawg(1);;
}
static _Bool __chemda_199_194(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int a = 0;
	return take_my_enum_dawg(a);;
}
static _Bool __chemda_974_195(){
	return (take_my_thing() == 1);
}
static _Bool take_my_enum_dawg(int numnum){
	return (numnum == 0);
}
static _Bool take_my_enum_again_dawg(int numnum){
	return (numnum == 1);
}
static int take_my_thing(){
	return 1;
}
static void test_enum(){
	test("enum index works", __chemda_324_186);
	test("enum comparison works", __chemda_362_187);
	test("enums can be initialize variables", __chemda_383_188);
	test("enums can be stored in variables", __chemda_199_189);
	test("check enums can be stored in structs", __chemda_575_190);
	test("check enums can be stored in structs - 2", __chemda_154_191);
	test("check enums can be passed to functions", __chemda_864_192);
	test("check enums can be passed to functions - 2", __chemda_780_193);
	test("check enums can be passed to functions - 3", __chemda_199_194);
	test("test enums can be returned from functions", __chemda_974_195);
}
static long long implicit_cast_ret_test();
static int implicit_cast_ret_test_2();
static void test_numbers();
static _Bool __chemda_119_196(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned int i = 33;
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned int w = 33;
	return (i == w);
}
static _Bool __chemda_816_197(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	short i = 22;
	/** visiting var init in before **/
	/** var_init defining the value **/
	short w = 22;
	return (i == w);
}
static _Bool __chemda_530_198(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned short i = 44;
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned short w = 44;
	return (i == w);
}
static _Bool __chemda_552_199(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	long long i = 777;
	/** visiting var init in before **/
	/** var_init defining the value **/
	long long w = 777;
	return (i == w);
}
static _Bool __chemda_735_200(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned long i = 777;
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned long w = 777;
	return (i == w);
}
static _Bool __chemda_151_201(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	long long i = 888;
	/** visiting var init in before **/
	/** var_init defining the value **/
	long long w = 888;
	return (i == w);
}
static _Bool __chemda_941_202(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned long long i = 999;
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned long long w = 999;
	return (i == w);
}
static _Bool __chemda_867_203(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned int i = 1;
	return (i == 1);
}
static _Bool __chemda_327_204(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	short i = 1;
	return (i == 1);
}
static _Bool __chemda_827_205(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	short i = 1;
	return (i == 1);
}
static _Bool __chemda_567_206(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned short i = 1;
	return (i == 1);
}
static _Bool __chemda_738_207(){
	return (123 == 123);
}
static _Bool __chemda_973_208(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	short i = 44;
	i = 33;
	return (i == 33);
}
static _Bool __chemda_149_209(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 10;
	i = 2147483647;
	return (i == 2147483647);
}
static _Bool __chemda_386_210(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	long long i = 10;
	i = 2147483647;
	return (i == 2147483647);
}
static _Bool __chemda_869_211(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	long long i = 10;
	i = 9223372036854775807;
	return (i == 9223372036854775807);
}
static _Bool __chemda_690_212(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	float i = 10.000000;
	return (i == 10);
}
static _Bool __chemda_447_213(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	double i = 10.000000;
	return (i == 10);
}
static _Bool __chemda_557_214(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	short i = 5;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int w = 5;
	return (i == w);
}
static _Bool __chemda_184_215(){
	return (implicit_cast_ret_test() == 55);
}
static _Bool __chemda_896_216(){
	return (implicit_cast_ret_test_2() == 55);
}
static long long implicit_cast_ret_test(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = ((int) 55);
	return i;
}
static int implicit_cast_ret_test_2(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	long long i = ((long long) 55);
	return i;
}
static void test_numbers(){
	test("test unsigned int works", __chemda_119_196);
	test("test short works", __chemda_816_197);
	test("test unsigned short works", __chemda_530_198);
	test("test long works", __chemda_552_199);
	test("test unsigned long works", __chemda_735_200);
	test("test big integer works", __chemda_151_201);
	test("test unsigned big integer works", __chemda_941_202);
	test("test unsigned int demotes int32 to uint", __chemda_867_203);
	test("test short comparison demotes int32 to short", __chemda_327_204);
	test("test short comparison demotes int32 to short", __chemda_827_205);
	test("test ushort comparison demotes int32 to ushort", __chemda_567_206);
	test("test constant long is demoted to int32 for comparison with int32", __chemda_738_207);
	test("test short can be assigned", __chemda_973_208);
	test("test int can be assigned int max", __chemda_149_209);
	test("test long can be assigned long max", __chemda_386_210);
	test("test bigint can be assigned bigint max", __chemda_869_211);
	test("can promote int constants to float when compared with float variable", __chemda_690_212);
	test("can promote int constants to double when compared with double variable", __chemda_447_213);
	test("can extend int n type to compare with a different bit type", __chemda_557_214);
	test("implicit casting at return from lesser to greater int n type", __chemda_184_215);
	test("implicit casting at return from greater to lesser int n type", __chemda_896_216);
}
struct string {
	union {
		struct {
			char* data;
			size_t length;
		} constant;
		struct {
			char* data;
			size_t length;
			size_t capacity;
		} heap;
		struct {
			char buffer[16];
			unsigned char length;
		} sso;
	} storage;
	char state;
};
static void stringconstructor(struct string* __chx_struct_ret_param_xx, char* value, size_t length);
static void stringmake_no_len(struct string* __chx_struct_ret_param_xx, char* value);
static size_t stringsize(struct string* self);
static _Bool stringequals(struct string* self, struct string* other);
static void stringmove_const_to_buffer(struct string* self);
static void stringmove_data_to_heap(struct string* self, char* from_data, size_t length, size_t capacity);
static void stringresize(struct string* self, size_t new_capacity);
static void stringensure_mut(struct string* self, size_t length);
static void stringset(struct string* self, size_t index, char value);
static char stringget(struct string* self, size_t index);
static void stringappend_with_len(struct string* self, char* value, size_t len);
static void stringappend_char_ptr(struct string* self, char* value);
static void stringappend_str(struct string* self, struct string* value);
static void stringcopy(struct string* __chx_struct_ret_param_xx, struct string* self);
static void stringsubstring(struct string* __chx_struct_ret_param_xx, struct string* self, size_t start, size_t end);
static void stringappend(struct string* self, char value);
static size_t stringcapacity(struct string* self);
static char* stringdata(struct string* self);
static void stringdelete(struct string* self);
static void stringconstructor(struct string* __chx_struct_ret_param_xx, char* value, size_t length){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct string* this = ((struct string*) __chx_struct_ret_param_xx);
	this->storage.constant.data = value;
	this->storage.constant.length = length;
	this->state = '0';
}
static void stringmake_no_len(struct string* __chx_struct_ret_param_xx, char* value){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct string* this = ((struct string*) __chx_struct_ret_param_xx);
	this->storage.constant.data = value;
	this->storage.constant.length = strlen(value);;
	this->state = '0';
}
static size_t stringsize(struct string* self){
	switch(self->state) {
		case '0':
			return self->storage.constant.length;
			break;
		case '1':
			return self->storage.sso.length;
			break;
		case '2':
			return self->storage.heap.length;
			break;
		default:
			return 0;
			break;
	}
}
static _Bool stringequals(struct string* self, struct string* other){
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned long long self_size = stringsize(self);;
	return ((self_size == stringsize(other)) && (memcmp(stringdata(self), stringdata(other), self_size) == 0));
}
static void stringmove_const_to_buffer(struct string* self){
	/** visiting var init in before **/
	/** var_init defining the value **/
	char* data = self->storage.constant.data;
	/** visiting var init in before **/
	/** var_init defining the value **/
	size_t length = self->storage.constant.length;
	if((data != NULL)){
		/** visiting var init in before **/
		for(/** var_init defining the value **/
		int i = 0;(i < length);i += 1){
			self->storage.sso.buffer[i] = data[i];
		}
	}
	self->storage.sso.buffer[length] = '\0';
	self->storage.sso.length = length;
	self->state = '1';
}
static void stringmove_data_to_heap(struct string* self, char* from_data, size_t length, size_t capacity){
	/** visiting var init in before **/
	/** var_init defining the value **/
	char* data = ((char*) malloc(capacity));
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 0;
	while((i < length)) {
		data[i] = from_data[i];
		i += 1;
	}
	data[i] = '\0';
	self->storage.heap.data = data;
	self->storage.heap.length = length;
	self->storage.heap.capacity = capacity;
	self->state = '2';
}
static void stringresize(struct string* self, size_t new_capacity){
	/** visiting var init in before **/
	/** var_init defining the value **/
	char* data = ((char*) realloc(self->storage.heap.data, new_capacity));
	data[self->storage.heap.length] = '\0';
	self->storage.heap.data = data;
	self->storage.heap.capacity = new_capacity;
}
static void stringensure_mut(struct string* self, size_t length){
	if((((self->state == '0') || (self->state == '1')) && (length < 16))){
		if((self->state == '0')){
			stringmove_const_to_buffer(self);
		}
	} else {
		if((self->state == '0')){
			stringmove_data_to_heap(self,self->storage.constant.data, self->storage.constant.length, length);
		}else if((self->state == '1')){
			stringmove_data_to_heap(self,&self->storage.sso.buffer[0], self->storage.sso.length, length);
		}else if((self->storage.heap.capacity <= length)){
			stringresize(self,length);
		}
	}
}
static void stringset(struct string* self, size_t index, char value){
	switch(self->state) {
		case '0':
			stringmove_const_to_buffer(self);
			self->storage.sso.buffer[index] = value;
			break;
		case '1':
			self->storage.sso.buffer[index] = value;
			break;
		case '2':
			self->storage.heap.data[index] = value;
			break;
	}
}
static char stringget(struct string* self, size_t index){
	switch(self->state) {
		case '0':
			return self->storage.constant.data[index];
			break;
		case '1':
			return self->storage.sso.buffer[index];
			break;
		case '2':
			return self->storage.heap.data[index];
			break;
		default:
			return '\0';
			break;
	}
}
static void stringappend_with_len(struct string* self, char* value, size_t len){
	stringensure_mut(self,((stringsize(self) + len) + 1));
	/** visiting var init in before **/
	/** var_init defining the value **/
	size_t i = 0;
	while((i < len)) {
		stringappend(self,value[i]);
		i += 1;
	}
}
static void stringappend_char_ptr(struct string* self, char* value){
	stringappend_with_len(self,value, strlen(value));
}
static void stringappend_str(struct string* self, struct string* value){
	stringappend_with_len(self,stringdata(value), stringsize(value));
}
static void stringcopy(struct string* __chx_struct_ret_param_xx, struct string* self){
	struct string __chx__lv__0;
	/** function call being taken out that returns struct **/
	stringsubstring(&__chx__lv__0, self, 0, stringsize(self));
	*__chx_struct_ret_param_xx = __chx__lv__0;;
}
static void stringsubstring(struct string* __chx_struct_ret_param_xx, struct string* self, size_t start, size_t end){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct string s;
	/** visiting var init in before **/
	/** var_init defining the value **/
	size_t actual_len = (end - start);
	if((actual_len < 16)){
		s.state = '1';
		s.storage.sso.length = actual_len;
		/** visiting var init in before **/
		/** var_init defining the value **/
		char* d = stringdata(self);;
		/** visiting var init in before **/
		for(/** var_init defining the value **/
		int i = 0;(i < actual_len);i += 1){
			s.storage.sso.buffer[i] = d[(start + i)];
		}
		s.storage.sso.buffer[actual_len] = '\0';
	} else {
		s.state = '2';
		/** visiting var init in before **/
		/** var_init defining the value **/
		size_t new_cap = (actual_len * 2);
		/** visiting var init in before **/
		/** var_init defining the value **/
		char* new_heap = ((char*) malloc(new_cap));
		/** visiting var init in before **/
		/** var_init defining the value **/
		char* d = stringdata(self);;
		/** visiting var init in before **/
		for(/** var_init defining the value **/
		int i = 0;(i < actual_len);i += 1){
			new_heap[i] = d[(start + i)];
		}
		s.storage.heap.data = new_heap;
		s.storage.heap.data[actual_len] = '\0';
		s.storage.heap.length = actual_len;
		s.storage.heap.capacity = new_cap;
	}
	*__chx_struct_ret_param_xx = s;
}
static void stringappend(struct string* self, char value){
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned long long length = stringsize(self);;
	if((((self->state == '0') || (self->state == '1')) && (length < 15))){
		if((self->state == '0')){
			stringmove_const_to_buffer(self);
		}
		self->storage.sso.buffer[length] = value;
		self->storage.sso.buffer[(length + 1)] = '\0';
		self->storage.sso.length = (length + 1);
	} else {
		if((self->state == '0')){
			stringmove_data_to_heap(self,self->storage.constant.data, length, (length * 2));
		}else if((self->state == '1')){
			stringmove_data_to_heap(self,&self->storage.sso.buffer[0], length, (length * 2));
		}else if((self->storage.heap.capacity <= (length + 2))){
			stringresize(self,(self->storage.heap.capacity * 2));
		}
		self->storage.heap.data[length] = value;
		self->storage.heap.data[(length + 1)] = '\0';
		self->storage.heap.length = (length + 1);
	}
}
static size_t stringcapacity(struct string* self){
	switch(self->state) {
		case '0':
			return self->storage.constant.length;
			break;
		case '1':
			return 16;
			break;
		case '2':
			return self->storage.heap.capacity;
			break;
		default:
			return 0;
			break;
	}
}
static char* stringdata(struct string* self){
	switch(self->state) {
		case '0':
			return self->storage.constant.data;
			break;
		case '1':
			return &self->storage.sso.buffer[0];
			break;
		case '2':
			return self->storage.heap.data;
			break;
		default:
			return NULL;
			break;
	}
}
static void stringdelete(struct string* self){
	if((self->state == '2')){
		free(self->storage.heap.data);
	}
	__chx__dstctr_clnup_blk__:{
	}
}
struct Str {
	char* value;
};
static void test_strings();
static _Bool __chemda_997_217(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	char* x = "true";
	return ((((x[0] == 't') && (x[1] == 'r')) && (x[2] == 'u')) && (x[3] == 'e'));
}
static _Bool __chemda_730_218(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Str str = {.value = "false", };
	return (((str.value[0] == 'f') && (str.value[1] == 'a')) && (str.value[2] == 'l'));
}
static _Bool __chemda_263_219(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	char* str = "\n\t";
	return ((str[0] == '\n') && (str[1] == '\t'));
}
static _Bool __chemda_338_220(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	char str[] = "hello";
	return (((str[0] == 'h') && (str[4] == 'o')) && (str[5] == '\0'));
}
static _Bool __chemda_844_221(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	char str[10] = "hello";
	return (((((str[0] == 'h') && (str[4] == 'o')) && (str[5] == '\0')) && (str[6] == '\0')) && (str[9] == '\0'));
}
static _Bool __chemda_880_222(){
	/** visiting var init in before **/
	struct string first;
	/** function call being taken out that returns struct **/
	stringconstructor(&first, "hello world", 11);
	/** var_init defining the value **/
	first;
	/** visiting var init in before **/
	struct string second;
	/** function call being taken out that returns struct **/
	stringconstructor(&second, "hello world", 11);
	/** var_init defining the value **/
	second;
	const _Bool __chx_ret_val_res = stringequals(&first,&second);;
	stringdelete(&second);
	stringdelete(&first);
	return __chx_ret_val_res;
}
static _Bool __chemda_632_223(){
	/** visiting var init in before **/
	struct string first;
	/** function call being taken out that returns struct **/
	stringconstructor(&first, "hello world", 11);
	/** var_init defining the value **/
	first;
	/** visiting var init in before **/
	struct string second;
	/** function call being taken out that returns struct **/
	stringconstructor(&second, "not hello world", 15);
	/** var_init defining the value **/
	second;
	const _Bool __chx_ret_val_res = !stringequals(&first,&second);;
	stringdelete(&second);
	stringdelete(&first);
	return __chx_ret_val_res;
}
static _Bool __chemda_434_224(){
	/** visiting var init in before **/
	struct string first;
	/** function call being taken out that returns struct **/
	stringconstructor(&first, "hello world", 11);
	/** var_init defining the value **/
	first;
	/** visiting var init in before **/
	struct string second;
	/** function call being taken out that returns struct **/
	stringconstructor(&second, "not hello world", 15);
	/** var_init defining the value **/
	second;
	const _Bool __chx_ret_val_res = !stringequals(&first,&second);;
	stringdelete(&second);
	stringdelete(&first);
	return __chx_ret_val_res;
}
static _Bool __chemda_180_225(){
	/** visiting var init in before **/
	struct string first;
	/** function call being taken out that returns struct **/
	stringconstructor(&first, "hello world", 11);
	/** var_init defining the value **/
	first;
	/** visiting var init in before **/
	struct string second;
	/** function call being taken out that returns struct **/
	stringconstructor(&second, "hello worldwo", 13);
	/** var_init defining the value **/
	second;
	stringappend(&first,'w');
	stringappend(&first,'o');
	const _Bool __chx_ret_val_res = stringequals(&first,&second);;
	stringdelete(&second);
	stringdelete(&first);
	return __chx_ret_val_res;
}
static _Bool __chemda_403_226(){
	/** visiting var init in before **/
	struct string first;
	/** function call being taken out that returns struct **/
	stringconstructor(&first, "hello world", 11);
	/** var_init defining the value **/
	first;
	/** visiting var init in before **/
	struct string second;
	/** function call being taken out that returns struct **/
	stringconstructor(&second, "hello worldwo", 13);
	/** var_init defining the value **/
	second;
	const _Bool __chx_ret_val_res = ((stringsize(&first) == 11) && (stringsize(&second) == 13));
	stringdelete(&second);
	stringdelete(&first);
	return __chx_ret_val_res;
}
static _Bool __chemda_223_227(){
	/** visiting var init in before **/
	struct string first;
	/** function call being taken out that returns struct **/
	stringconstructor(&first, "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", 102);
	/** var_init defining the value **/
	first;
	/** visiting var init in before **/
	struct string second;
	/** function call being taken out that returns struct **/
	stringconstructor(&second, "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", 102);
	/** var_init defining the value **/
	second;
	/** visiting var init in before **/
	/** var_init defining the value **/
	char* first_data = stringdata(&first);;
	/** visiting var init in before **/
	/** var_init defining the value **/
	char* second_data = stringdata(&second);;
	/** visiting var init in before **/
	for(/** var_init defining the value **/
	int i = 1;(i <= 102);i += 1){
		if((first_data[i] != second_data[i])){
			stringdelete(&second);
			stringdelete(&first);
			return 0;
		}
	}
	stringdelete(&second);
	stringdelete(&first);
	return 1;
}
static _Bool __chemda_536_228(){
	/** visiting var init in before **/
	struct string first;
	/** function call being taken out that returns struct **/
	stringconstructor(&first, "", 0);
	/** var_init defining the value **/
	first;
	/** visiting var init in before **/
	for(/** var_init defining the value **/
	int i = 1;(i <= 102);i += 1){
		stringappend(&first,'x');
	}
	/** visiting var init in before **/
	struct string second;
	/** function call being taken out that returns struct **/
	stringconstructor(&second, "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", 102);
	/** var_init defining the value **/
	second;
	const _Bool __chx_ret_val_res = stringequals(&first,&second);;
	stringdelete(&second);
	stringdelete(&first);
	return __chx_ret_val_res;
}
static void test_strings(){
	test("check string indexing works", __chemda_997_217);
	test("test string indexing inside struct", __chemda_730_218);
	test("test escaped characters in strings work", __chemda_263_219);
	test("string arrays work too", __chemda_338_220);
	test("string arrays over sized work too", __chemda_844_221);
	test("test two std::strings are equal", __chemda_880_222);
	test("test two std::strings are not equal", __chemda_632_223);
	test("test two std::strings are not equal", __chemda_434_224);
	test("test can append in std::string", __chemda_180_225);
	test("test std::string has correct size", __chemda_403_226);
	test("test can verify each character in a data pointer of string", __chemda_223_227);
	test("test can append in std::string", __chemda_536_228);
}
struct SizeOfStrT1 {
	int p1;
	int p2;
	int p3;
};
static void test_sizeof();
static void test_macros();
static _Bool __chemda_109_229(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned long long i = sizeof(int);
	return (i == 4);
}
static _Bool __chemda_875_230(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool is64 = 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned long long i = sizeof(long long);
	if(is64){
		return (i == 8);
	} else {
		return (i == 4);
	}
}
static _Bool __chemda_418_231(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	unsigned long long i = sizeof(struct SizeOfStrT1);
	return (i == 12);
}
static _Bool __chemda_975_232(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int evaluated = 4;
	return (evaluated == 4);
}
static void test_sizeof(){
	test("test sizeof int", __chemda_109_229);
	test("test sizeof long", __chemda_875_230);
	test("test sizeof struct", __chemda_418_231);
}
static void test_macros(){
	test_sizeof();
	test("test evaluation macro works", __chemda_975_232);
}
struct DataStr1 {
	int data;
};
static int arr_index(int arr[2], int index);
static void test_arrays();
static _Bool __chemda_481_233(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int arr[2] = {};
	arr[0] = 2;
	arr[1] = 4;
	return ((arr_index(arr, 0) == 2) && (arr_index(arr, 1) == 4));
}
static _Bool __chemda_683_234(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct DataStr1 arr[1] = {};
	arr[0].data = 5;
	return (arr[0].data == 5);
}
static _Bool __chemda_269_235(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct DataStr1 arr[1] = {};
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct DataStr1* ptr = &arr[0];
	ptr->data = 5;
	return (ptr->data == 5);
}
static int arr_index(int arr[2], int index){
	return arr[index];
}
static void test_arrays(){
	test("test arrays can be passed to functions", __chemda_481_233);
	test("can index on struct inside array directly", __chemda_683_234);
	test("can index on struct inside array indirectly", __chemda_269_235);
}
struct PMC22 {
	int a;
	int b;
};
static void test_pointer_math();
static _Bool __chemda_334_236(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 2;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* j = &i;
	*j = (*j + 1);
	return (i == 3);
}
static _Bool __chemda_329_237(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int arr[5] = {10,20,30,40,50};
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* ptr = &arr[0];
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool result1 = (*ptr == 10);
	ptr += 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool result2 = (*ptr == 20);
	ptr += 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool result3 = (*ptr == 30);
	ptr -= 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool result4 = (*ptr == 20);
	ptr += 1;
	ptr += 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool result5 = (*ptr == 40);
	ptr += 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool result6 = (*ptr == 50);
	return (((((result1 && result2) && result3) && result4) && result5) && result6);
}
static _Bool __chemda_639_238(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int arr[5] = {10,20,30,40,50};
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* ptr1 = (&arr[0] + 2);
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* ptr2 = &arr[0];
	/** visiting var init in before **/
	/** var_init defining the value **/
	long long diff = (ptr1 - ptr2);
	return (diff == 2);
}
static _Bool __chemda_350_239(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int arr[5] = {10,20,30,40,50};
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* ptr1 = (&arr[0] + 2);
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* ptr2 = &arr[0];
	return ((ptr1 > ptr2) && (ptr2 < ptr1));
}
static _Bool __chemda_809_240(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int arr[5] = {10,20,30,40,50};
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* ptr1 = (&arr[0] + 2);
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* ptr2 = (&arr[0] + 2);
	return (ptr1 == ptr2);
}
static _Bool __chemda_963_241(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int arr[5] = {10,20,30,40,50};
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* ptr1 = (&arr[0] + 4);
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* ptr2 = &arr[0];
	return (ptr2 < ptr1);
}
static _Bool __chemda_271_242(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int d[2];
	d[0] = 55;
	d[1] = 60;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* ptr = &d[0];
	return (ptr[1] == 60);
}
static _Bool __chemda_892_243(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct PMC22 p = {.a = 22, .b = 33, };
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct PMC22* j = &p;
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct PMC22* k = (j + 1);
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct PMC22* d = (k - 1);
	return ((d->a == 22) && (d->b == 33));
}
static void test_pointer_math(){
	test("assignment using a pointer works", __chemda_334_236);
	test("testing basic pointer arithmetic", __chemda_329_237);
	test("pointer subtraction works", __chemda_639_238);
	test("pointer comparison works - 1", __chemda_350_239);
	test("pointer comparison works - 2", __chemda_809_240);
	test("pointer comparison works - 3", __chemda_963_241);
	test("pointer access using index operator work", __chemda_271_242);
	test("can access children after doing pointer math", __chemda_892_243);
}
static void test_casts();
static _Bool __chemda_768_244(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int num1 = 30;
	/** visiting var init in before **/
	/** var_init defining the value **/
	long long num2 = 16;
	return (num1 > ((int) num2));
}
static _Bool __chemda_533_245(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int num1 = 30;
	/** visiting var init in before **/
	/** var_init defining the value **/
	long long num2 = 16;
	return (((long long) num1) > num2);
}
static _Bool __chemda_341_246(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int num1 = 30;
	/** visiting var init in before **/
	/** var_init defining the value **/
	long long num2 = 16;
	return (num1 > ((int) num2));
}
static _Bool __chemda_121_247(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int num1 = 30;
	/** visiting var init in before **/
	/** var_init defining the value **/
	long long num2 = 16;
	return (((long long) num1) > num2);
}
static _Bool __chemda_239_248(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	double d = ((double) 1.000000);
	/** visiting var init in before **/
	/** var_init defining the value **/
	float fl = ((float) d);
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool i = (((int) fl) == 1);
	return i;
}
static _Bool __chemda_917_249(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	double num = ((double) 1.000000);
	/** visiting var init in before **/
	/** var_init defining the value **/
	int num2 = ((int) num);
	return (num2 == 1);
}
static _Bool __chemda_857_250(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	float num = ((float) 1.000000);
	/** visiting var init in before **/
	/** var_init defining the value **/
	int num2 = ((int) num);
	return (num2 == 1);
}
static _Bool __chemda_304_251(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int num = 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	double num2 = ((double) num);
	return (num2 == 1.000000);
}
static _Bool __chemda_974_252(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int num = 1;
	/** visiting var init in before **/
	/** var_init defining the value **/
	float num2 = ((float) num);
	return (num2 == 1.000000);
}
static _Bool __chemda_304_253(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	float fl = 1.000000;
	/** visiting var init in before **/
	/** var_init defining the value **/
	double d = ((double) fl);
	return (((int) d) == 1);
}
static _Bool __chemda_156_254(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	double d = ((double) 1.000000);
	/** visiting var init in before **/
	/** var_init defining the value **/
	float fl = ((float) d);
	return (((int) fl) == 1);
}
static _Bool __chemda_320_255(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	float fl = 1.000000;
	return (((double) fl) == 1.000000);
}
static _Bool __chemda_679_256(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	double d = ((double) 1.000000);
	return (((float) d) == 1.000000);
}
static void test_casts(){
	test("test long value can be truncated", __chemda_768_244);
	test("test int value can be extended", __chemda_533_245);
	test("test cast without parenthesis works - 1", __chemda_341_246);
	test("test cast without parenthesis works - 2", __chemda_121_247);
	test("test cast without parenthesis works - 3", __chemda_239_248);
	test("cast double to an integer", __chemda_917_249);
	test("cast float to a double", __chemda_857_250);
	test("cast int to a double", __chemda_304_251);
	test("cast int to a float", __chemda_974_252);
	test("cast a float to a double", __chemda_304_253);
	test("cast a double to a float", __chemda_156_254);
	test("cast a float to a double", __chemda_320_255);
	test("cast a double to a float", __chemda_679_256);
}
struct TestStruct1 {
	int x;
	int y;
};
struct TestStruct2 {
	struct TestStruct1 test;
};
static void test_struct(struct TestStruct1* __chx_struct_ret_param_xx);
struct MemLamb {
	void(*lamb)(struct TestStruct1* __chx_struct_ret_param_xx);
};
static void MemLambmem_func_test(struct TestStruct1* __chx_struct_ret_param_xx);
static void ext_func_test(struct TestStruct1* __chx_struct_ret_param_xx, struct MemLamb* mem);
static _Bool expr_test_func_call();
static int can_take_literal_type(int my_int);
static int sno_func();
static int sno_func__cmf_1(int a);
static int sno_func__cmf_2(int a, int b);
static void test_name_overriding();
struct SnoPair {
	int a;
	int b;
};
static int SnoPairplus(struct SnoPair* self);
static int SnoPairplus__cmf_1(struct SnoPair* self, int c);
static int SnoPairplus__cmf_2(struct SnoPair* self, int c, int d);
static void test_name_overriding_in_struct();
static void test_functions();
/** var_init defining the value **/
static _Bool is_expr_test_func_called = 0;
static _Bool __chemda_193_257(){
	return (sno_func() == 10);
}
static _Bool __chemda_355_258(){
	return (sno_func__cmf_1(20) == 20);
}
static _Bool __chemda_550_259(){
	return (sno_func__cmf_2(20, 20) == 40);
}
static _Bool __chemda_850_260(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct SnoPair p = {.a = 10, .b = 10, };
	return (SnoPairplus(&p) == 20);
}
static _Bool __chemda_712_261(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct SnoPair p = {.a = 10, .b = 10, };
	return (SnoPairplus__cmf_1(&p,10) == 30);
}
static _Bool __chemda_852_262(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct SnoPair p = {.a = 10, .b = 10, };
	return (SnoPairplus__cmf_2(&p,10, 10) == 40);
}
static _Bool __chemda_693_263(){
	struct TestStruct1 __chx__lv__0;
	/** function call being taken out that returns struct **/
	test_struct(&__chx__lv__0);
	return (__chx__lv__0.x == 100);
}
typedef void(*__chx_functype_160_3)(struct TestStruct1* __chx_struct_ret_param_xx);
static _Bool __chemda_122_264(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chx_functype_160_3 lamb = test_struct;
	struct TestStruct1 __chx__lv__1;
	/** function call being taken out that returns struct **/
	lamb(&__chx__lv__1);
	return (__chx__lv__1.x == 100);
}
static _Bool __chemda_357_265(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct MemLamb mem = {.lamb = test_struct, };
	struct TestStruct1 __chx__lv__2;
	/** function call being taken out that returns struct **/
	mem.lamb(&__chx__lv__2);
	return (__chx__lv__2.x == 100);
}
static _Bool __chemda_552_266(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct MemLamb mem = {};
	struct TestStruct1 __chx__lv__3;
	/** function call being taken out that returns struct **/
	MemLambmem_func_test(&__chx__lv__3);
	return (__chx__lv__3.x == 200);
}
static _Bool __chemda_159_267(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct MemLamb mem = {};
	struct TestStruct1 __chx__lv__4;
	/** function call being taken out that returns struct **/
	ext_func_test(&__chx__lv__4, &mem);
	return (__chx__lv__4.x == 300);
}
static _Bool __chemda_118_268(){
	/** visiting var init in before **/
	struct TestStruct1 __chx__lv__5;
	/** function call being taken out that returns struct **/
	test_struct(&__chx__lv__5);
	/** var_init defining the value **/
	struct TestStruct2 t = {.test = __chx__lv__5, };
	return ((t.test.x == 100) && (t.test.y == 100));
}
static _Bool __chemda_424_269(){
	/** visiting var init in before **/
	struct TestStruct1 __chx__lv__6;
	/** function call being taken out that returns struct **/
	test_struct(&__chx__lv__6);
	/** var_init defining the value **/
	struct TestStruct1 arr[1] = {__chx__lv__6};
	return ((arr[0].x == 100) && (arr[0].y == 100));
}
static _Bool __chemda_116_270(){
	is_expr_test_func_called = 0;
	if((1 || expr_test_func_call())){
	}
	return (is_expr_test_func_called == 0);
}
static _Bool __chemda_620_271(){
	is_expr_test_func_called = 0;
	if((0 || expr_test_func_call())){
	}
	return (is_expr_test_func_called == 1);
}
static _Bool __chemda_708_272(){
	is_expr_test_func_called = 0;
	if((0 && expr_test_func_call())){
	}
	return (is_expr_test_func_called == 0);
}
static _Bool __chemda_368_273(){
	is_expr_test_func_called = 0;
	if((1 && expr_test_func_call())){
	}
	return (is_expr_test_func_called == 1);
}
static _Bool __chemda_546_274(){
	return (can_take_literal_type(2) == 5);
}
static void test_struct(struct TestStruct1* __chx_struct_ret_param_xx){
	__chx_struct_ret_param_xx->x = 100;
	__chx_struct_ret_param_xx->y = 100;
}
static void MemLambmem_func_test(struct TestStruct1* __chx_struct_ret_param_xx){
	__chx_struct_ret_param_xx->x = 200;
	__chx_struct_ret_param_xx->y = 200;
}
static void ext_func_test(struct TestStruct1* __chx_struct_ret_param_xx, struct MemLamb* mem){
	__chx_struct_ret_param_xx->x = 300;
	__chx_struct_ret_param_xx->y = 300;
}
static _Bool expr_test_func_call(){
	is_expr_test_func_called = 1;
	return 1;
}
static int can_take_literal_type(int my_int){
	return (my_int + 3);
}
static int sno_func(){
	return 10;
}
static int sno_func__cmf_1(int a){
	return a;
}
static int sno_func__cmf_2(int a, int b){
	return (a + b);
}
static void test_name_overriding(){
	test("correct function is called when same names overriding - 1", __chemda_193_257);
	test("correct function is called when same names overriding - 2", __chemda_355_258);
	test("correct function is called when same names overriding - 3", __chemda_550_259);
}
static int SnoPairplus(struct SnoPair* self){
	return (self->a + self->b);
}
static int SnoPairplus__cmf_1(struct SnoPair* self, int c){
	return ((self->a + self->b) + c);
}
static int SnoPairplus__cmf_2(struct SnoPair* self, int c, int d){
	return (((self->a + self->b) + c) + d);
}
static void test_name_overriding_in_struct(){
	test("correct function is called when same names overriding in struct - 1", __chemda_850_260);
	test("correct function is called when same names overriding in struct - 1", __chemda_712_261);
	test("correct function is called when same names overriding in struct - 1", __chemda_852_262);
}
static void test_functions(){
	test("test struct member access in chain, tld function return", __chemda_693_263);
	test("test struct member access in chain, lambda function return", __chemda_122_264);
	test("test struct member access in chain, member lambda return", __chemda_357_265);
	test("test struct member access in chain, member function return", __chemda_552_266);
	test("test struct member access in chain, extension function return", __chemda_159_267);
	test("supports function calls that return structs inside struct values", __chemda_118_268);
	test("supports function calls that return structs inside array values", __chemda_424_269);
	test("expression test function is not called in 'or' ||", __chemda_116_270);
	test("expression test function is called in 'or' ||", __chemda_620_271);
	test("expression test function is not called in 'and' &&", __chemda_708_272);
	test("expression test function is called in 'and' &&", __chemda_368_273);
	test("function can take literal type", __chemda_546_274);
	test_name_overriding();
	test_name_overriding_in_struct();
}
struct Destructible {
	int data;
	int* count;
	void(*lamb)(int* count);
};
static void Destructibledelete(struct Destructible* self);
struct GenDestruct__cgs__0 {
	short data;
	int* count;
	void(*lamb)(int* count);
};
static void GenDestruct__cgs__0delete(struct GenDestruct__cgs__0* self);
struct GenDestruct__cgs__1 {
	long long data;
	int* count;
	void(*lamb)(int* count);
};
static void GenDestruct__cgs__1delete(struct GenDestruct__cgs__1* self);
struct GenDestruct__cgs__2 {
	int data;
	int* count;
	void(*lamb)(int* count);
};
static void GenDestruct__cgs__2delete(struct GenDestruct__cgs__2* self);
static void take_gen_destruct_short(struct GenDestruct__cgs__0* d);
struct GenDestructOwner {
	struct GenDestruct__cgs__1 d;
};
static void GenDestructOwnerdelete(struct GenDestructOwner* self);
static void create_long_gen_dest(struct GenDestruct__cgs__1* __chx_struct_ret_param_xx, long long data, int* count, void(*lamb)(int* count));
struct Holder1 {
	struct Destructible thing;
};
static void Holder1delete(struct Holder1* self);
static void create_destructible(struct Destructible* __chx_struct_ret_param_xx, int* count, int data);
static void destruct_inc_count(int* count);
static void destructible_but_last_if(int* count, int data);
static void destructible_but_last_if_returns(int* count, int data);
static void test_destruction_at_early_return(int* count, _Bool early_return);
static void test_conditional_destruction(int* count, _Bool condition);
static void test_struct_param_destructor(struct Destructible* d);
static void test_return_struct_param(struct Destructible* __chx_struct_ret_param_xx, struct Destructible* d);
static void send_lambda_struct(int data, int* count, void(*lamb)(struct Destructible* d));
struct my_string {
};
static void my_stringconstructor(struct my_string* __chx_struct_ret_param_xx, char* value, unsigned long long length);
static void my_stringdelete(struct my_string* self);
static void relative_path(struct my_string* __chx_struct_ret_param_xx, struct my_string* path);
struct OptDestructible {
	int __chx__vt_621827;
	union {
		struct {
			struct Destructible d;
		} Some;
		struct {
		} None;
	};
};
static void OptDestructibledelete(struct OptDestructible* self);
static void test_variant_param_destructor(struct OptDestructible* d);
static void test_return_variant_param(struct OptDestructible* __chx_struct_ret_param_xx, struct OptDestructible* d);
static void test_variant_destruction_at_early_return(int* count, _Bool early_return);
static void test_variant_conditional_destruction(int* count, _Bool condition);
static void test_destructors();
static void __chemda_714_275(int* count){
	*count = (*count + 1);
}
static void __chemda_401_276(int* count){
	*count = (*count + 1);
}
static void __chemda_745_277(int* count){
	*count = (*count + 1);
}
static void __chemda_923_278(int* count){
	*count = (*count + 1);
}
static void __chemda_599_279(int* count){
	*count = (*count + 1);
}
static void __chemda_748_280(int* count){
	*count = (*count + 1);
}
static void __chemda_145_281(int* count){
	*count = (*count + 1);
}
/** var_init defining the value **/
static int my_string_destr_count = 0;
static void __chemda_254_282(int* count){
	*count = (*count + 1);
}
static void __chemda_913_283(int* count){
	*count = (*count + 1);
}
static void __chemda_848_284(int* count){
	*count = (*count + 1);
}
static void __chemda_853_285(int* count){
	*count = (*count + 1);
}
static void __chemda_954_286(int* count){
	*count = (*count + 1);
}
static _Bool __chemda_122_287(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool data_usable = 0;
	if((count == 0)){
		/** visiting var init in before **/
		/** var_init defining the value **/
		struct Destructible d = {.data = 892, .count = &count, .lamb = __chemda_954_286, };
		data_usable = (d.data == 892);
		Destructibledelete(&d);
	}
	return ((count == 1) && data_usable);
}
static _Bool __chemda_345_288(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool data_usable = 0;
	if((count == 0)){
		/** visiting var init in before **/
		struct Destructible d;
		/** function call being taken out that returns struct **/
		create_destructible(&d, &count, 334);
		/** var_init defining the value **/
		
		data_usable = ((d.data == 334) && (count == 0));
		Destructibledelete(&d);
	}
	return ((count == 1) && data_usable);
}
static void __chemda_990_289(int* count){
	*count = (*count + 1);
}
static _Bool __chemda_305_290(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool data_usable = 0;
	if((count == 0)){
		/** visiting var init in before **/
		/** var_init defining the value **/
		struct Destructible d;
		d.data = 426;
		d.count = &count;
		d.lamb = __chemda_990_289;
		data_usable = (d.data == 426);
		Destructibledelete(&d);
	}
	return ((count == 1) && data_usable);
}
static _Bool __chemda_707_291(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	test_destruction_at_early_return(&count, 1);
	return (count == 1);
}
static _Bool __chemda_947_292(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	test_destruction_at_early_return(&count, 0);
	return (count == 2);
}
static _Bool __chemda_589_293(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	test_conditional_destruction(&count, 1);
	return (count == 2);
}
static _Bool __chemda_756_294(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	test_conditional_destruction(&count, 0);
	return (count == 1);
}
static _Bool __chemda_117_295(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	/** visiting var init in before **/
	struct Destructible __chx__lv__1;
	/** function call being taken out that returns struct **/
	create_destructible(&__chx__lv__1, &count, 858);
	/** var_init defining the value **/
	int data = __chx__lv__1.data;
	Destructibledelete(&__chx__lv__1);
	return ((count == 1) && (data == 858));
}
typedef int(*__chx_functype_717_4)(int thing);
static int __chemda_321_296(int thing){
	return thing;
}
static _Bool __chemda_371_297(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chx_functype_717_4 get_int = __chemda_321_296;
	/** visiting var init in before **/
	struct Destructible __chx__lv__2;
	/** function call being taken out that returns struct **/
	create_destructible(&__chx__lv__2, &count, 363);
	/** var_init defining the value **/
	int data = get_int(__chx__lv__2.data);;
	Destructibledelete(&__chx__lv__2);
	return ((count == 1) && (data == 363));
}
static void __chemda_365_298(int* count){
	*count = (*count + 1);
}
static _Bool __chemda_394_299(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		/** visiting var init in before **/
		/** var_init defining the value **/
		struct Destructible d;
		d.count = &count;
		d.lamb = __chemda_365_298;
		/** visiting var init in before **/
		/** var_init defining the value **/
		struct Destructible* x;
		x = &d;
		/** visiting var init in before **/
		/** var_init defining the value **/
		struct Destructible* y = &d;
		Destructibledelete(&d);
	}
	return (count == 1);
}
static void __chemda_684_300(int* count){
	*count = (*count + 1);
}
static _Bool __chemda_383_301(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		/** visiting var init in before **/
		/** var_init defining the value **/
		struct Destructible arr[10] = {};
		/** visiting var init in before **/
		/** var_init defining the value **/
		int i = 0;
		/** visiting var init in before **/
		/** var_init defining the value **/
		struct Destructible* ptr;
		while((i < 10)) {
			ptr = &arr[i];
			ptr->count = &count;
			ptr->lamb = __chemda_684_300;
			i += 1;
		}
		for(int __chx__lv__3 = 10 - 1; __chx__lv__3 >= 0;__chx__lv__3--){
			Destructibledelete(&arr[__chx__lv__3]);
		}
	}
	return (count == 10);
}
static void __chemda_762_302(int* count){
	*count = (*count + 1);
}
static _Bool __chemda_538_303(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		/** visiting var init in before **/
		/** var_init defining the value **/
		struct Destructible arr[10];
		/** visiting var init in before **/
		/** var_init defining the value **/
		int i = 0;
		/** visiting var init in before **/
		/** var_init defining the value **/
		struct Destructible* ptr;
		while((i < 10)) {
			ptr = &arr[i];
			ptr->count = &count;
			ptr->lamb = __chemda_762_302;
			i += 1;
		}
		for(int __chx__lv__4 = 10 - 1; __chx__lv__4 >= 0;__chx__lv__4--){
			Destructibledelete(&arr[__chx__lv__4]);
		}
	}
	return (count == 10);
}
static _Bool __chemda_379_304(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		/** visiting var init in before **/
		struct Destructible __chx__lv__5;
		/** function call being taken out that returns struct **/
		create_destructible(&__chx__lv__5, &count, 332);
		/** var_init defining the value **/
		struct Holder1 holder = {.thing = __chx__lv__5, };
		Holder1delete(&holder);
	}
	return (count == 1);
}
static _Bool __chemda_483_305(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	destructible_but_last_if(&count, 454);
	return (count == 1);
}
static _Bool __chemda_668_306(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	destructible_but_last_if_returns(&count, 655);
	return (count == 1);
}
static void __chemda_951_307(int* count){
	*count = (*count + 1);
}
static _Bool __chemda_922_308(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		struct Destructible __chx__lv__6 = {.count = &count, .lamb = __chemda_951_307, };
		test_struct_param_destructor(&__chx__lv__6);
	}
	return (count == 1);
}
static _Bool __chemda_356_309(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		struct Destructible __chx__lv__7;
		/** function call being taken out that returns struct **/
		create_destructible(&__chx__lv__7, &count, 223);
		test_struct_param_destructor(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__7);
	}
	return (count == 1);
}
static _Bool __chemda_255_310(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		struct Destructible __chx__lv__8;
		/** function call being taken out that returns struct **/
		create_destructible(&__chx__lv__8, &count, 676);
		__chx__lv__8;
		Destructibledelete(&__chx__lv__8);
	}
	return (count == 1);
}
static _Bool __chemda_341_311(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		/** visiting var init in before **/
		/** var_init defining the value **/
		struct GenDestruct__cgs__2 d = {.data = 454, .count = &count, .lamb = destruct_inc_count, };
		GenDestruct__cgs__2delete(&d);
	}
	return (count == 1);
}
static _Bool __chemda_234_312(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		/** visiting var init in before **/
		struct GenDestruct__cgs__1 d;
		/** function call being taken out that returns struct **/
		create_long_gen_dest(&d, 343, &count, destruct_inc_count);
		/** var_init defining the value **/
		
		GenDestruct__cgs__1delete(&d);
	}
	return (count == 1);
}
static _Bool __chemda_685_313(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		/** visiting var init in before **/
		/** var_init defining the value **/
		struct GenDestructOwner d = {.d = {.data = 454, .count = &count, .lamb = destruct_inc_count, }, };
		GenDestructOwnerdelete(&d);
	}
	return (count == 1);
}
static _Bool __chemda_861_314(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		/** visiting var init in before **/
		/** var_init defining the value **/
		struct GenDestruct__cgs__2 d[1] = {{.data = 454, .count = &count, .lamb = destruct_inc_count, }};
		for(int __chx__lv__10 = 1 - 1; __chx__lv__10 >= 0;__chx__lv__10--){
			GenDestruct__cgs__0delete(&d[__chx__lv__10]);
		}
	}
	return (count == 1);
}
static _Bool __chemda_607_315(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		struct GenDestruct__cgs__0 __chx__lv__11 = {.data = 889, .count = &count, .lamb = destruct_inc_count, };
		take_gen_destruct_short(&__chx__lv__11);
	}
	return (count == 1);
}
static _Bool __chemda_773_316(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		struct GenDestruct__cgs__1 __chx__lv__12;
		/** function call being taken out that returns struct **/
		create_long_gen_dest(&__chx__lv__12, 343, &count, destruct_inc_count);
		take_gen_destruct_short(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__12);
	}
	return (count == 1);
}
static _Bool __chemda_921_317(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	/** visiting var init in before **/
	struct GenDestruct__cgs__1 __chx__lv__13;
	/** function call being taken out that returns struct **/
	create_long_gen_dest(&__chx__lv__13, 343, &count, destruct_inc_count);
	/** var_init defining the value **/
	int d = __chx__lv__13.data;
	GenDestruct__cgs__1delete(&__chx__lv__13);
	return (count == 1);
}
static _Bool __chemda_256_318(){
	my_string_destr_count = 0;
	if(1){
		/** visiting var init in before **/
		struct my_string input_file;
		/** function call being taken out that returns struct **/
		my_stringconstructor(&input_file, "ext/file.c", 10);
		/** var_init defining the value **/
		input_file;
		my_stringdelete(&input_file);
	}
	return (my_string_destr_count == 1);
}
static _Bool __chemda_878_319(){
	my_string_destr_count = 0;
	if(1){
		/** visiting var init in before **/
		struct my_string input_file;
		struct my_string __chx__lv__16;
		/** function call being taken out that returns struct **/
		my_stringconstructor(&__chx__lv__16, "ext/file.c", 10);
		/** function call being taken out that returns struct **/
		relative_path(&input_file, &/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__16);
		/** var_init defining the value **/
		
		my_stringdelete(&input_file);
	}
	return (my_string_destr_count == 2);
}
static void __chemda_779_320(struct Destructible* d){
	Destructibledelete(d);
}
static _Bool __chemda_806_321(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	send_lambda_struct(347, &count, __chemda_779_320);
	return (count == 1);
}
static _Bool __chemda_575_322(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	/** visiting var init in before **/
	struct Destructible d;
	struct Destructible __chx__lv__19 = {.data = 777, .count = &count, .lamb = destruct_inc_count, };
	/** function call being taken out that returns struct **/
	test_return_struct_param(&d, &__chx__lv__19);
	/** var_init defining the value **/
	
	const _Bool __chx_ret_val_res = ((d.data == 777) && (count == 0));
	Destructibledelete(&d);
	return __chx_ret_val_res;
}
typedef void(*__chx_functype_896_5)();
static void __chemda_963_323(){
	return;
}
typedef void(*__chx_functype_934_6)();
static void __chemda_447_324(){
}
static _Bool __chemda_490_325(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Destructible d = {.data = 677, .count = &count, .lamb = destruct_inc_count, };
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chx_functype_896_5 lamb = __chemda_963_323;
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chx_functype_934_6 lamb2 = __chemda_447_324;
	lamb();
	lamb2();
	const _Bool __chx_ret_val_res = ((count == 0) && (d.data == 677));
	Destructibledelete(&d);
	return __chx_ret_val_res;
}
static void __chemda_430_326(int* count){
	*count = (*count + 1);
}
static _Bool __chemda_784_327(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	/** visiting var init in before **/
	/** var_init defining the value **/
	_Bool data_usable = 0;
	if((count == 0)){
		/** visiting var init in before **/
		struct OptDestructible __chx__lv__21 = { 0, .Some.d = {.data = 892, .count = &count, .lamb = __chemda_430_326, }, };
		/** var_init defining the value **/
		struct OptDestructible x = __chx__lv__21;
		switch(x.__chx__vt_621827) {
			case 0:
				data_usable = (x.Some.d.data == 892);
				break;
			case 1:
				break;
		}
		OptDestructibledelete(&x);
	}
	return ((count == 1) && data_usable);
}
static void __chemda_741_328(int* count){
	*count = (*count + 1);
}
static _Bool __chemda_986_329(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		struct OptDestructible __chx__lv__22 = { 0, .Some.d = {.count = &count, .lamb = __chemda_741_328, }, };
		test_variant_param_destructor(&__chx__lv__22);
	}
	return (count == 1);
}
static _Bool __chemda_961_330(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	if((count == 0)){
		struct Destructible __chx__lv__23;
		/** function call being taken out that returns struct **/
		create_destructible(&__chx__lv__23, &count, 223);
		struct OptDestructible __chx__lv__24 = { 0, .Some.d = __chx__lv__23, };
		test_variant_param_destructor(&__chx__lv__24);
	}
	return (count == 1);
}
static _Bool __chemda_281_331(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	/** visiting var init in before **/
	struct OptDestructible x;
	struct OptDestructible __chx__lv__25 = { 0, .Some.d = {.data = 777, .count = &count, .lamb = destruct_inc_count, }, };
	/** function call being taken out that returns struct **/
	test_return_variant_param(&x, &__chx__lv__25);
	/** var_init defining the value **/
	
	const _Bool __chx_ret_val_res = (count == 0);
	OptDestructibledelete(&x);
	return __chx_ret_val_res;
}
static _Bool __chemda_466_332(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	test_variant_destruction_at_early_return(&count, 1);
	return (count == 1);
}
static _Bool __chemda_516_333(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	test_variant_destruction_at_early_return(&count, 0);
	return (count == 2);
}
static _Bool __chemda_573_334(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	test_variant_conditional_destruction(&count, 1);
	return (count == 2);
}
static _Bool __chemda_523_335(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int count = 0;
	test_variant_conditional_destruction(&count, 0);
	return (count == 1);
}
static void Destructibledelete(struct Destructible* self){
	self->lamb(self->count);
	__chx__dstctr_clnup_blk__:{
	}
}
static void GenDestruct__cgs__0delete(struct GenDestruct__cgs__0* self){
	self->lamb(self->count);
	__chx__dstctr_clnup_blk__:{
	}
}
static void GenDestruct__cgs__1delete(struct GenDestruct__cgs__1* self){
	self->lamb(self->count);
	__chx__dstctr_clnup_blk__:{
	}
}
static void GenDestruct__cgs__2delete(struct GenDestruct__cgs__2* self){
	self->lamb(self->count);
	__chx__dstctr_clnup_blk__:{
	}
}
static void take_gen_destruct_short(struct GenDestruct__cgs__0* d){
	GenDestruct__cgs__0delete(d);
}
static void GenDestructOwnerdelete(struct GenDestructOwner* self){
	__chx__dstctr_clnup_blk__:{
		GenDestruct__cgs__2delete(&self->d);
	}
}
static void create_long_gen_dest(struct GenDestruct__cgs__1* __chx_struct_ret_param_xx, long long data, int* count, void(*lamb)(int* count)){
	__chx_struct_ret_param_xx->data = data;
	__chx_struct_ret_param_xx->count = count;
	__chx_struct_ret_param_xx->lamb = lamb;
}
static void Holder1delete(struct Holder1* self){
	__chx__dstctr_clnup_blk__:{
		Destructibledelete(&self->thing);
	}
}
static void create_destructible(struct Destructible* __chx_struct_ret_param_xx, int* count, int data){
	__chx_struct_ret_param_xx->data = data;
	__chx_struct_ret_param_xx->count = count;
	__chx_struct_ret_param_xx->lamb = __chemda_714_275;
}
static void destruct_inc_count(int* count){
	*count = (*count + 1);
}
static void destructible_but_last_if(int* count, int data){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Destructible d = {.data = data, .count = count, .lamb = __chemda_401_276, };
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 55;
	if((i == 55)){
		/** visiting var init in before **/
		/** var_init defining the value **/
		int x = 33;
	} else {
		/** visiting var init in before **/
		/** var_init defining the value **/
		int j = 12;
	}
	Destructibledelete(&d);
}
static void destructible_but_last_if_returns(int* count, int data){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Destructible d = {.data = data, .count = count, .lamb = __chemda_745_277, };
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 55;
	if((i == 55)){
		/** visiting var init in before **/
		/** var_init defining the value **/
		int t = 99;
		Destructibledelete(&d);
		return;
	} else {
		/** visiting var init in before **/
		/** var_init defining the value **/
		int p = 99;
		Destructibledelete(&d);
		return;
	}
	Destructibledelete(&d);
}
static void test_destruction_at_early_return(int* count, _Bool early_return){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Destructible d = {.count = count, .lamb = __chemda_923_278, };
	if(early_return){
		Destructibledelete(&d);
		return;
	}
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Destructible z = {.count = count, .lamb = __chemda_599_279, };
	Destructibledelete(&z);
	Destructibledelete(&d);
}
static void test_conditional_destruction(int* count, _Bool condition){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Destructible d = {.count = count, .lamb = __chemda_748_280, };
	if(condition){
		/** visiting var init in before **/
		/** var_init defining the value **/
		struct Destructible z = {.count = count, .lamb = __chemda_145_281, };
		Destructibledelete(&z);
		Destructibledelete(&d);
		return;
	}
	Destructibledelete(&d);
}
static void test_struct_param_destructor(struct Destructible* d){
	Destructibledelete(d);
}
static void test_return_struct_param(struct Destructible* __chx_struct_ret_param_xx, struct Destructible* d){
	*__chx_struct_ret_param_xx = *d;
}
static void send_lambda_struct(int data, int* count, void(*lamb)(struct Destructible* d)){
	struct Destructible __chx__lv__27 = {.data = data, .count = count, .lamb = destruct_inc_count, };
	lamb(&__chx__lv__27);
}
static void my_stringconstructor(struct my_string* __chx_struct_ret_param_xx, char* value, unsigned long long length){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct my_string* this = ((struct my_string*) __chx_struct_ret_param_xx);
}
static void my_stringdelete(struct my_string* self){
	my_string_destr_count = (my_string_destr_count + 1);
	__chx__dstctr_clnup_blk__:{
	}
}
static void relative_path(struct my_string* __chx_struct_ret_param_xx, struct my_string* path){
	/** visiting var init in before **/
	struct my_string m;
	/** function call being taken out that returns struct **/
	my_stringconstructor(&m, "wow", 3);
	/** var_init defining the value **/
	m;
	*__chx_struct_ret_param_xx = m;my_stringdelete(path);
	
}
static void OptDestructibledelete(struct OptDestructible* self){
	__chx__dstctr_clnup_blk__:{
		switch(self->__chx__vt_621827) {
			case 0:
			Destructibledelete(&self->Some.d);
			break;
			case 1:
			break;
		}
	}
}
static void test_variant_param_destructor(struct OptDestructible* d){
	OptDestructibledelete(d);
}
static void test_return_variant_param(struct OptDestructible* __chx_struct_ret_param_xx, struct OptDestructible* d){
	*__chx_struct_ret_param_xx = *d;
}
static void test_variant_destruction_at_early_return(int* count, _Bool early_return){
	/** visiting var init in before **/
	struct OptDestructible __chx__lv__30 = { 0, .Some.d = {.count = count, .lamb = __chemda_254_282, }, };
	/** var_init defining the value **/
	struct OptDestructible d = __chx__lv__30;
	if(early_return){
		OptDestructibledelete(&d);
		return;
	}
	/** visiting var init in before **/
	struct OptDestructible __chx__lv__31 = { 0, .Some.d = {.count = count, .lamb = __chemda_913_283, }, };
	/** var_init defining the value **/
	struct OptDestructible z = __chx__lv__31;
	OptDestructibledelete(&z);
	OptDestructibledelete(&d);
}
static void test_variant_conditional_destruction(int* count, _Bool condition){
	/** visiting var init in before **/
	struct OptDestructible __chx__lv__32 = { 0, .Some.d = {.count = count, .lamb = __chemda_848_284, }, };
	/** var_init defining the value **/
	struct OptDestructible d = __chx__lv__32;
	if(condition){
		/** visiting var init in before **/
		struct OptDestructible __chx__lv__33 = { 0, .Some.d = {.count = count, .lamb = __chemda_853_285, }, };
		/** var_init defining the value **/
		struct OptDestructible z = __chx__lv__33;
		OptDestructibledelete(&z);
		OptDestructibledelete(&d);
		return;
	}
	OptDestructibledelete(&d);
}
static void test_destructors(){
	test("test that var init struct value destructs", __chemda_122_287);
	test("test that functions returning struct don't destruct the struct", __chemda_345_288);
	test("test that var init struct without values get destructed", __chemda_305_290);
	test("test destruction at early return : true", __chemda_707_291);
	test("test destruction at early return : false", __chemda_947_292);
	test("test conditional destruction : true", __chemda_589_293);
	test("test conditional destruction : false", __chemda_756_294);
	test("test destruct struct accessed via function call", __chemda_117_295);
	test("test destructor is called when access chain is inside a function", __chemda_371_297);
	test("test destructor is not called on pointer types", __chemda_394_299);
	test("test array values are destructed", __chemda_383_301);
	test("test array types are destructed", __chemda_538_303);
	test("test that destructible struct present inside struct values is destructed", __chemda_379_304);
	test("test that destructor works, when last if don't return", __chemda_483_305);
	test("test that destructor works, when last if returns completely", __chemda_668_306);
	test("test structs passed to functions as parameters are automatically destructed - 1", __chemda_922_308);
	test("test structs passed to functions as parameters are automatically destructed - 2", __chemda_356_309);
	test("struct created in a access chain node, not assigned to a variable is destructed", __chemda_255_310);
	test("generic structs destructor is called in var init struct value", __chemda_341_311);
	test("generic structs destructor is called when created through function call", __chemda_234_312);
	test("generic struct destructor is called when inside another struct", __chemda_685_313);
	test("generic struct destructor is called when inside array value", __chemda_861_314);
	test("generic struct destructor is called when passed to a function - 1", __chemda_607_315);
	test("generic struct destructor is called when passed to a function - 2", __chemda_773_316);
	test("generic struct destructor is called in access chain", __chemda_921_317);
	test("comptime constructor struct is destructed, when in var init", __chemda_256_318);
	test("comptime constructor struct is destructed, when passing to function call and returning from it", __chemda_878_319);
	test("lambda taking a struct, the struct is destructed", __chemda_806_321);
	test("returning struct parameter doesn't destruct it", __chemda_575_322);
	test("lambda doesn't destruct outside it's scope", __chemda_490_325);
	test("var init variant call destructs", __chemda_784_327);
	test("test variants passed to functions as parameters are automatically destructed - 1", __chemda_986_329);
	test("test variants passed to functions as parameters are automatically destructed - 2", __chemda_961_330);
	test("returning variant parameter doesn't destruct it", __chemda_281_331);
	test("variant destruction at early return : true", __chemda_466_332);
	test("variant destruction at early return : false", __chemda_516_333);
	test("variant conditional destruction : true", __chemda_573_334);
	test("variant conditional destruction : false", __chemda_523_335);
}
union IntDoubleUnion {
	int a;
	double b;
};
union TwoStructs {
	struct {
		int* data;
		long long length;
	} First;
	struct {
		int data;
		int length;
	} Second;
};
static void test_unions();
static _Bool __chemda_893_336(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	union IntDoubleUnion u;
	u.a = 5;
	return (u.a == 5);
}
static _Bool __chemda_213_337(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	union IntDoubleUnion u;
	u.b = 1.200000;
	return (u.b == 1.200000);
}
static _Bool __chemda_402_338(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	union TwoStructs tu;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int y = 55;
	tu.First.data = &y;
	tu.First.length = 345678;
	return ((*tu.First.data == 55) && (tu.First.length == 345678));
}
static _Bool __chemda_245_339(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	union TwoStructs tu;
	tu.Second.data = 123;
	tu.Second.length = 456;
	return ((tu.Second.data == 123) && (tu.Second.length == 456));
}
static void test_unions(){
	test("test that int float union works - 1", __chemda_893_336);
	test("test that int float union works - 2", __chemda_213_337);
	test("test a complex union of two structs - 1", __chemda_402_338);
	test("test a complex union of two structs - 2", __chemda_245_339);
}
struct coolPair2 {
	int a;
	int b;
};
static int coolpair2_sum_call(struct coolPair2* p);
static int coolpair2_sum(struct coolPair2* p);
typedef int coolkinda_int;
static int coolpair2_ext_sum(struct coolPair2* p);
static int coolpair2_indirect_mul(struct coolPair2* p);
static int coolpair2_mul(struct coolPair2* p);
static int closed_brobring_me_in();
static int all_closedcheck_im_closed();
static void test_namespaces();
static _Bool __chemda_129_340(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct coolPair2 p = {.a = 1, .b = 2, };
	return ((p.a == 1) && (p.b == 2));
}
static _Bool __chemda_956_341(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct coolPair2 p;
	p.a = 1;
	p.b = 2;
	return ((p.a == 1) && (p.b == 2));
}
static _Bool __chemda_629_342(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct coolPair2 p = {.a = 1, .b = 2, };
	return (coolpair2_sum(&p) == 3);
}
static _Bool __chemda_437_343(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct coolPair2 p = {.a = 1, .b = 2, };
	return (coolpair2_mul(&p) == 2);
}
static _Bool __chemda_586_344(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct coolPair2 p = {.a = 1, .b = 2, };
	return (coolpair2_indirect_mul(&p) == 2);
}
static _Bool __chemda_205_345(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct coolPair2 p = {.a = 1, .b = 2, };
	return (coolpair2_ext_sum(&p) == 3);
}
static _Bool __chemda_999_346(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int t;
	t = 5;
	return (t == 5);
}
static _Bool __chemda_131_347(){
	return (all_closedcheck_im_closed() == 22);
}
static _Bool __chemda_917_348(){
	return (closed_brobring_me_in() == 11);
}
static int coolpair2_sum_call(struct coolPair2* p){
	return coolpair2_sum(p);;
}
static int coolpair2_sum(struct coolPair2* p){
	return (p->a + p->b);
}
static int coolpair2_ext_sum(struct coolPair2* p){
	return coolpair2_sum(p);;
}
static int coolpair2_indirect_mul(struct coolPair2* p){
	return coolpair2_mul(p);;
}
static int coolpair2_mul(struct coolPair2* p){
	return (p->a * p->b);
}
static int closed_brobring_me_in(){
	return 11;
}
static int all_closedcheck_im_closed(){
	return 22;
}
static void test_namespaces(){
	test("test that namespace structs work", __chemda_129_340);
	test("test that namespace structs work without values", __chemda_956_341);
	test("test that namespace functions can call each other", __chemda_629_342);
	test("test that namespace extended functions work - 1", __chemda_437_343);
	test("test that namespace extended functions work - 2", __chemda_586_344);
	test("test that namespace extended functions work - 3", __chemda_205_345);
	test("test typealias from namespace works", __chemda_999_346);
	test("test using statement can bring identifier into current scope - 2", __chemda_131_347);
	test("test using statement can bring identifier into current scope - 2", __chemda_917_348);
}
struct Pair66 {
	int a;
	int b;
};
static void Pair66first(struct Pair66* __chx_struct_ret_param_xx);
static void Pair66second(struct Pair66* __chx_struct_ret_param_xx);
static int Pair66sum(struct Pair66* self);
static int runtime_sum(int a, int b);
static void ret_struct_boi(struct Pair66* __chx_struct_ret_param_xx);
static void ret_struct_comptime(struct Pair66* __chx_struct_ret_param_xx);
static void ret_struct_comptime_b(struct Pair66* __chx_struct_ret_param_xx);
static void ret_struct_implicit(struct Pair66* __chx_struct_ret_param_xx);
static void ret_struct_implicit_b(struct Pair66* __chx_struct_ret_param_xx);
struct CompTimeCounter {
};
static void CompTimeCounteractual(struct CompTimeCounter* __chx_struct_ret_param_xx, int* thing, int inc);
static void test_comptime();
static _Bool __chemda_779_349(){
	return (9 == 9);
}
static _Bool __chemda_356_350(){
	/** visiting var init in before **/
	struct Pair66 pair;
	struct Pair66 __chx__lv__1;
	/** var_init defining the value **/
	pair = (struct Pair66){.a = 33, .b = 11, };;
	return ((pair.a == 33) && (pair.b == 11));
}
static _Bool __chemda_374_351(){
	/** visiting var init in before **/
	struct Pair66 pair;
	struct Pair66 __chx__lv__2;
	/** var_init defining the value **/
	pair = (struct Pair66){.a = 33, .b = 11, };;
	return ((pair.a == 33) && (pair.b == 11));
}
static _Bool __chemda_883_352(){
	return (44 == 44);
}
static _Bool __chemda_839_353(){
	/** visiting var init in before **/
	struct Pair66 p;
	struct Pair66 __chx__lv__4;
	/** var_init defining the value **/
	p = (struct Pair66){.a = 10, .b = 10, };;
	return ((p.a == 10) && (p.b == 10));
}
static _Bool __chemda_364_354(){
	/** visiting var init in before **/
	struct Pair66 p;
	struct Pair66 __chx__lv__5;
	/** var_init defining the value **/
	p = (struct Pair66){.a = 5, .b = 5, };;
	return ((p.a == 5) && (p.b == 5));
}
static _Bool __chemda_948_355(){
	/** visiting var init in before **/
	struct Pair66 p;
	/** function call being taken out that returns struct **/
	Pair66first(&p);
	/** var_init defining the value **/
	p;
	return ((p.a == 15) && (p.b == 15));
}
static _Bool __chemda_157_356(){
	/** visiting var init in before **/
	struct Pair66 p;
	/** function call being taken out that returns struct **/
	Pair66second(&p);
	/** var_init defining the value **/
	p;
	return ((p.a == 20) && (p.b == 20));
}
static _Bool __chemda_709_357(){
	return (5 == 5);
}
static _Bool __chemda_572_358(){
	return (runtime_sum(40, 40) == 80);
}
static _Bool __chemda_949_359(){
	/** visiting var init in before **/
	struct Pair66 p;
	/** function call being taken out that returns struct **/
	ret_struct_boi(&p);
	/** var_init defining the value **/
	
	return ((p.a == 343) && (p.b == 979));
}
static _Bool __chemda_298_360(){
	return (10 == 10);
}
static _Bool __chemda_981_361(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int prim = 10;
	return (prim == 10);
}
static _Bool __chemda_281_362(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 0;
	/** visiting var init in before **/
	struct CompTimeCounter c;
	/** function call being taken out that returns struct **/
	CompTimeCounteractual(&c, &i, 1);
	/** var_init defining the value **/
	c;
	return (i == 1);
}
static _Bool __chemda_660_363(){
	/** visiting var init in before **/
	struct Pair66 d;
	/** function call being taken out that returns struct **/
	ret_struct_comptime(&d);
	/** var_init defining the value **/
	
	return ((d.a == 15) && (d.b == 15));
}
static _Bool __chemda_705_364(){
	/** visiting var init in before **/
	struct Pair66 d;
	/** function call being taken out that returns struct **/
	ret_struct_comptime_b(&d);
	/** var_init defining the value **/
	
	return ((d.a == 20) && (d.b == 20));
}
static _Bool __chemda_150_365(){
	/** visiting var init in before **/
	struct Pair66 d;
	/** function call being taken out that returns struct **/
	ret_struct_implicit(&d);
	/** var_init defining the value **/
	
	return ((d.a == 15) && (d.b == 15));
}
static _Bool __chemda_718_366(){
	/** visiting var init in before **/
	struct Pair66 d;
	/** function call being taken out that returns struct **/
	ret_struct_implicit_b(&d);
	/** var_init defining the value **/
	
	return ((d.a == 20) && (d.b == 20));
}
static void Pair66first(struct Pair66* __chx_struct_ret_param_xx){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Pair66* this = ((struct Pair66*) __chx_struct_ret_param_xx);
	this->a = 15;
	this->b = 15;
}
static void Pair66second(struct Pair66* __chx_struct_ret_param_xx){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Pair66* this = ((struct Pair66*) __chx_struct_ret_param_xx);
	this->a = 20;
	this->b = 20;
}
static int Pair66sum(struct Pair66* self){
	return (self->a + self->b);
}
static int runtime_sum(int a, int b){
	return (a + b);
}
static void ret_struct_boi(struct Pair66* __chx_struct_ret_param_xx){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct Pair66* p = ((struct Pair66*) __chx_struct_ret_param_xx);
	p->a = 343;
	p->b = 979;
	return;
}
static void ret_struct_comptime(struct Pair66* __chx_struct_ret_param_xx){
	struct Pair66 __chx__lv__21;
	/** function call being taken out that returns struct **/
	Pair66first(&__chx__lv__21);
	*__chx_struct_ret_param_xx = __chx__lv__21;;;
}
static void ret_struct_comptime_b(struct Pair66* __chx_struct_ret_param_xx){
	struct Pair66 __chx__lv__23;
	/** function call being taken out that returns struct **/
	Pair66second(&__chx__lv__23);
	*__chx_struct_ret_param_xx = __chx__lv__23;;;
}
static void ret_struct_implicit(struct Pair66* __chx_struct_ret_param_xx){
	struct Pair66 __chx__lv__25;
	/** function call being taken out that returns struct **/
	Pair66first(&__chx__lv__25);
	*__chx_struct_ret_param_xx = __chx__lv__25;;;
}
static void ret_struct_implicit_b(struct Pair66* __chx_struct_ret_param_xx){
	struct Pair66 __chx__lv__27;
	/** function call being taken out that returns struct **/
	Pair66second(&__chx__lv__27);
	*__chx_struct_ret_param_xx = __chx__lv__27;;;
}
static void CompTimeCounteractual(struct CompTimeCounter* __chx_struct_ret_param_xx, int* thing, int inc){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct CompTimeCounter* this = ((struct CompTimeCounter*) __chx_struct_ret_param_xx);
	*thing = (*thing + inc);
}
static void test_comptime(){
	test("test comptime sum works", __chemda_779_349);
	test("test comptime function can return struct", __chemda_356_350);
	test("test comptime function can return struct from a reference", __chemda_374_351);
	test("test comptime function can call struct functions", __chemda_883_352);
	test("test comptime constructor function can be called", __chemda_839_353);
	test("test that appropriate comptime constructor function is selected", __chemda_364_354);
	test("test comptime constructor can delegate to actual constructor - 1", __chemda_948_355);
	test("test comptime constructor can delegate to actual constructor - 2", __chemda_157_356);
	test("determine string length, using comptime", __chemda_709_357);
	test("compiler wrap functionally works", __chemda_572_358);
	test("can gain access to implicitly passed struct", __chemda_949_359);
	test("test comptime functions returning primitive work", __chemda_298_360);
	test("test comptime functions returning primitive can be stored", __chemda_981_361);
	test("test comptime delegated constructor get's called once", __chemda_281_362);
	test("comptime constructor initialized struct can be returned - 1", __chemda_660_363);
	test("comptime constructor initialized struct can be returned - 2", __chemda_705_364);
	test("comptime constructor can be implicit - 1", __chemda_150_365);
	test("comptime constructor can be implicit - 2", __chemda_718_366);
}
static void test_compiler_vector();
static _Bool __chemda_553_367(){
	return (50 == 50);
}
static _Bool __chemda_714_368(){
	return (50 == 50);
}
static void test_compiler_vector(){
	test("test that compiler vector works", __chemda_553_367);
	test("test that compiler vector works with longs", __chemda_714_368);
}
extern int check_external_sum(int a, int b);
static void test_external_functions();
static _Bool __chemda_513_369(){
	return (check_external_sum(80, 20) == 100);
}
static void test_external_functions(){
	test("test external sum function is available", __chemda_513_369);
}
struct OtherGen9__cgs__0 {
	int value;
};
static void get_other_gen(struct OtherGen9__cgs__0* __chx_struct_ret_param_xx, int val);
static int get_other_gen_value(struct OtherGen9__cgs__0* t);
struct OtherVar1__cgs__0 {
	int __chx__vt_621827;
	union {
		struct {
			int value;
		} Some;
		struct {
		} None;
	};
};
static void get_other_var1(struct OtherVar1__cgs__0* __chx_struct_ret_param_xx, int value, _Bool some);
static int get_other_var1_value(struct OtherVar1__cgs__0* other);
static void get_other_gen(struct OtherGen9__cgs__0* __chx_struct_ret_param_xx, int val){
	__chx_struct_ret_param_xx->value = val;
}
static int get_other_gen_value(struct OtherGen9__cgs__0* t){
	return t->value;
}
static void get_other_var1(struct OtherVar1__cgs__0* __chx_struct_ret_param_xx, int value, _Bool some){
	if(some){
		struct OtherVar1__cgs__0 __chx__lv__0 = { 0, .Some.value = value, };
		*__chx_struct_ret_param_xx = __chx__lv__0;
	} else {
		struct OtherVar1__cgs__0 __chx__lv__1 = { 1, };
		*__chx_struct_ret_param_xx = __chx__lv__1;
	}
}
static int get_other_var1_value(struct OtherVar1__cgs__0* other){
	switch(other->__chx__vt_621827) {
		case 0:
			return other->Some.value;
			break;
		case 1:
			return -1;
			break;
	}
}
struct OtherGen9__cgs__1 {
	long long value;
};
struct OV1Point {
	int a;
	int b;
	int c;
};
struct OtherVar1__cgs__1 {
	int __chx__vt_621827;
	union {
		struct {
			struct OV1Point value;
		} Some;
		struct {
		} None;
	};
};
static int gen_sum(int a, int b);
static long long gen_sum__cgf_1(long long a, long long b);
static _Bool is_this_60(long long thing);
struct PairGen__cgs__0 {
	int a;
	int b;
};
static int PairGen__cgs__0add(struct PairGen__cgs__0* self);
struct PairGen__cgs__1 {
	long long a;
	long long b;
};
static long long PairGen__cgs__1add(struct PairGen__cgs__1* self);
struct PairGen__cgs__2 {
	short a;
	short b;
};
static short PairGen__cgs__2add(struct PairGen__cgs__2* self);
static void create_pair_gen(struct PairGen__cgs__0* __chx_struct_ret_param_xx);
static void create_pair_gen_long(struct PairGen__cgs__1* __chx_struct_ret_param_xx);
static int mul_int_pair(struct PairGen__cgs__0* pair_gen);
static short ext_div(struct PairGen__cgs__2* pair);
struct ShortPairGen {
	struct PairGen__cgs__2 pair;
};
static void ShortPairGenmake(struct ShortPairGen* __chx_struct_ret_param_xx);
static short ShortPairGenadd(struct ShortPairGen* self);
static void get_other_gen_long(struct OtherGen9__cgs__1* __chx_struct_ret_param_xx, long long val);
static long long get_other_gen_long_value(struct OtherGen9__cgs__1* t);
static void get_other_var1_point(struct OtherVar1__cgs__1* __chx_struct_ret_param_xx, int value, _Bool some);
static int get_other_var1_point_value(struct OtherVar1__cgs__1* other);
static void test_basic_generics();
static _Bool __chemda_203_370(){
	return (gen_sum(10, 20) == 30);
}
static _Bool __chemda_334_371(){
	return (gen_sum__cgf_1(20, 20) == 40);
}
static _Bool __chemda_914_372(){
	return is_this_60(gen_sum__cgf_1(30, 30));;
}
static _Bool __chemda_434_373(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	long long i = gen_sum__cgf_1(30, 40);;
	return (i == 70);
}
static _Bool __chemda_168_374(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct PairGen__cgs__0 p = {.a = 10, .b = 12, };
	return (PairGen__cgs__0add(&p) == 22);
}
static _Bool __chemda_789_375(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct PairGen__cgs__1 p = {.a = 20, .b = 15, };
	return (PairGen__cgs__1add(&p) == 35);
}
static _Bool __chemda_145_376(){
	/** visiting var init in before **/
	struct ShortPairGen p;
	/** function call being taken out that returns struct **/
	ShortPairGenmake(&p);
	/** var_init defining the value **/
	
	return (ShortPairGenadd(&p) == 43);
}
static _Bool __chemda_263_377(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct ShortPairGen p = {.pair = {.a = 20, .b = 41, }, };
	return ((ShortPairGenadd(&p) == 61) && (PairGen__cgs__2add(&p.pair) == 61));
}
static _Bool __chemda_498_378(){
	struct PairGen__cgs__0 __chx__lv__1 = {.a = 2, .b = 9, };
	return (mul_int_pair(&__chx__lv__1) == 18);
}
static _Bool __chemda_174_379(){
	/** visiting var init in before **/
	struct PairGen__cgs__0 p;
	/** function call being taken out that returns struct **/
	create_pair_gen(&p);
	/** var_init defining the value **/
	
	return (PairGen__cgs__0add(&p) == 25);
}
static _Bool __chemda_980_380(){
	/** visiting var init in before **/
	struct PairGen__cgs__1 p;
	/** function call being taken out that returns struct **/
	create_pair_gen_long(&p);
	/** var_init defining the value **/
	
	return (PairGen__cgs__1add(&p) == 26);
}
static _Bool __chemda_813_381(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct PairGen__cgs__2 p = {.a = 56, .b = 7, };
	return (ext_div(&p) == 8);
}
static _Bool __chemda_588_382(){
	/** visiting var init in before **/
	struct OtherGen9__cgs__0 g;
	/** function call being taken out that returns struct **/
	get_other_gen(&g, 20);
	/** var_init defining the value **/
	
	return (get_other_gen_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/g) == 20);
}
static _Bool __chemda_301_383(){
	/** visiting var init in before **/
	struct OtherGen9__cgs__1 g;
	/** function call being taken out that returns struct **/
	get_other_gen_long(&g, 22);
	/** var_init defining the value **/
	
	return (get_other_gen_long_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/g) == 22);
}
static _Bool __chemda_547_384(){
	/** visiting var init in before **/
	struct OtherVar1__cgs__0 g;
	/** function call being taken out that returns struct **/
	get_other_var1(&g, 10, 1);
	/** var_init defining the value **/
	
	return (get_other_var1_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/g) == 10);
}
static _Bool __chemda_478_385(){
	/** visiting var init in before **/
	struct OtherVar1__cgs__0 g;
	/** function call being taken out that returns struct **/
	get_other_var1(&g, 10, 0);
	/** var_init defining the value **/
	
	return (get_other_var1_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/g) == -1);
}
static _Bool __chemda_102_386(){
	/** visiting var init in before **/
	struct OtherVar1__cgs__1 g;
	/** function call being taken out that returns struct **/
	get_other_var1_point(&g, 10, 1);
	/** var_init defining the value **/
	
	return (get_other_var1_point_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/g) == 30);
}
static _Bool __chemda_198_387(){
	/** visiting var init in before **/
	struct OtherVar1__cgs__1 g;
	/** function call being taken out that returns struct **/
	get_other_var1_point(&g, 10, 0);
	/** var_init defining the value **/
	
	return (get_other_var1_point_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/g) == -1);
}
static int gen_sum(int a, int b){
	return (a + b);
}
static long long gen_sum__cgf_1(long long a, long long b){
	return (a + b);
}
static _Bool is_this_60(long long thing){
	return (thing == 60);
}
static int PairGen__cgs__0add(struct PairGen__cgs__0* self){
	return (self->a + self->b);
}
static long long PairGen__cgs__1add(struct PairGen__cgs__1* self){
	return (self->a + self->b);
}
static short PairGen__cgs__2add(struct PairGen__cgs__2* self){
	return (self->a + self->b);
}
static void create_pair_gen(struct PairGen__cgs__0* __chx_struct_ret_param_xx){
	__chx_struct_ret_param_xx->a = 12;
	__chx_struct_ret_param_xx->b = 13;
}
static void create_pair_gen_long(struct PairGen__cgs__1* __chx_struct_ret_param_xx){
	__chx_struct_ret_param_xx->a = 12;
	__chx_struct_ret_param_xx->b = 14;
}
static int mul_int_pair(struct PairGen__cgs__0* pair_gen){
	return (pair_gen->a * pair_gen->b);
}
static short ext_div(struct PairGen__cgs__2* pair){
	return (pair->a / pair->b);
}
static void ShortPairGenmake(struct ShortPairGen* __chx_struct_ret_param_xx){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct ShortPairGen* this = ((struct ShortPairGen*) __chx_struct_ret_param_xx);
	this->pair.a = 33;
	this->pair.b = 10;
}
static short ShortPairGenadd(struct ShortPairGen* self){
	return PairGen__cgs__2add(&self->pair);;
}
static void get_other_gen_long(struct OtherGen9__cgs__1* __chx_struct_ret_param_xx, long long val){
	__chx_struct_ret_param_xx->value = val;
}
static long long get_other_gen_long_value(struct OtherGen9__cgs__1* t){
	return t->value;
}
static void get_other_var1_point(struct OtherVar1__cgs__1* __chx_struct_ret_param_xx, int value, _Bool some){
	if(some){
		struct OtherVar1__cgs__1 __chx__lv__10 = { 0, .Some.value = {.a = value, .b = value, .c = value, }, };
		*__chx_struct_ret_param_xx = __chx__lv__10;
	} else {
		struct OtherVar1__cgs__1 __chx__lv__11 = { 1, };
		*__chx_struct_ret_param_xx = __chx__lv__11;
	}
}
static int get_other_var1_point_value(struct OtherVar1__cgs__1* other){
	switch(other->__chx__vt_621827) {
		case 0:
			return ((other->Some.value.a + other->Some.value.b) + other->Some.value.c);
			break;
		case 1:
			return -1;
			break;
	}
}
static void test_basic_generics(){
	test("test that basic generic function with no generic args works", __chemda_203_370);
	test("test that basic generic function with generic args works", __chemda_334_371);
	test("test that generic functions can be called inside other calls", __chemda_914_372);
	test("test that generic functions result can be saved into variables", __chemda_434_373);
	test("test that generic struct works - 1", __chemda_168_374);
	test("test that generic struct works - 2", __chemda_789_375);
	test("generic struct can be stored in another struct - 1", __chemda_145_376);
	test("generic struct can be stored in another struct - 2", __chemda_263_377);
	test("generic struct can be passed as function arg", __chemda_498_378);
	test("generic structs can be returned - 1", __chemda_174_379);
	test("generic structs can be returned - 2", __chemda_980_380);
	test("extension functions work on generic nodes", __chemda_813_381);
	test("generic structs declared and used from other files work - 1", __chemda_588_382);
	test("generic structs declared and used from other files work - 2", __chemda_301_383);
	test("generic variants declared and used from other files work - 1", __chemda_547_384);
	test("generic variants declared and used from other files work - 2", __chemda_478_385);
	test("generic variants declared and used from other files work - 3", __chemda_102_386);
	test("generic variants declared and used from other files work - 4", __chemda_198_387);
}
static int deduce_gen_sum(int a, int b);
static long long deduce_gen_sum__cgf_1(long long a, long long b);
struct DeduceThing__cgs__0 {
	int t;
};
struct DeduceThing__cgs__1 {
	long long t;
};
static int deduce_thing(struct DeduceThing__cgs__0* thing);
static long long deduce_thing__cgf_1(struct DeduceThing__cgs__1* thing);
static int give_gen_ret(int a, int b);
static long long give_gen_ret__cgf_1(int a, int b);
static int take_gen_ret(int sum);
static long long take_gen_ret_long(long long sum);
static void test_generic_type_deduction();
static _Bool __chemda_896_388(){
	return (deduce_gen_sum(10, 10) == 20);
}
static _Bool __chemda_287_389(){
	return (deduce_gen_sum__cgf_1(10, 10) == 20);
}
static _Bool __chemda_502_390(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct DeduceThing__cgs__0 s = {.t = 20, };
	return (deduce_thing(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/s) == 20);
}
static _Bool __chemda_995_391(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct DeduceThing__cgs__1 s = {.t = 40, };
	return (deduce_thing__cgf_1(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/s) == 40);
}
static _Bool __chemda_873_392(){
	return (take_gen_ret(give_gen_ret(16, 16)) == 42);
}
static _Bool __chemda_363_393(){
	return (take_gen_ret_long(give_gen_ret__cgf_1(15, 15)) == 50);
}
static int deduce_gen_sum(int a, int b){
	return (a + b);
}
static long long deduce_gen_sum__cgf_1(long long a, long long b){
	return (a + b);
}
static int deduce_thing(struct DeduceThing__cgs__0* thing){
	return thing->t;
}
static long long deduce_thing__cgf_1(struct DeduceThing__cgs__1* thing){
	return thing->t;
}
static int give_gen_ret(int a, int b){
	return (a + b);
}
static long long give_gen_ret__cgf_1(int a, int b){
	return (a + b);
}
static int take_gen_ret(int sum){
	return (sum + 10);
}
static long long take_gen_ret_long(long long sum){
	return (sum + 20);
}
static void test_generic_type_deduction(){
	test("generic function call without types work", __chemda_896_388);
	test("generic function call with types work", __chemda_287_389);
	test("nested generic type parameters can be deduced in function call", __chemda_502_390);
	test("nested generic type parameters can be deduced in function call", __chemda_995_391);
	test("generic return type can be deduced when in function call - 1", __chemda_873_392);
	test("generic return type can be deduced when in function call - 2", __chemda_363_393);
}
struct vector__cgs__0 {
	int* data_ptr;
	size_t data_size;
	size_t data_cap;
};
static void vector__cgs__0make(struct vector__cgs__0* __chx_struct_ret_param_xx);
static void vector__cgs__0make_with_capacity(struct vector__cgs__0* __chx_struct_ret_param_xx, size_t init_cap);
static void vector__cgs__0resize(struct vector__cgs__0* self, size_t new_cap);
static void vector__cgs__0push(struct vector__cgs__0* self, int value);
static int vector__cgs__0get(struct vector__cgs__0* self, size_t index);
static void vector__cgs__0set(struct vector__cgs__0* self, size_t index, int value);
static size_t vector__cgs__0size(struct vector__cgs__0* self);
static size_t vector__cgs__0capacity(struct vector__cgs__0* self);
static int* vector__cgs__0data(struct vector__cgs__0* self);
static void vector__cgs__0remove(struct vector__cgs__0* self, size_t index);
static void vector__cgs__0remove_last(struct vector__cgs__0* self);
static void vector__cgs__0clear(struct vector__cgs__0* self);
static void vector__cgs__0delete(struct vector__cgs__0* self);
struct vector__cgs__1 {
	long long* data_ptr;
	size_t data_size;
	size_t data_cap;
};
static void vector__cgs__1make(struct vector__cgs__1* __chx_struct_ret_param_xx);
static void vector__cgs__1make_with_capacity(struct vector__cgs__1* __chx_struct_ret_param_xx, size_t init_cap);
static void vector__cgs__1resize(struct vector__cgs__1* self, size_t new_cap);
static void vector__cgs__1push(struct vector__cgs__1* self, long long value);
static long long vector__cgs__1get(struct vector__cgs__1* self, size_t index);
static void vector__cgs__1set(struct vector__cgs__1* self, size_t index, long long value);
static size_t vector__cgs__1size(struct vector__cgs__1* self);
static size_t vector__cgs__1capacity(struct vector__cgs__1* self);
static long long* vector__cgs__1data(struct vector__cgs__1* self);
static void vector__cgs__1remove(struct vector__cgs__1* self, size_t index);
static void vector__cgs__1remove_last(struct vector__cgs__1* self);
static void vector__cgs__1clear(struct vector__cgs__1* self);
static void vector__cgs__1delete(struct vector__cgs__1* self);
static void vector__cgs__0make(struct vector__cgs__0* __chx_struct_ret_param_xx){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct vector__cgs__0* this = ((struct vector__cgs__0*) __chx_struct_ret_param_xx);
	this->data_ptr = malloc((sizeof(int) * 2));;
	this->data_size = 0;
	this->data_cap = 2;
}
static void vector__cgs__0make_with_capacity(struct vector__cgs__0* __chx_struct_ret_param_xx, size_t init_cap){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct vector__cgs__0* this = ((struct vector__cgs__0*) __chx_struct_ret_param_xx);
	this->data_ptr = malloc((sizeof(int) * init_cap));;
	this->data_size = 0;
	this->data_cap = init_cap;
}
static void vector__cgs__0resize(struct vector__cgs__0* self, size_t new_cap){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int* new_data = ((int*) realloc(self->data_ptr, (sizeof(int) * new_cap)));
	if((new_data != NULL)){
		self->data_ptr = new_data;
		self->data_cap = new_cap;
	} else {
		printf("failed to resize vector to a capacity of %d\n", new_cap);
	}
}
static void vector__cgs__0push(struct vector__cgs__0* self, int value){
	/** visiting var init in before **/
	/** var_init defining the value **/
	size_t s = self->data_size;
	if((s >= self->data_cap)){
		vector__cgs__0resize(self,(self->data_cap * 2));
	}
	self->data_ptr[s] = value;
	self->data_size = (s + 1);
}
static int vector__cgs__0get(struct vector__cgs__0* self, size_t index){
	return self->data_ptr[index];
}
static void vector__cgs__0set(struct vector__cgs__0* self, size_t index, int value){
	self->data_ptr[index] = value;
}
static size_t vector__cgs__0size(struct vector__cgs__0* self){
	return self->data_size;
}
static size_t vector__cgs__0capacity(struct vector__cgs__0* self){
	return self->data_cap;
}
static int* vector__cgs__0data(struct vector__cgs__0* self){
	return self->data_ptr;
}
static void vector__cgs__0remove(struct vector__cgs__0* self, size_t index){
	/** visiting var init in before **/
	/** var_init defining the value **/
	size_t s = self->data_size;
	/** visiting var init in before **/
	/** var_init defining the value **/
	size_t last = (s - 1);
	if((index == last)){
		self->data_size = last;
	} else {
		/** visiting var init in before **/
		for(/** var_init defining the value **/
		size_t i = index;(i < last);i += 1){
			self->data_ptr[i] = self->data_ptr[(i + 1)];
		}
		self->data_size = last;
	}
}
static void vector__cgs__0remove_last(struct vector__cgs__0* self){
	/** visiting var init in before **/
	/** var_init defining the value **/
	size_t s = self->data_size;
	/** visiting var init in before **/
	/** var_init defining the value **/
	size_t last = (s - 1);
	self->data_size = last;
}
static void vector__cgs__0clear(struct vector__cgs__0* self){
	self->data_size = 0;
}
static void vector__cgs__0delete(struct vector__cgs__0* self){
	free(self->data_ptr);
	self->data_ptr = NULL;
	self->data_size = 0;
	self->data_cap = 0;
	__chx__dstctr_clnup_blk__:{
	}
}
static void vector__cgs__1make(struct vector__cgs__1* __chx_struct_ret_param_xx){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct vector__cgs__1* this = ((struct vector__cgs__1*) __chx_struct_ret_param_xx);
	this->data_ptr = malloc((sizeof(long long) * 2));;
	this->data_size = 0;
	this->data_cap = 2;
}
static void vector__cgs__1make_with_capacity(struct vector__cgs__1* __chx_struct_ret_param_xx, size_t init_cap){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct vector__cgs__1* this = ((struct vector__cgs__1*) __chx_struct_ret_param_xx);
	this->data_ptr = malloc((sizeof(long long) * init_cap));;
	this->data_size = 0;
	this->data_cap = init_cap;
}
static void vector__cgs__1resize(struct vector__cgs__1* self, size_t new_cap){
	/** visiting var init in before **/
	/** var_init defining the value **/
	long long* new_data = ((long long*) realloc(self->data_ptr, (sizeof(long long) * new_cap)));
	if((new_data != NULL)){
		self->data_ptr = new_data;
		self->data_cap = new_cap;
	} else {
		printf("failed to resize vector to a capacity of %d\n", new_cap);
	}
}
static void vector__cgs__1push(struct vector__cgs__1* self, long long value){
	/** visiting var init in before **/
	/** var_init defining the value **/
	size_t s = self->data_size;
	if((s >= self->data_cap)){
		vector__cgs__1resize(self,(self->data_cap * 2));
	}
	self->data_ptr[s] = value;
	self->data_size = (s + 1);
}
static long long vector__cgs__1get(struct vector__cgs__1* self, size_t index){
	return self->data_ptr[index];
}
static void vector__cgs__1set(struct vector__cgs__1* self, size_t index, long long value){
	self->data_ptr[index] = value;
}
static size_t vector__cgs__1size(struct vector__cgs__1* self){
	return self->data_size;
}
static size_t vector__cgs__1capacity(struct vector__cgs__1* self){
	return self->data_cap;
}
static long long* vector__cgs__1data(struct vector__cgs__1* self){
	return self->data_ptr;
}
static void vector__cgs__1remove(struct vector__cgs__1* self, size_t index){
	/** visiting var init in before **/
	/** var_init defining the value **/
	size_t s = self->data_size;
	/** visiting var init in before **/
	/** var_init defining the value **/
	size_t last = (s - 1);
	if((index == last)){
		self->data_size = last;
	} else {
		/** visiting var init in before **/
		for(/** var_init defining the value **/
		size_t i = index;(i < last);i += 1){
			self->data_ptr[i] = self->data_ptr[(i + 1)];
		}
		self->data_size = last;
	}
}
static void vector__cgs__1remove_last(struct vector__cgs__1* self){
	/** visiting var init in before **/
	/** var_init defining the value **/
	size_t s = self->data_size;
	/** visiting var init in before **/
	/** var_init defining the value **/
	size_t last = (s - 1);
	self->data_size = last;
}
static void vector__cgs__1clear(struct vector__cgs__1* self){
	self->data_size = 0;
}
static void vector__cgs__1delete(struct vector__cgs__1* self){
	free(self->data_ptr);
	self->data_ptr = NULL;
	self->data_size = 0;
	self->data_cap = 0;
	__chx__dstctr_clnup_blk__:{
	}
}
static void test_vectors();
static _Bool __chemda_215_394(){
	/** visiting var init in before **/
	struct vector__cgs__1 v;
	/** function call being taken out that returns struct **/
	vector__cgs__1make(&v);
	/** var_init defining the value **/
	
	vector__cgs__0push(&v,10);
	vector__cgs__0push(&v,20);
	const _Bool __chx_ret_val_res = (((vector__cgs__0size(&v) == 2) && (vector__cgs__0get(&v,0) == 10)) && (vector__cgs__0get(&v,1) == 20));
	vector__cgs__0delete(&v);
	return __chx_ret_val_res;
}
static _Bool __chemda_825_395(){
	/** visiting var init in before **/
	struct vector__cgs__1 v;
	/** function call being taken out that returns struct **/
	vector__cgs__1make(&v);
	/** var_init defining the value **/
	
	vector__cgs__1push(&v,10);
	vector__cgs__1push(&v,20);
	const _Bool __chx_ret_val_res = (((vector__cgs__1size(&v) == 2) && (vector__cgs__1get(&v,0) == 10)) && (vector__cgs__1get(&v,1) == 20));
	vector__cgs__1delete(&v);
	return __chx_ret_val_res;
}
static _Bool __chemda_590_396(){
	/** visiting var init in before **/
	struct vector__cgs__1 v;
	/** function call being taken out that returns struct **/
	vector__cgs__1make(&v);
	/** var_init defining the value **/
	
	vector__cgs__0push(&v,10);
	vector__cgs__0push(&v,20);
	vector__cgs__0remove_last(&v);
	const _Bool __chx_ret_val_res = ((vector__cgs__0size(&v) == 1) && (vector__cgs__0get(&v,0) == 10));
	vector__cgs__0delete(&v);
	return __chx_ret_val_res;
}
static _Bool __chemda_193_397(){
	/** visiting var init in before **/
	struct vector__cgs__1 v;
	/** function call being taken out that returns struct **/
	vector__cgs__1make(&v);
	/** var_init defining the value **/
	
	vector__cgs__0push(&v,10);
	vector__cgs__0push(&v,20);
	vector__cgs__0remove(&v,0);
	const _Bool __chx_ret_val_res = ((vector__cgs__0size(&v) == 1) && (vector__cgs__0get(&v,0) == 20));
	vector__cgs__0delete(&v);
	return __chx_ret_val_res;
}
static _Bool __chemda_247_398(){
	/** visiting var init in before **/
	struct vector__cgs__1 v;
	/** function call being taken out that returns struct **/
	vector__cgs__1make(&v);
	/** var_init defining the value **/
	
	/** visiting var init in before **/
	/** var_init defining the value **/
	int i = 10;
	/** visiting var init in before **/
	/** var_init defining the value **/
	int sum = 0;
	while((i < 300)) {
		vector__cgs__0push(&v,10);
		sum += 10;
		i += 10;
	}
	/** visiting var init in before **/
	/** var_init defining the value **/
	int act_sum = 0;
	i = 0;
	while((i < vector__cgs__0size(&v))) {
		act_sum += vector__cgs__0get(&v,i);;
		i += 1;
	}
	const _Bool __chx_ret_val_res = (sum == act_sum);
	vector__cgs__0delete(&v);
	return __chx_ret_val_res;
}
static _Bool __chemda_203_399(){
	/** visiting var init in before **/
	struct vector__cgs__1 v;
	/** function call being taken out that returns struct **/
	vector__cgs__1make(&v);
	/** var_init defining the value **/
	
	vector__cgs__0push(&v,10);
	vector__cgs__0push(&v,20);
	vector__cgs__0push(&v,30);
	vector__cgs__0push(&v,40);
	vector__cgs__0push(&v,50);
	vector__cgs__0set(&v,0, 50);
	vector__cgs__0set(&v,1, 40);
	vector__cgs__0set(&v,2, 30);
	vector__cgs__0set(&v,3, 20);
	vector__cgs__0set(&v,4, 10);
	const _Bool __chx_ret_val_res = (((((vector__cgs__0get(&v,0) == 50) && (vector__cgs__0get(&v,1) == 40)) && (vector__cgs__0get(&v,2) == 30)) && (vector__cgs__0get(&v,3) == 20)) && (vector__cgs__0get(&v,4) == 10));
	vector__cgs__0delete(&v);
	return __chx_ret_val_res;
}
static void test_vectors(){
	test("vector of ints work", __chemda_215_394);
	test("vector of longs work", __chemda_825_395);
	test("can remove last element from vector", __chemda_590_396);
	test("can remove first element from vector", __chemda_193_397);
	test("vectors work even when pushing large amount of items", __chemda_247_398);
	test("test can change vector elements at index", __chemda_203_399);
}
struct ArrayRef__cgs__0 {
	int* data;
	size_t size;
};
static void ArrayRef__cgs__0constructor(struct ArrayRef__cgs__0* __chx_struct_ret_param_xx, int* array_ptr, size_t array_size);
static void ArrayRef__cgs__0constructor(struct ArrayRef__cgs__0* __chx_struct_ret_param_xx, int* array_ptr, size_t array_size){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct ArrayRef__cgs__0* this = ((struct ArrayRef__cgs__0*) __chx_struct_ret_param_xx);
	this->data = array_ptr;
	this->size = array_size;
}
static size_t array_ref_size(struct ArrayRef__cgs__0* array);
static int array_ref_at(struct ArrayRef__cgs__0* array, int ind);
static void test_array_refs();
static _Bool __chemda_643_400(){
	struct ArrayRef__cgs__0 __chx__lv__0;
	/** function call being taken out that returns struct **/
	ArrayRef__cgs__0constructor(&__chx__lv__0, (int[]){10,20}, 2);
	return (array_ref_size(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__0) == 2);
}
static _Bool __chemda_571_401(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int arr[1] = {10};
	struct ArrayRef__cgs__0 __chx__lv__2;
	/** function call being taken out that returns struct **/
	ArrayRef__cgs__0constructor(&__chx__lv__2, arr, 1);
	return (array_ref_size(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__2) == 1);
}
static _Bool __chemda_491_402(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	int arr[1] = {10};
	struct ArrayRef__cgs__0 __chx__lv__4;
	/** function call being taken out that returns struct **/
	ArrayRef__cgs__0constructor(&__chx__lv__4, arr, 1);
	return (array_ref_at(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__4, 0) == 10);
}
static _Bool __chemda_619_403(){
	struct ArrayRef__cgs__0 __chx__lv__6;
	/** function call being taken out that returns struct **/
	ArrayRef__cgs__0constructor(&__chx__lv__6, (int[]){10,20,30}, 3);
	struct ArrayRef__cgs__0 __chx__lv__8;
	/** function call being taken out that returns struct **/
	ArrayRef__cgs__0constructor(&__chx__lv__8, (int[]){10,20,30}, 3);
	return ((array_ref_at(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__6, 2) == 30) && (array_ref_at(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__8, 1) == 20));
}
static _Bool __chemda_548_404(){
	/** visiting var init in before **/
	struct vector__cgs__0 arr;
	/** function call being taken out that returns struct **/
	vector__cgs__0make(&arr);
	/** var_init defining the value **/
	
	vector__cgs__0push(&arr,10);
	vector__cgs__0push(&arr,20);
	vector__cgs__0push(&arr,30);
	struct ArrayRef__cgs__0 __chx__lv__11;
	/** function call being taken out that returns struct **/
	ArrayRef__cgs__0constructor(&__chx__lv__11, vector__cgs__0data(&arr), vector__cgs__0size(&arr));
	struct ArrayRef__cgs__0 __chx__lv__13;
	/** function call being taken out that returns struct **/
	ArrayRef__cgs__0constructor(&__chx__lv__13, vector__cgs__0data(&arr), vector__cgs__0size(&arr));
	const _Bool __chx_ret_val_res = ((array_ref_at(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__11, 2) == 30) && (array_ref_at(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__13, 1) == 20));
	vector__cgs__0delete(&arr);
	return __chx_ret_val_res;
}
static _Bool __chemda_394_405(){
	/** visiting var init in before **/
	struct vector__cgs__0 arr;
	/** function call being taken out that returns struct **/
	vector__cgs__0make(&arr);
	/** var_init defining the value **/
	
	vector__cgs__0push(&arr,10);
	struct ArrayRef__cgs__0 __chx__lv__16;
	/** function call being taken out that returns struct **/
	ArrayRef__cgs__0constructor(&__chx__lv__16, vector__cgs__0data(&arr), vector__cgs__0size(&arr));
	const _Bool __chx_ret_val_res = (array_ref_size(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__16) == 1);
	vector__cgs__0delete(&arr);
	return __chx_ret_val_res;
}
static _Bool __chemda_220_406(){
	/** visiting var init in before **/
	struct vector__cgs__0 arr;
	/** function call being taken out that returns struct **/
	vector__cgs__0make(&arr);
	/** var_init defining the value **/
	
	vector__cgs__0push(&arr,10);
	struct ArrayRef__cgs__0 __chx__lv__19;
	/** function call being taken out that returns struct **/
	ArrayRef__cgs__0constructor(&__chx__lv__19, vector__cgs__0data(&arr), vector__cgs__0size(&arr));
	const _Bool __chx_ret_val_res = (array_ref_at(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__19, 0) == 10);
	vector__cgs__0delete(&arr);
	return __chx_ret_val_res;
}
static _Bool __chemda_390_407(){
	/** visiting var init in before **/
	struct vector__cgs__0 arr;
	/** function call being taken out that returns struct **/
	vector__cgs__0make(&arr);
	/** var_init defining the value **/
	
	vector__cgs__0push(&arr,10);
	vector__cgs__0push(&arr,20);
	vector__cgs__0push(&arr,30);
	struct ArrayRef__cgs__0 __chx__lv__22;
	/** function call being taken out that returns struct **/
	ArrayRef__cgs__0constructor(&__chx__lv__22, vector__cgs__0data(&arr), vector__cgs__0size(&arr));
	struct ArrayRef__cgs__0 __chx__lv__24;
	/** function call being taken out that returns struct **/
	ArrayRef__cgs__0constructor(&__chx__lv__24, vector__cgs__0data(&arr), vector__cgs__0size(&arr));
	const _Bool __chx_ret_val_res = ((array_ref_at(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__22, 2) == 30) && (array_ref_at(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/__chx__lv__24, 1) == 20));
	vector__cgs__0delete(&arr);
	return __chx_ret_val_res;
}
static size_t array_ref_size(struct ArrayRef__cgs__0* array){
	return array->size;
}
static int array_ref_at(struct ArrayRef__cgs__0* array, int ind){
	return array->data[ind];
}
static void test_array_refs(){
	test("array reference works implicitly with array values", __chemda_643_400);
	test("array reference works implicitly with referenced arrays", __chemda_571_401);
	test("array reference works implicitly with referenced arrays", __chemda_491_402);
	test("array pointer is passed properly with array values", __chemda_619_403);
	test("array pointer is passed properly with referenced vectors", __chemda_548_404);
	test("array reference works implicitly with referenced vectors", __chemda_394_405);
	test("array reference works implicitly with referenced vectors", __chemda_220_406);
	test("array pointer is passed properly with referenced vectors", __chemda_390_407);
}
struct Option__cgs__0 {
	int __chx__vt_621827;
	union {
		struct {
			int value;
		} Some;
		struct {
		} None;
	};
};
static void get_optional_int(struct Option__cgs__0* __chx_struct_ret_param_xx, _Bool some);
static int get_opt_value(struct Option__cgs__0* o);
static void test_optional_type();
static _Bool __chemda_454_408(){
	/** visiting var init in before **/
	struct Option__cgs__0 o;
	/** function call being taken out that returns struct **/
	get_optional_int(&o, 1);
	/** var_init defining the value **/
	
	return (get_opt_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/o) == 32);
}
static _Bool __chemda_660_409(){
	/** visiting var init in before **/
	struct Option__cgs__0 o;
	/** function call being taken out that returns struct **/
	get_optional_int(&o, 0);
	/** var_init defining the value **/
	
	return (get_opt_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/o) == -1);
}
static void get_optional_int(struct Option__cgs__0* __chx_struct_ret_param_xx, _Bool some){
	if(some){
		struct Option__cgs__0 __chx__lv__2 = { 0, .Some.value = 32, };
		*__chx_struct_ret_param_xx = __chx__lv__2;
	} else {
		struct Option__cgs__0 __chx__lv__3 = { 1, };
		*__chx_struct_ret_param_xx = __chx__lv__3;
	}
}
static int get_opt_value(struct Option__cgs__0* o){
	switch(o->__chx__vt_621827) {
		case 0:
			return o->Some.value;
			break;
		case 1:
			return -1;
			break;
	}
}
static void test_optional_type(){
	test("check option type works - 1", __chemda_454_408);
	test("check option type works - 2", __chemda_660_409);
}
struct Result__cgs__0 {
	int __chx__vt_621827;
	union {
		struct {
			int value;
		} Ok;
		struct {
			int error;
		} Err;
	};
};
static void get_result_int(struct Result__cgs__0* __chx_struct_ret_param_xx, _Bool some, _Bool simple);
static int get_result_value(struct Result__cgs__0* o);
static void test_result_type();
static _Bool __chemda_584_410(){
	/** visiting var init in before **/
	struct Result__cgs__0 o;
	/** function call being taken out that returns struct **/
	get_result_int(&o, 1, 0);
	/** var_init defining the value **/
	
	return (get_result_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/o) == 42);
}
static _Bool __chemda_235_411(){
	/** visiting var init in before **/
	struct Result__cgs__0 o;
	/** function call being taken out that returns struct **/
	get_result_int(&o, 0, 1);
	/** var_init defining the value **/
	
	return (get_result_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/o) == -1);
}
static _Bool __chemda_529_412(){
	/** visiting var init in before **/
	struct Result__cgs__0 o;
	/** function call being taken out that returns struct **/
	get_result_int(&o, 0, 0);
	/** var_init defining the value **/
	
	return (get_result_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/o) == -2);
}
static void get_result_int(struct Result__cgs__0* __chx_struct_ret_param_xx, _Bool some, _Bool simple){
	if(some){
		struct Result__cgs__0 __chx__lv__3 = { 0, .Ok.value = 42, };
		*__chx_struct_ret_param_xx = __chx__lv__3;
	} else {
		if(simple){
			struct Result__cgs__0 __chx__lv__4 = { 1, .Err.error = 0, };
			*__chx_struct_ret_param_xx = __chx__lv__4;
		} else {
			struct Result__cgs__0 __chx__lv__5 = { 1, .Err.error = 1, };
			*__chx_struct_ret_param_xx = __chx__lv__5;
		}
	}
}
static int get_result_value(struct Result__cgs__0* o){
	switch(o->__chx__vt_621827) {
		case 0:
			return o->Ok.value;
			break;
		case 1:
			if((o->Err.error == 0)){
				return -1;
			}else if((o->Err.error == 1)){
				return -2;
			} else {
				return -3;
			}
			break;
	}
}
static void test_result_type(){
	test("check result type works - 1", __chemda_584_410);
	test("check result type works - 2", __chemda_235_411);
	test("check result type works - 3", __chemda_529_412);
}
struct SmartPhone;
struct CellPhone;
static int SmartPhonecall(struct SmartPhone* self);
static int CellPhonecall(struct CellPhone* self);
const struct {
	int(*call)(struct SmartPhone* self);
} PhoneSmartPhone = {
	SmartPhonecall,
};
const struct {
	int(*call)(struct CellPhone* self);
} PhoneCellPhone = {
	CellPhonecall,
};
struct SmartPhone {
	int number1;
	int number2;
};
struct CellPhone {
	int number1;
	int number2;
};
struct PhoneContainer {
	__chemical_fat_pointer__ p;
};
static int call_actual(__chemical_fat_pointer__ phone);
static void ret_dyn_obj1(__chemical_fat_pointer__* __chx_struct_ret_param_xx, struct SmartPhone* phone);
static void ret_dyn_obj2(__chemical_fat_pointer__* __chx_struct_ret_param_xx, struct CellPhone* phone);
static void test_dynamic_dispatch();
static _Bool __chemda_451_413(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct SmartPhone p = {.number1 = 99, };
	return (call_actual((__chemical_fat_pointer__){ &p,(void*) &PhoneSmartPhone }) == 99);
}
static _Bool __chemda_739_414(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct CellPhone p = {.number2 = 22, };
	return (call_actual((__chemical_fat_pointer__){ &p,(void*) &PhoneCellPhone }) == 22);
}
static _Bool __chemda_515_415(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct SmartPhone p = {.number1 = 88, };
	/** visiting var init in before **/
	__chemical_fat_pointer__ o;
	/** function call being taken out that returns struct **/
	ret_dyn_obj1(&o, &/** this struct (returned or literal) wasn't allocated by before stmt visitor **/p);
	/** var_init defining the value **/
	
	return (((typeof(PhoneSmartPhone)*) o.second)->call(o.first) == 88);
}
static _Bool __chemda_242_416(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct CellPhone p = {.number2 = 66, };
	/** visiting var init in before **/
	__chemical_fat_pointer__ o;
	/** function call being taken out that returns struct **/
	ret_dyn_obj2(&o, &/** this struct (returned or literal) wasn't allocated by before stmt visitor **/p);
	/** var_init defining the value **/
	
	return (((typeof(PhoneSmartPhone)*) o.second)->call(o.first) == 66);
}
static _Bool __chemda_251_417(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chemical_fat_pointer__ p = (__chemical_fat_pointer__){ &(struct SmartPhone){.number1 = 45, },(void*) &PhoneSmartPhone };
	return (((typeof(PhoneSmartPhone)*) p.second)->call(p.first) == 45);
}
static _Bool __chemda_595_418(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chemical_fat_pointer__ p = (__chemical_fat_pointer__){ &(struct CellPhone){.number2 = 35, },(void*) &PhoneCellPhone };
	return (((typeof(PhoneSmartPhone)*) p.second)->call(p.first) == 35);
}
static _Bool __chemda_707_419(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct SmartPhone s = {.number1 = 73, };
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chemical_fat_pointer__ p = (__chemical_fat_pointer__){ &s,(void*) &PhoneSmartPhone };
	return (((typeof(PhoneSmartPhone)*) p.second)->call(p.first) == 73);
}
static _Bool __chemda_120_420(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct CellPhone c = {.number2 = 26, };
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chemical_fat_pointer__ p = (__chemical_fat_pointer__){ &c,(void*) &PhoneCellPhone };
	return (((typeof(PhoneSmartPhone)*) p.second)->call(p.first) == 26);
}
static _Bool __chemda_279_421(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chemical_fat_pointer__ p = (__chemical_fat_pointer__){ &(struct SmartPhone){.number1 = 57, },(void*) &PhoneSmartPhone };
	p = (__chemical_fat_pointer__){ &(struct CellPhone){.number2 = 73, },(void*) &PhoneCellPhone };
	return (((typeof(PhoneSmartPhone)*) p.second)->call(p.first) == 73);
}
static _Bool __chemda_706_422(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chemical_fat_pointer__ p = (__chemical_fat_pointer__){ &(struct CellPhone){.number2 = 35, },(void*) &PhoneCellPhone };
	p = (__chemical_fat_pointer__){ &(struct SmartPhone){.number1 = 26, },(void*) &PhoneSmartPhone };
	return (((typeof(PhoneSmartPhone)*) p.second)->call(p.first) == 26);
}
static _Bool __chemda_257_423(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chemical_fat_pointer__ p = (__chemical_fat_pointer__){ &(struct SmartPhone){.number1 = 57, },(void*) &PhoneSmartPhone };
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct CellPhone o = {.number2 = 73, };
	p = (__chemical_fat_pointer__){ &o,(void*) &PhoneCellPhone };
	return (((typeof(PhoneSmartPhone)*) p.second)->call(p.first) == 73);
}
static _Bool __chemda_293_424(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chemical_fat_pointer__ p = (__chemical_fat_pointer__){ &(struct CellPhone){.number2 = 35, },(void*) &PhoneCellPhone };
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct SmartPhone o = {.number1 = 26, };
	p = (__chemical_fat_pointer__){ &o,(void*) &PhoneSmartPhone };
	return (((typeof(PhoneSmartPhone)*) p.second)->call(p.first) == 26);
}
static _Bool __chemda_913_425(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct PhoneContainer c = {.p = (__chemical_fat_pointer__){ &(struct SmartPhone){.number1 = 33, },(void*) &PhoneSmartPhone }, };
	return (((typeof(PhoneSmartPhone)*) c.p.second)->call(c.p.first) == 33);
}
static _Bool __chemda_587_426(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct PhoneContainer c = {.p = (__chemical_fat_pointer__){ &(struct CellPhone){.number2 = 55, },(void*) &PhoneCellPhone }, };
	return (((typeof(PhoneSmartPhone)*) c.p.second)->call(c.p.first) == 55);
}
static _Bool __chemda_332_427(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chemical_fat_pointer__ p[1] = {(__chemical_fat_pointer__){ &(struct SmartPhone){.number1 = 11, },(void*) &PhoneSmartPhone }};
	return (((typeof(PhoneSmartPhone)*) p[0].second)->call(p[0].first) == 11);
}
static _Bool __chemda_278_428(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	__chemical_fat_pointer__ p[1] = {(__chemical_fat_pointer__){ &(struct CellPhone){.number2 = 88, },(void*) &PhoneCellPhone }};
	return (((typeof(PhoneSmartPhone)*) p[0].second)->call(p[0].first) == 88);
}
static int call_actual(__chemical_fat_pointer__ phone){
	return ((typeof(PhoneSmartPhone)*) phone.second)->call(phone.first);;
}
static void ret_dyn_obj1(__chemical_fat_pointer__* __chx_struct_ret_param_xx, struct SmartPhone* phone){
	*__chx_struct_ret_param_xx = (__chemical_fat_pointer__){ phone,(void*) &PhoneSmartPhone };
}
static void ret_dyn_obj2(__chemical_fat_pointer__* __chx_struct_ret_param_xx, struct CellPhone* phone){
	*__chx_struct_ret_param_xx = (__chemical_fat_pointer__){ phone,(void*) &PhoneCellPhone };
}
static int SmartPhonecall(struct SmartPhone* self){
	return self->number1;
}
static int CellPhonecall(struct CellPhone* self){
	return self->number2;
}
static void test_dynamic_dispatch(){
	test("passing struct as dynamic object in function argument works - 1", __chemda_451_413);
	test("passing struct as dynamic object in function argument works - 2", __chemda_739_414);
	test("getting dynamic object from function return works - 1", __chemda_515_415);
	test("getting dynamic object from function return works - 2", __chemda_242_416);
	test("storing struct as dynamic object in var init works - 1", __chemda_251_417);
	test("storing struct as dynamic object in var init works - 2", __chemda_595_418);
	test("storing struct ref as dynamic object in var init works - 1", __chemda_707_419);
	test("storing struct ref as dynamic object in var init works - 2", __chemda_120_420);
	test("assignment to dynamic object using struct works - 1", __chemda_279_421);
	test("assignment to dynamic object using struct works - 2", __chemda_706_422);
	test("assignment to dynamic object using struct ref works - 3", __chemda_257_423);
	test("assignment to dynamic object using struct ref works - 3", __chemda_293_424);
	test("storing dynamic object as a struct member works - 2", __chemda_913_425);
	test("storing dynamic object as a struct member works - 1", __chemda_587_426);
	test("storing dynamic object in a struct value works - 1", __chemda_332_427);
	test("storing dynamic object in a struct value works - 2", __chemda_278_428);
}
struct OptVariant {
	int __chx__vt_621827;
	union {
		struct {
			int a;
		} Some;
		struct {
		} None;
	};
};
static int get_value(struct OptVariant* variant);
static void give_variant(struct OptVariant* __chx_struct_ret_param_xx, _Bool some);
struct ContOptVariant {
	struct OptVariant v;
};
struct GenVar__cgs__0 {
	int __chx__vt_621827;
	union {
		struct {
			int a;
			int b;
		} First;
		struct {
			int a;
			int b;
			int c;
		} Second;
	};
};
static int get_sum(struct GenVar__cgs__0* v);
static void test_variants();
static _Bool __chemda_676_429(){
	struct OptVariant __chx__lv__0 = { 0, .Some.a = 10, };
	return (get_value(&__chx__lv__0) == 10);
}
static _Bool __chemda_790_430(){
	struct OptVariant __chx__lv__1 = { 1, };
	return (get_value(&__chx__lv__1) == -1);
}
static _Bool __chemda_967_431(){
	struct OptVariant __chx__lv__2 = { 1, };
	return (get_value(&__chx__lv__2) == -1);
}
static _Bool __chemda_783_432(){
	/** visiting var init in before **/
	/** var_init defining the value **/
	struct OptVariant v = { .__chx__vt_621827 = 2 };
	switch(v.__chx__vt_621827) {
		case 0:
			return 0;
			break;
		case 1:
			return 0;
			break;
	}
	return 1;
}
static _Bool __chemda_901_433(){
	/** visiting var init in before **/
	struct OptVariant v;
	/** function call being taken out that returns struct **/
	give_variant(&v, 1);
	/** var_init defining the value **/
	
	return (get_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/v) == 30);
}
static _Bool __chemda_712_434(){
	/** visiting var init in before **/
	struct OptVariant v;
	/** function call being taken out that returns struct **/
	give_variant(&v, 0);
	/** var_init defining the value **/
	
	return (get_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/v) == -1);
}
static _Bool __chemda_284_435(){
	/** visiting var init in before **/
	struct OptVariant __chx__lv__5 = { 0, .Some.a = 55, };
	/** var_init defining the value **/
	struct ContOptVariant c = {.v = __chx__lv__5, };
	return (get_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/c.v) == 55);
}
static _Bool __chemda_139_436(){
	/** visiting var init in before **/
	struct OptVariant __chx__lv__6 = { 1, };
	/** var_init defining the value **/
	struct ContOptVariant c = {.v = __chx__lv__6, };
	return (get_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/c.v) == -1);
}
static _Bool __chemda_264_437(){
	/** visiting var init in before **/
	struct OptVariant __chx__lv__7 = { 0, .Some.a = 76, };
	/** var_init defining the value **/
	struct OptVariant c[1] = {__chx__lv__7};
	return (get_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/c[0]) == 76);
}
static _Bool __chemda_958_438(){
	/** visiting var init in before **/
	struct OptVariant __chx__lv__8 = { 1, };
	/** var_init defining the value **/
	struct OptVariant c[1] = {__chx__lv__8};
	return (get_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/c[0]) == -1);
}
static _Bool __chemda_125_439(){
	/** visiting var init in before **/
	struct OptVariant __chx__lv__9 = { 1, };
	struct OptVariant __chx__lv__10 = { 0, .Some.a = 43, };
	/** var_init defining the value **/
	struct OptVariant c[2] = {__chx__lv__9,__chx__lv__10};
	return ((get_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/c[0]) == -1) && (get_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/c[1]) == 43));
}
static _Bool __chemda_548_440(){
	/** visiting var init in before **/
	struct OptVariant __chx__lv__11 = { 0, .Some.a = 12, };
	/** var_init defining the value **/
	struct OptVariant v = __chx__lv__11;
	return (get_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/v) == 12);
}
static _Bool __chemda_372_441(){
	/** visiting var init in before **/
	struct OptVariant __chx__lv__12 = { 1, };
	/** var_init defining the value **/
	struct OptVariant v = __chx__lv__12;
	return (get_value(&/** this struct (returned or literal) wasn't allocated by before stmt visitor **/v) == -1);
}
static _Bool __chemda_820_442(){
	struct GenVar__cgs__0 __chx__lv__13 = { 0, .First.a = 20, .First.b = 30, };
	return (get_sum(&__chx__lv__13) == 50);
}
static _Bool __chemda_978_443(){
	struct GenVar__cgs__0 __chx__lv__14 = { 1, .Second.a = 20, .Second.b = 30, .Second.c = 2, };
	return (get_sum(&__chx__lv__14) == 52);
}
static int get_value(struct OptVariant* variant){
	switch(variant->__chx__vt_621827) {
		case 0:
			return variant->Some.a;
			break;
		case 1:
			return -1;
			break;
	}
}
static void give_variant(struct OptVariant* __chx_struct_ret_param_xx, _Bool some){
	if(some){
		struct OptVariant __chx__lv__15 = { 0, .Some.a = 30, };
		*__chx_struct_ret_param_xx = __chx__lv__15;
	} else {
		struct OptVariant __chx__lv__16 = { 1, };
		*__chx_struct_ret_param_xx = __chx__lv__16;
	}
}
static int get_sum(struct GenVar__cgs__0* v){
	switch(v->__chx__vt_621827) {
		case 0:
			return (v->First.a + v->First.b);
			break;
		case 1:
			return ((v->Second.a + v->Second.b) + v->Second.c);
			break;
	}
}
static void test_variants(){
	test("variants can be passed to functions - 1", __chemda_676_429);
	test("variants can be passed to functions - 2", __chemda_790_430);
	test("variants can be passed to functions - 2", __chemda_967_431);
	test("allocated variant is in unspecified state", __chemda_783_432);
	test("variants can be returned from functions - 1", __chemda_901_433);
	test("variants can be returned from functions - 2", __chemda_712_434);
	test("variants can be stored in structs - 1", __chemda_284_435);
	test("variants can be stored in structs - 2", __chemda_139_436);
	test("variants can be stored in arrays - 1", __chemda_264_437);
	test("variants can be stored in arrays - 2", __chemda_958_438);
	test("variants can be stored in arrays - 3", __chemda_125_439);
	test("variants can be stored in variables", __chemda_548_440);
	test("variants can be stored in variables", __chemda_372_441);
	test("generic variants work - 1", __chemda_820_442);
	test("generic variants work - 2", __chemda_978_443);
}
static void test_is_value();
typedef char __chalias_121_1;
static _Bool __chemda_817_444(){
	
	return 1;
}
typedef unsigned char __chalias_309_2;
static _Bool __chemda_848_445(){
	
	return 1;
}
typedef short __chalias_401_3;
static _Bool __chemda_386_446(){
	
	return 1;
}
typedef unsigned short __chalias_353_4;
static _Bool __chemda_253_447(){
	
	return 1;
}
typedef int __chalias_460_5;
static _Bool __chemda_858_448(){
	
	return 1;
}
typedef int __chalias_103_6;
static _Bool __chemda_637_449(){
	
	return !0;
}
typedef unsigned int __chalias_807_7;
static _Bool __chemda_602_450(){
	
	return 1;
}
typedef long long __chalias_169_8;
static _Bool __chemda_461_451(){
	
	return 1;
}
typedef unsigned long __chalias_560_9;
static _Bool __chemda_543_452(){
	
	return 1;
}
typedef long long __chalias_413_10;
static _Bool __chemda_810_453(){
	
	return 1;
}
typedef unsigned long long __chalias_626_11;
static _Bool __chemda_381_454(){
	
	return 1;
}
typedef char __chalias_197_12;
static _Bool __chemda_196_455(){
	
	return !(((((((0 || 0) || 0) || 0) || 0) || 0) || 0) || 0);
}
typedef unsigned char __chalias_938_13;
static _Bool __chemda_921_456(){
	
	return !(((((((0 || 0) || 0) || 0) || 0) || 0) || 0) || 0);
}
typedef short __chalias_212_14;
static _Bool __chemda_412_457(){
	
	return !(((((((0 || 0) || 0) || 0) || 0) || 0) || 0) || 0);
}
typedef unsigned short __chalias_159_15;
static _Bool __chemda_539_458(){
	
	return !(((((((0 || 0) || 0) || 0) || 0) || 0) || 0) || 0);
}
typedef int __chalias_454_16;
static _Bool __chemda_658_459(){
	
	return !(((((((0 || 0) || 0) || 0) || 0) || 0) || 0) || 0);
}
typedef unsigned int __chalias_456_17;
static _Bool __chemda_108_460(){
	
	return !((((((((0 || 0) || 0) || 0) || 0) || 0) || 0) || 0) || 0);
}
typedef long long __chalias_794_18;
static _Bool __chemda_831_461(){
	
	return !((((((0 || 0) || 0) || 0) || 0) || 0) || 0);
}
typedef unsigned long __chalias_679_19;
static _Bool __chemda_205_462(){
	
	return !(((((((0 || 0) || 0) || 0) || 0) || 0) || 0) || 0);
}
typedef long long __chalias_595_20;
static _Bool __chemda_298_463(){
	
	return !(((((((0 || 0) || 0) || 0) || 0) || 0) || 0) || 0);
}
typedef unsigned long long __chalias_684_21;
static _Bool __chemda_167_464(){
	
	return !(((((((0 || 0) || 0) || 0) || 0) || 0) || 0) || 0);
}
typedef _Bool __chalias_509_22;
static _Bool __chemda_705_465(){
	
	return !((((((((0 || 0) || 0) || 0) || 0) || 0) || 0) || 0) || 0);
}
typedef long long __chalias_122_23;
static _Bool __chemda_998_466(){
	
	return ((0 || 1) && !(0 && 1));
}
typedef unsigned long __chalias_281_24;
static _Bool __chemda_371_467(){
	
	return ((0 || 1) && !(0 && 1));
}
typedef void* __chalias_573_25;
typedef char* __chalias_679_26;
static _Bool __chemda_810_468(){
	
	
	return (1 && 1);
}
typedef void* __chalias_136_27;
static _Bool __chemda_893_469(){
	
	return ((1 && 1) && 1);
}
typedef void __chalias_747_28;
static _Bool __chemda_989_470(){
	
	return !(((((((((0 || 0) || 0) || 0) || 0) || 0) || 0) || 0) || 0) || 0);
}
typedef double __chalias_780_29;
static _Bool __chemda_334_471(){
	
	return 1;
}
typedef int __chalias_516_30;
static _Bool __chemda_552_472(){
	
	return 1;
}
typedef int __chalias_675_31;
static _Bool __chemda_209_473(){
	
	return 1;
}
typedef int __chalias_458_32;
typedef long long __chalias_914_33;
typedef char __chalias_281_34;
typedef double __chalias_169_35;
typedef _Bool __chalias_666_36;
typedef float __chalias_490_37;
typedef unsigned long __chalias_269_38;
typedef unsigned int __chalias_489_39;
typedef long long __chalias_994_40;
typedef unsigned long long __chalias_957_41;
typedef unsigned char __chalias_391_42;
typedef void __chalias_237_43;
typedef void* __chalias_866_44;
typedef int __chalias_377_45;
static _Bool __chemda_575_474(){
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	return (((((((((((((1 && 1) && 1) && 1) && 1) && 1) && 1) && 1) && 1) && 1) && 1) && 1) && 1) && 1);
}
typedef  __chalias_407_46;
static _Bool __chemda_965_475(){
	
	return !(((((((((((((0 || 0) || 0) || 0) || 0) || 0) || 0) || 0) || 0) || 0) || 0) || 0) || 0) || 0);
}
static void test_is_value(){
	test("char types are same", __chemda_817_444);
	test("uchar types are same", __chemda_848_445);
	test("short types are same", __chemda_386_446);
	test("ushort types are same", __chemda_253_447);
	test("int types are same", __chemda_858_448);
	test("int types are not not same", __chemda_637_449);
	test("uint types are same", __chemda_602_450);
	test("long types are same", __chemda_461_451);
	test("ulong types are same", __chemda_543_452);
	test("bigint types are same", __chemda_810_453);
	test("ubigint types are same", __chemda_381_454);
	test("char type is different from other intn", __chemda_196_455);
	test("uchar type is different from other intN types", __chemda_921_456);
	test("short type is different from other intN types", __chemda_412_457);
	test("ushort type is different from other intN types", __chemda_539_458);
	test("int type is different from other intN types", __chemda_658_459);
	test("uint type is different from other intN types", __chemda_108_460);
	test("long type is different from other intN types", __chemda_831_461);
	test("ulong type is different from other intN types", __chemda_205_462);
	test("bigint type is different from other intN types", __chemda_298_463);
	test("ubigint type is different from other intN types", __chemda_167_464);
	test("bool type is different from other intN types", __chemda_705_465);
	test("long is either an int or a big int but not both", __chemda_998_466);
	test("ulong is either an uint or a ubigint but not both", __chemda_371_467);
	test("same pointer types do match", __chemda_810_468);
	test("different pointer types don't match", __chemda_893_469);
	test("not a single type is void", __chemda_989_470);
	test("double and float are not the same", __chemda_334_471);
	test("same array types match", __chemda_552_472);
	test("different array types don't match", __chemda_209_473);
	test("all types satisfy any", __chemda_575_474);
	test("any doesn't satisfy other types (though)", __chemda_965_475);
}
int main();
int main(){
	test_var_init();
	test_lambda();
	test_bodmas();
	test_floating_expr();
	test_nodes();
	test_numbers();
	test_structs();
	test_enum();
	test_strings();
	test_macros();
	test_arrays();
	test_pointer_math();
	test_casts();
	test_functions();
	test_destructors();
	test_unions();
	test_namespaces();
	test_comptime();
	test_compiler_vector();
	test_external_functions();
	test_basic_generics();
	test_generic_type_deduction();
	test_vectors();
	test_array_refs();
	test_dynamic_dispatch();
	test_variants();
	test_optional_type();
	test_result_type();
	test_is_value();
	print_test_stats();
}