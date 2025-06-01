struct Temp {}

public func main() {

    var temp : int = 0;

    // address of value
    var tempAddr = &temp;

    // array value
    var tempArr = [ temp, temp, temp ]

    // erroring integer values
    // these are bad integer values that should give an error without crashing
    var yi1 = 0i0
    var yi2 = 0ui0
    var yi3 = 8ui1

    // different integer values
    var xi8 = 10i8
    var xui8 = 10ui8
    var xi16 = 20i16
    var xui16 = 20ui16
    var xi32 = 10i32
    var xui32 = 20ui32
    var xi64 = 10i64
    var xui64 = 20ui64

    // negative integer
    var myNegInt = -33

    // double/float value
    var floating_pi = 3.14f
    var double_pi = 3.14

    // single keyword values
    var this_true = true;
    var this_false = false;
    var this_null = null;

    // sizeof and alignof values
    var size_of_value = sizeof(this_true)
    var size_of_value = alignof(this_false)

    // not value
    var not_true = !this_true

    // casted values
    var casted_true = this_true as int
    var casted_addr = &this_false as *mut bool

    // dereference value
    var deref_bool = *casted_addr

    // string like values
    var myChar = 'x'
    var myChar2 = '\n'

    // a comment inside
    var x = 303;/**
     * something doesn't feel right
     */var x = 44;

    // strings
    var myStr = "something gotta give"
    var myStr2 = "some \" thing \t got \t to \t give"
    var myStr3 = "sometimes \" \" \" \" \" nme"
    var multilineStr = """save it till the end
    I'm not going to say
        Something here and there
        Something here and there
    """;var something_else = "";
    var multilineStr2 = """something
    something I'd like to say""";var x = """nothing is here too""";

    // index operator values
    var indexer_1 = myStr[0]
    var indexer_2 = myStr2[1]

    // is value
    var check = myStr is string

    // lambda function value
    var myLamb = () => {

    }

    // new and placement new value
    var myNewStr = new Temp {};
    new (myNewStr) Temp { }



}