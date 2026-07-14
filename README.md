# lox-lua

lox-lua is a small learning project toward implementing the Lox programming language from *Crafting Interpreters*, written in Lua. Today the CLI runner executes Lua source in a minimal sandbox; scanner/token modules are early groundwork for a future Lox interpreter.

## Technical stack

- Lua, with no third-party runtime dependencies
- Executable Lua entrypoint at `./lox-lua` (`#!/usr/bin/env lua`)

## Usage

Requires Lua 5.2 or newer.

```sh
./lox-lua path/to/program.lua
./lox-lua
```

The second form starts the interactive prompt. The current runner executes Lua source; `.lox` source is not supported yet.

## Status

Early work in progress. Scanner and token modules exist, but the interpreter is not complete.

## Known limitations

- Parsing, AST construction, evaluation, functions, classes, and error recovery are not implemented.
- Scanner behavior has little automated coverage.
- The command-line launcher assumes executable shebang support and a `lua` executable on `PATH`.
- Language-version compatibility is not enforced automatically.

## Next steps

Finish scanner tests, add a parser and AST representation, implement the tree-walk interpreter chapter by chapter, add conformance fixtures, and package a portable CLI entry point.
