module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import List
import Status as S



-- MODEL


type alias SearchResult =
    { id : Int
    , name : String
    , stars : Int
    }


type alias Model =
    { query : String
    , results : List SearchResult
    }


type Msg
    = SetQuery String
    | DeleteById Int


init : Model
init =
    { query = "tutorial"
    , results =
        [ { id = 1
          , name = "TheSeamau5/elm-checkerboardgrid-tutorial"
          , stars = 66
          }
        , { id = 2
          , name = "TheDeadmau5/elm-thumping-bumping"
          , stars = 8000
          }
        , { id = 3
          , name = "grzgorzbalcerek/elm-by-example"
          , stars = 41
          }
        , { id = 4
          , name = "sporto/elm-tutorial-app"
          , stars = 35
          }
        ]
    }



-- UPDATE


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetQuery query ->
            { model | query = query }

        DeleteById id ->
            { model | results = List.filter (\result -> result.id /= id) model.results }



-- VIEW


view : Model -> Html Msg
view model =
    let
        elmHubHeader : Html msg
        elmHubHeader =
            header []
                [ h1 [] [ text "ElmHub" ]
                , p [ class "tagline" ] [ text "Like GitHub, but for Elm things" ]
                ]
    in
    div [ class "content" ]
        [ elmHubHeader
        , input
            [ class "search-query"
            , onInput SetQuery
            , value model.query
            ]
            []
        , button [ class "btn btn--search" ] [ text "Search" ]
        , ul [ class "results" ] (List.map viewSearchResult model.results)
        ]


viewSearchResult : SearchResult -> Html Msg
viewSearchResult result =
    li []
        [ span [ class "star-count" ] [ text (String.fromInt result.stars ++ " stars") ]
        , a [ class "link", href ("https://github.com/" ++ result.name) ] [ text result.name ]
        , button [ class "btn--delete", onClick (DeleteById result.id) ] [ text "X" ]
        ]



-- MAIN


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
