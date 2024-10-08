#include <string>
#include <iostream>
#include "lexer.hpp"
#include <fstream>

using namespace std;

int main() {
  cout << "\tToken"  << setw(10) << right << "Lexeme" << "\n";
  char * code = "while (t < lower) r = 28.00;";
  Lexer lex(code);
  for (auto token = lex.next();
       not token.is_one_of(Token::Kind::End, Token::Kind::Unexpected);
       token = lex.next()) {
    cout << setw(15) << token.kind() << "   " << token.lexeme()
              << "\n";
  }
}