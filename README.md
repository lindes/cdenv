CDENV
=====

`cdenv` is a little utility to help you manage the changing of
environment variables depending on your current working directory --
changing "env" when you "`cd`", ergo "`cdenv`".

Installation
------------

Place cdenv somewhere where you can get to it via your PATH
environment variable (OK to symlink it into place), and then add the
following line to your shell's startup file (.zshrc, .bashrc,
.profile, or the like):

    eval "`cdenv -i`"

Usage
-----

The command has a few different usage patterns, see `cdenv -h` for
info.

Once you have it configured (see Installation, above), you'll want to
create, in certain directories, a file called `.cdenv`.  That file can
have one or more lines of the form (in
[BNF](http://en.wikipedia.org/wiki/Backus-Naur_Form)):

    <cdenv-line>          ::= <command> ':' <optional-whitespace> <args>
    <command>             ::= "prepend_path"
    <optional-whitespace> ::= " " <optional-whitespace> | ""
    <args>                ::= <!-- could be anything, currently -->

`prepend_path` is currently the only command supported.  Expect more
in the future.

.cdenv commands:
----------------

prepend_path
: prepends the given string (which may contain colons) to your
  PATH. Upon exiting a directory, if that string is still at the
  beginning of your PATH, it will be removed.

More to come.

About
-----

Inspired by some tools I've seen at companies past, `cdenv` is a
little utility (and some helper library code) for managing changes to
such things as environment variables upon execution of a `cd` command
in the shell (change directories).

This can be useful for cases where you want certain environment
variables to change depending on what directory you're in.  For
example, if you've different source code projects that use different
versions of the same set of tools, cdenv can change your PATH (and/or
other relevant variables) such that when you cd into a particular
project's directory heirarchy, you'll be using the correct set of
tools.  (I've seen this used for changing compiler versions depending
on which source tree you're in, to use appropriate cross-compilers
and/or toolchains.  Recently, I've been motivated to finally write
these tools by the release of Rails 3, while I'm also maintaining
various sites that still use previous versions of rails.)

This utility is currently still in its infancy, nominally supporting
thus far:

- zsh, bash, sh/ksh syntax replacement for `cd`
- commands as listed above

See the TODO file for the various things still needing to be done.
