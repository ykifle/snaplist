module Paths_snaplist (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import Data.Version (Version(..))
import System.Environment (getEnv)

version :: Version
version = Version {versionBranch = [0,1], versionTags = []}

bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/Users/ykifle/Library/Haskell/ghc-7.0.4/lib/snaplist-0.1/bin"
libdir     = "/Users/ykifle/Library/Haskell/ghc-7.0.4/lib/snaplist-0.1/lib"
datadir    = "/Users/ykifle/Library/Haskell/ghc-7.0.4/lib/snaplist-0.1/share"
libexecdir = "/Users/ykifle/Library/Haskell/ghc-7.0.4/lib/snaplist-0.1/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catch (getEnv "snaplist_bindir") (\_ -> return bindir)
getLibDir = catch (getEnv "snaplist_libdir") (\_ -> return libdir)
getDataDir = catch (getEnv "snaplist_datadir") (\_ -> return datadir)
getLibexecDir = catch (getEnv "snaplist_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
