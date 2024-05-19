struct Nested {
    var x : int
}

struct MyStruct {
    
    var nested : Nested

    func print() {
    
    }

}

func main() {
    MyStruct.print();
    
    // var my = MyStruct {
    //     nested : Nested {
    //         x : 5
    //     }
    // }
}