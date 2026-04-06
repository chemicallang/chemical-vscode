/**
 * This file contains declarations that should 
 * render nicely, for editing, we can test by editing
 * each declaration, and omitting or including information
 * into that node to see if its affects
 */

// Annotations
@extern
// Variable Statements
var GlobalVariable : int

// Typealiases
public type MyInt = int

// Enums
public enum Fruits {
    Orange,
    Mango,
    Banana
}

// Function Declaration
@extern
public func printf(format : *char, _ : any...);

// Functions
public func main() {

    // access chain as node
    Fruits.Orange

    // function call in access chain as node
    printf("Hello World");

    // Assignment
    GlobalVariable = 0;

    // do while loop
    do {

    } while(true);

    // for loop
    for(var i = 0; i < 3; i++) {

        if(i == 0) {
            // Break Statement
            break;
        } else if(i == 1) {
            // Continue Statement
            continue;
        }

    }

    // if statement
    if(i < 3) {

    }

    // while loop
    while(i < 3) {

    }

    // loop Block
    loop {
        var i = 0;
    }

    // Provide Statement
    provide a as something {
        
    }

    // Switch Statement
    switch(GlobalVariable) {
        1 => {

        }
        2 => {

        }
        default => {

        }
    }

    // Destruct Statement
    destruct value;
    destruct[something_else] value

    // Unsafe Block
    unsafe {
        print_something(0, 2);
    }

    // Return Statement
    return;

}

// Interface
interface FoodProvider {
    
    func provide() : int

}

// Impl Block
impl FoodProvider {
    @override
    func provide() : int {
        return 3;
    }
}

// Namespace
namespace Hogwarts {

    public var HarrysWand : int;

}

// Structs
struct FoodProviderImpl {
    
    // Struct Member
    var food : int

    // Unnamed Union
    union {
        var food2 : int
    } another_;

    // Unnamed Struct
    struct {
        var food3 : int
    } call_it;

    @make
    func make() {
        // Init Block
        init {
            food(3)
        }
    }

}

// Extension Functions
func (food : &FoodProviderImpl) print() {
    printf(food.food);
    // YO this is cool
}

// Generic Functions
func <T, A> get_food() {

}

// Unions
union FoodProviderUnionImpl {
    var food1 : int
    var food2 : int
}

// Variants
variant FoodOrWater {
    Food(i : int)
    Water(i : long)
}