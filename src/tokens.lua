local tokens = {
  LEFT_PAREN = '(',
  RIGHT_PAREN = ')',
  LEFT_BRACE = '{',
  RIGHT_BRACE = '}',
  COMMA = ',',
  DOT = '.',
  MINUS = '-',
  PLUS = '+',
  SEMICOLON = ';',
  SLASH = '/',
  STAR = '*',
  BANG = '!',
  BANG_EQUAL = '!=',
  EQUAL = '=',
  EQUAL_EQUAL = '==',
  GREATER = '>',
  GREATER_EQUAL = '>=',
  LESS = '<',
  LESS_EQUAL = '<=',
  SINGLE_QUOTE = "'",
  DOUBLE_QUOTE = '"',
  IDENTIFIER = 'IDENTIFIER',
  STRING = 'STRING',
  NUMBER = 'NUMBER',
  AND = 'AND',
  CLASS = 'CLASS',
  ELSE = 'ELSE',
  FALSE = 'FALSE',
  FUN = 'FUN',
  FOR = 'FOR',
  IF = 'IF',
  NIL = 'NIL',
  OR = 'OR',
  PRINT = 'PRINT',
  RETURN = 'RETURN',
  SUPER = 'SUPER',
  THIS = 'THIS',
  TRUE = 'TRUE',
  VAR = 'VAR',
  WHILE = 'WHILE',
  EOF = 'EOF',

  SYMBOLS = {},
  KEYWORDS = {},
  ALPHA_NUMERIC = {},
  ALPHA = {},
  DIGITS = {},
  ID_START = {},
  ID_BODY = {}
}

tokens.SYMBOLS = {
  tokens.LEFT_PAREN, tokens.RIGHT_PAREN,
  tokens.LEFT_BRACE, tokens.RIGHT_BRACE,
  tokens.COMMA, tokens.DOT,
  tokens.MINUS, tokens.PLUS,
  tokens.SEMICOLON, tokens.SLASH, tokens.STAR,
  tokens.BANG, tokens.BANG_EQUAL,
  tokens.EQUAL, tokens.EQUAL_EQUAL,
  tokens.GREATER, tokens.GREATER_EQUAL,
  tokens.LESS, tokens.LESS_EQUAL
}

tokens.KEYWORDS = {
  tokens.AND, tokens.CLASS,
  tokens.ELSE, tokens.FALSE,
  tokens.FUN, tokens.FOR,
  tokens.IF, tokens.NIL,
  tokens.OR, tokens.PRINT,
  tokens.RETURN, tokens.SUPER,
  tokens.THIS, tokens.TRUE,
  tokens.VAR, tokens.WHILE
}

tokens.DIGITS = {
  '0', '1', '2', '3', '4',
  '5', '6', '7', '8', '9'
}

tokens.ALPHA = {
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
  'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
  'u', 'v', 'w', 'x', 'y', 'z',
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
  'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
  'U', 'V', 'W', 'X', 'Y', 'Z'
}

for _, v in ipairs(tokens.ALPHA) do table.insert(tokens.ALPHA_NUMERIC, v) end
for _, v in ipairs(tokens.DIGITS) do table.insert(tokens.ALPHA_NUMERIC, v) end

for _, v in ipairs(tokens.ALPHA) do table.insert(tokens.ID_START, v) end
table.insert(tokens.ID_START, '_')

for _, v in ipairs(tokens.ALPHA_NUMERIC) do table.insert(tokens.ID_BODY, v) end
table.insert(tokens.ID_BODY, '_')

return tokens
