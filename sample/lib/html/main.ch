import "../compiler/Lexer.ch"
import "../compiler/CSTConverter.ch"
import "../std/string.ch"
import "../std/option.ch"

enum TokenType {
    LessThan,
    GreaterThan
}

struct Token {
    var type : TokenType
    var str : string
}

func getNextToken(lexer : Lexer*) : Option<Token> {
    const provider = lexer.provider();
    const character = provider.readCharacter();
    var t = Token {
        type : TokenType.LessThan,
        str : string()
    }
    switch(character) {
        '<' => {
        
        }
        '>' => {

        }
    }
}

public func lexMacro(lexer : Lexer*) {
    lexer.lexNumberToken();
}

public func parseMacro(converter : CSTConverter*, token : CSTToken*) {
    const contained = token.tokens();
    const interested = contained.get(1);
    const value = converter.make_uint_value(33, token);
    converter.put_value(value, interested);
}