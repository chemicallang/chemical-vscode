import "imported-completions.ch"

enum Something {
    First,
    Second
}

struct Nested {
    var check_this : int
}

struct Fruit {
    var x : () => Nested = () => {
        var z = 10;
    }
    var y : Nested
    var arr : Nested[]
    func nothing(&self, a : int) : int {
        var a = 0;
        
    }
}

typealias FruitType = Fruit;

interface AbstractI {
    func nothing() {
        var a = 0;
        ImportedEnum.Failure;
    }
}

func this_function() : Fruit {

}

func main() {

    var str : Fruit = Fruit {
        x : () => {
            var inside_str = 5;

        },
        y : Nested {

        }
    }
    var str_without_type = Fruit {};
    var str_with_ta = FruitType {};

    // get completions after . to check enum members work
    var y = Something.First;
    var dddd = Something.Second;

    // get completions after . to check interface memebers work
    AbstractI.nothing();

    // get completions after . to check struct members work
    Fruit.nothing();

    // get completions after . to check var -> struct members work
    str.x();

    // get completions after . to check index access work
    str.arr[0].check_this

    // get completions after . to check var -> struct members work
    str_without_type.x();

    // get completions after last . to check nested struct members work
    str.y.check_this;

    // get completions after last . to check typealias types work as well
    str_with_ta.nothing();

    // get completions after second last () to check functions return types work as well
    this_function().nothing()

    // get completions after () to check lambda return type is detected
    str.x()

    var x = 5;

    var lamb = () => {
        var g = 0;

    }

    lamb = () => {
        var z = 5;

    }

    var arr = {
        () => {
            var inside_arr = 5;
            
        }
    }

    if(x == 5) {
        var d = 0;
        while(d > 0) {
            var n_g = 0;

        }
    } else if(x == 6) {
        var e = 0;

    } else {
        var f = 0;

    }

    while(x < 5) {
        var y = 10;
        var d = 10002;
        while(d > 0) {
            var n_g = 0;
            
        }
    }

    for(var i = 0; i < 5; i++) {
        var z = 10;
        var d = 102;
        while(d > 0) {
            var n_f = 0;
            
        }
    }

    do {
        var j = 10;
        var d = 102;
        while(d > 0) {
            var n_h = 0;
            
        }
    } while(x > 5);

}