module EnumeratedList exposing
    ( EnumeratedItem
    , EnumeratedList(..)
    , fromList
    , length
    , map
    , toList
    , updateAtItem
    )

import List


type alias EnumeratedItem a =
    { position : Int
    , element : a
    }


type EnumeratedList a
    = EnumeratedList (List (EnumeratedItem a))


fromList : List a -> EnumeratedList a
fromList =
    EnumeratedList << List.indexedMap (\i x -> { position = i, element = x })


toList : EnumeratedList a -> List a
toList (EnumeratedList xs) =
    List.map .element xs


map : (EnumeratedItem a -> b) -> EnumeratedList a -> EnumeratedList b
map f (EnumeratedList xs) =
    fromList <|
        List.map (\item -> f item) xs


updateAtItem :
    EnumeratedItem a
    -> (EnumeratedItem a -> Maybe a)
    -> EnumeratedList a
    -> EnumeratedList a
updateAtItem item f (EnumeratedList xs) =
    let
        go i yss =
            case yss of
                [] ->
                    []

                y :: ys ->
                    if i == y.position then
                        case f y of
                            Nothing ->
                                List.map .element ys

                            Just y2 ->
                                y2 :: List.map .element ys

                    else
                        y.element :: go (i + 1) ys
    in
    fromList (go 0 xs)


length : EnumeratedList a -> Int
length =
    List.length << toList
