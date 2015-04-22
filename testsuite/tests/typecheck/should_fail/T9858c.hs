{-# LANGUAGE ImpredicativeTypes, FlexibleContexts #-}

module T9858b where
import Data.Typeable

i :: (Typeable a, Typeable b) => Proxy (a b) -> TypeRep
i p = typeRep p

j = i (Proxy :: Proxy (Eq Int => Int))
