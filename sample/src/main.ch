/**
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
**/

func submod_sum(a : int, b : int) : int {
    return a + b;
}

public func main(argc : int, argv : *mut char) : int {
    var something = '\n'
    printf("%d", submod_sum(10, 20))
    return 0;
}