func print_fib(first_num : int, second_num : int) {
    const next_num = first_num + second_num;
    printf("%d,", next_num);
    print_fib(second_num, next_num)
}

public func main(argc : int, argv : *mut char) : int {
    printf("Arg count : %d\n", argc)
    printf("First %s\n", argv)
    print_fib(0, 1);
    return 0;
}