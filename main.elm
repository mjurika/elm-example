import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Time exposing (Time, second)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL
type alias Model = Time

init : (Model, Cmd Msg)
init =
  (0, Cmd.none)

-- UPDATE
type Msg
  = Tick Time | Refresh

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick newTime ->
      (model + 1, Cmd.none)

    Refresh ->
      (0, Cmd.none)

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every Time.second Tick

-- VIEW
view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Refresh ] [ text "Refresh" ]
        , div [] [ text (toString (round model - round model % 60) ++ " minutes, " ++ toString (round model % 60)  ++ " seconds")]
        ]