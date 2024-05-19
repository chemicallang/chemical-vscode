enum Something {
    First,
    Second
}

struct Nested {
    var check_this : int
}

struct Fruit {

    var x : () => void = () => {
        var z = 10;
        // Semantic token Something
        if(Something) {
            
        }
    }
    var y : Nested

    func nothing() {
        var a = 0;
        
    }
}

interface AbstractI {
    func nothing() {
        var a = 0;
        
    }
}

func Something1() : AbstractI {

}

func functionisgood() {

}

func main() {

    var nestbable = Fruit {
        y : Nested {
            check_this : 10
        }
    } 

    // semantic token highlighted as enum
    if(Something) {
        functionisgood(34545);
        

    }

    // function call resolves peroperly
    functionisgood();

    // check that the enum member is highlighted properly
    var check_enum_member = Something.First;

    // check that nested member is highlighted properly
    printf("%d", nestable.y.check_this);


    if(functionisgood) {
        
    }

    var my_int : int = 10;
    var x = 5;

    var lamb = () => {
        var g = 0;

    }

    lamb = () => {
        var z = 5;

    }

    var str = Fruit {
        x : () => {
            var inside_str = 5;

        }
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
        var d = 10;
        while(d > 0) {
            var n_g = 0;
            
        }
    }

    for(var i = 0; i < 5; i++) {
        var z = 10;
        var d = 1002;
        while(d > 0) {
            var n_f = 0;
            
        }
    }

    do {
        var j = 10;
        var d = 100;
        while(d > 0) {
            var n_h = 0;
            
        }
    } while(x > 5);

}