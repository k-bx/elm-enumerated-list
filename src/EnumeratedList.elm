module EnumeratedList exposing
    ( EnumeratedItem
    , EnumeratedList(..)
    , fromList
    , length
    , toList
    , updateAtItem
    , map
    )

import List


type alias EnumeratedItem a =
    { position : Int
    , element : a
    }


type EnumeratedList a
    = EnumeratedList (List ( Int, a ))


fromList : List a -> EnumeratedList a
fromList =
    EnumeratedList << List.indexedMap (\i x -> ( i, x ))


toList : EnumeratedList a -> List a
toList (EnumeratedList xs) =
    List.map Tuple.second xs


map : (EnumeratedItem a -> b) -> EnumeratedList a -> EnumeratedList b
map =
    Debug.todo "todo"


updateAtItem :
    EnumeratedItem a
    -> (EnumeratedItem a -> Maybe a)
    -> EnumeratedList a
    -> EnumeratedList a
updateAtItem =
    Debug.todo "todo"


length : EnumeratedList a -> Int
length =
    List.length << toList
