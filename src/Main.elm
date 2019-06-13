module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


type Player
  = NoPlayer
  | X
  | O

type alias Model =
  { buttonValue : Player }

init : Model
init =
  { buttonValue = NoPlayer }

playerToString p =
  case p of
    X -> "X"
    O -> "O"
    NoPlayer -> "-"

main =
    Browser.sandbox { init = init, update = update, view = view }

type Msg
    = Flip

update: Msg -> Model -> Model
update msg model =
    case msg of
        Flip ->
          if model.buttonValue == X then
            { model | buttonValue = O }
          else
            { model | buttonValue = X }

view: Model -> Html Msg
view model =
  div []
    [
      button [ onClick Flip ] [ text (playerToString model.buttonValue) ]
    ]
