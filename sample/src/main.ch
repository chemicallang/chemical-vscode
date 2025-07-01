func my_own(page : &mut HtmlPage) {
    #html {
        <html>
            <head>
                <title>Something aweful like this</title>
            </head>
            <body>
                This is so cool
            </body>
        </html>
    }
}

public func main(argc : int, argv : *mut char) : int {
    printf("%d", submod_sum(10, 20))
    return 0;
}