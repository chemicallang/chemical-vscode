func myCss(page : &mut HtmlPage) {
    #css {
        color : red;
        color : blue;
        color : #ffffff;
        background-color : red;
        background : red;
        border-style : none;
    }
}

func see_it_through(page : &mut HtmlPage) {
    #js {
        var i = 33;
    }
}

func another_func(page : &mut HtmlPage) {
        #html {
            <div>
                <span>This is a span</span>
                <span>This is another span</span>
            </div>
        }
}

func another_html_comp(page : &mut HtmlPage) {
    #html {
        <table>
            <tr>
                <td>How is it going ?</td>
                <td>Row 1, Cell 2</td>
            </tr>
            <tr>
                <td>Row 2, Cell 1</td>
                <td>Row 2, Cell 2</td>
            </tr>
        </table>
    }
}

#preact PCounter(props) {
    return <div>Hello My Name is {props.name}</div>
}

#universal UCounter(props) {
    state count = 0;
    return <div>Another Counter {count}</div>
}

func my_own(page : &mut HtmlPage) {
    #html {
        <html>
            <head>
                <title>This is not in question, Something thiis is good</title>
            </head>
            <body>
                <span id="here-it-is">This is a tag</span>
                <span id="thereitis">This is it</span>
                <span attr="this is great">
                    This is greta
                </span>
                <span>This is cool</span>
                <span>
                    This is rather disappointing
                </span>
                <span id="coolSpan">
                    This is soo cool
                </span>
                <div id="myDiv">
                    This is so cool 
                    <span> This is even cooler</span>
                </div>
            </body>
        </html>
    }
}

struct Point {
    var a : int
    var b : int
}

public struct Person {
    var name : std::string
    var age : int
}

public func main(argc : int, argv : *mut char) : int {
    var p : Point = { a : 10, b : 20 }
    const x = 10;
    var y = 20;
    var s = submod_sum(10, 20)
    
    printf("%d, %d", p.a, p.b);
    if(p.a == 10) {
        printf("%d", p.a);
    }
    println(`a : ${p.a} b : ${p.b}`);
    print(`how could this be possible?`);
    return 0;
}