/**
 * This file contains types that should 
 * render nicely, for editing, we can test by editing
 * each type, and omitting or including information
 * into that node to see if its affects
 */

public func main() {
    
    // lets do primitive types first, which are single keyword types

    type t1 = any
    type t2 = bool
    type t3 = char
    type t4 = uchar
    type t5 = double
    type t6 = float
    type t7 = longdouble
    type t8 = int
    type t9 = uint
    type t10 = short
    type t11 = ushort
    type t12 = long
    type t13 = ulong
    type t14 = bigint
    type t15 = ubigint
    type t16 = int128
    type t17 = uint128
    type t18 = float128
    type t19 = void

    // now lets test a identifier type
    type t20 = ShesJustMyType

    // lets do lambda type
    type t21 = (a : int, b : int) => int

    // capturing lambda
    type t22 = ||(a : int, b : int) => int

    // pointer, reference, array, dyn (have child type)
    type t23 = *int
    type t24 = *mut int
    type t25 = &int
    type t26 = &mut int
    type t27 = int[]
    type t28 = dyn ShesNotMyType
    type t29 = *mut &mut dyn ShesNotMyType

    // generic types
    type t30 = ShesType<My, Not>
    type t31 = ShesType<int>

    // compount types like struct & union are complex
    type t32 = struct {
        var a : int
        var b : int
    }
    type t33 = union {
        var a : int
        var b : int
    }



}