# integer-simple-test

## To reproduce the problem:

``` bash
nix-build .
```

This produces the following output:

```
building '/nix/store/bfivlriw2z5cnfl1caly8ayj2aziyrwg-wai-logger-2.3.6-setup.drv'...
unpacking sources
unpacking source archive /nix/store/w4f9han5aspfc8gbg3g2zq2kcc7s98sf-wai-logger-2.3.6.tar.gz
source root is wai-logger-2.3.6
setting SOURCE_DATE_EPOCH to timestamp 1570151186 of file wai-logger-2.3.6/wai-logger.cabal
patching sources
building
Compiling package Setup.hs
[1 of 1] Compiling Main             ( Setup.hs, Setup.o )
ghc: panic! (the 'impossible' happened)
  (GHC version 8.8.4 for x86_64-unknown-linux):
        lookupGlobal
  Can't find interface-file declaration for data constructor NatS#
    Probable cause: bug in .hi-boot file, or inconsistent .hi file
    Use -ddump-if-trace to get an idea of which file caused the error
  Call stack:
      CallStack (from HasCallStack):
        callStackDoc, called at compiler/utils/Outputable.hs:1159:37 in ghc:Outputable
        pprPanic, called at compiler/typecheck/TcEnv.hs:133:32 in ghc:TcEnv

Please report this as a GHC bug:  https://www.haskell.org/ghc/reportabug

builder for '/nix/store/bfivlriw2z5cnfl1caly8ayj2aziyrwg-wai-logger-2.3.6-setup.drv' failed with exit code 1
```

This happens because I added the dependency `wai-logger` to this project. It seems like an innocuous dependency, but maybe the fact that it has a `Setup.hs` is causing this?
