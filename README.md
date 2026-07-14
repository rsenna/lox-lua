# lox-lua

lox-lua is a small learning implementation of the Lox programming language from *Crafting Interpreters*, written in Lua. It currently provides a command-line runner and the beginnings of lexical scanning and token definitions.

## Technical stack

- Lua, with no third-party runtime dependencies
- POSIX launcher script at `./lox-lua`

## Usage

Requires Lua 5.4 or newer.

```sh
./lox-lua path/to/program.lox
./lox-lua
```

The second form starts the interactive prompt.

## Status

Early work in progress. Scanner and token modules exist, but the interpreter is not complete.

## Known limitations

- Parsing, AST construction, evaluation, functions, classes, and error recovery are not implemented.
- Scanner behavior has little automated coverage.
- The command-line launcher assumes a POSIX shell and a `lua` executable on `PATH`.
- Language-version compatibility is not enforced automatically.

## Next steps

Finish scanner tests, add a parser and AST representation, implement the tree-walk interpreter chapter by chapter, add conformance fixtures, and package a portable CLI entry point.
