func print_fib(first_num : int, second_num : int) {
    const next_num = first_num + second_num;
    printf("%d,", next_num);
    print_fib(second_num, next_num)
}

func something_id_like() {
    printf("here I'm fiddling with the thing");
}

func add(a : int, b : int) : int {
    return a + b;
}

func sum(a : int, b : int) : int {
    var something_else = 10;
    var something_I_know = false;
    var something = fnv1a_hash_32("something");
    var something_else = fnv1a_hash_32("new something")
    if(something_I_know) {
        var myChar = '\t';var x = 0;
        var checkout = printf("I am making a sound");
        var this_is_it = printf("I'm somewhat of a devil");
        var another = printf("another one");
        var myStr = std::string_view("this is my file")
    }
    return 0;
}

func nothing() {
    var every_body = true;
}

public func main(argc : int, argv : *mut char) : int {
    printf("Arg count : %d\n", argc)
    printf("First %s\n", argv)
    print_fib(0, 1);
    return 0;
}