module Notes exposing (..)


record =
    { name = "thing", x = 1, y = 3 }



-- record.name == "thing"
-- record.x == 1
-- record.y == 3


myTuple =
    ( "thing", 1, 3 )



-- ( name, x, y ) =
--   ( "thing", 1, 3 )


list =
    [ 1, 2, 3 ]


fooey =
    [ [ "foo", "bar" ], [ "baz" ] ]



-- nope =
--   [ "foo", 55 ]


pluralize : String -> String -> Int -> String
pluralize singular plural quantity =
    let
        quantityStr =
            String.fromInt quantity

        prefix =
            quantityStr ++ " "
    in
    if quantity == 1 then
        prefix ++ singular

    else
        prefix ++ plural


multiply : Int -> Int -> Int
multiply a b =
    a * b


double =
    multiply 2


filter =
    List.filter (\num -> num >= 2) [ 1, 2, 3 ]


map =
    List.map double [ 1, 2, 3 ]


plurals =
    List.map (pluralize "leaf" "leaves") [ 1, 2, 3 ]



-- Types


query : String
query =
    "lalala"


searchResult : { name : String, stars : Int }
searchResult =
    { name = "bob", stars = 100 }



-- Union Types


type Bool
    = True
    | False


type Sorting
    = Ascending
    | Descending
    | Randomized


type SortingFunctions
    = AscendingFunction String
    | DescendingFunction String
    | RandomizedFunction


currentSorting =
    Ascending


sortingFunc =
    AscendingFunction "Bob"


sortedResult =
    case currentSorting of
        Ascending ->
            [ 1, 2, 3 ]

        Descending ->
            [ 3, 2, 1 ]

        Randomized ->
            [ 3, 1, 2 ]


sortedFuncResult =
    case sortingFunc of
        AscendingFunction colName ->
            [ 1, 2, 3 ]

        DescendingFunction colName ->
            [ 3, 2, 1 ]

        RandomizedFunction ->
            [ 3, 1, 2 ]



-- Result and Maybe


num1 =
    String.toInt "42"


num2 =
    String.toInt "flounder"



-- type Result
--   = OK somethingGood
--   | Err somethingBad
-- Pipeline


notPipeline =
    List.reverse (List.filter (\n -> n < 5) [ 2, 4, 6, 8 ])


pipeline =
    [ 2, 4, 6, 8 ]
        |> List.filter (\n -> n < 5)
        |> List.reverse
        |> List.map negate
        |> List.head



-- JSON decoding
-- bob =
--     JSON.decodeString float "123.45"


makeGameState score playing =
    { score = score, playing = playing }


decoder =
    decode makeGameState
        |> required "score" float
        |> required "playing" bool


type alias GameState =
    { score : Float, playing : Bool }



-- GameState : Float -> Bool -> GameState
