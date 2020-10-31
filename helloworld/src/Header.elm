module Header exposing (..)
import Html exposing (Html, button, div, text, h1)
import Html.Attributes exposing (class)

header: String -> Html msg
header a =
  h1 [ class "banner" ] [ text a ]

