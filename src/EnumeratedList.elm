module EnumeratedList exposing
    ( EnumeratedList(..)
    , fromList
    , toList
    )

import List


type EnumeratedList a
    = EnumeratedList (List ( Int, a ))


fromList : List a -> EnumeratedList a
fromList =
    EnumeratedList << List.indexedMap (\i x -> ( i, x ))


toList : EnumeratedList a -> List a
toList (EnumeratedList xs) =
    List.map snd xs


snd ( a, b ) =
    b
