import Html exposing (div, Html, button, input, text)
import Html.App as App
import Html.Events exposing (onInput)
import Html.Attributes exposing (style, type')
import String exposing (reverse)

-- MODEL
type alias Model = String

model: Model
model = ""

-- UPDATE
type Msg = Change String

update : Msg -> Model -> Model
update msg model =
    case msg of Change model -> model

oninput: String -> Msg
oninput inputString = Change inputString

-- VIEW
view: Model -> Html Msg
view model =
    div [] [
        div [style [("color","red")]] [text "reverse"]
        , input [type' "text", onInput oninput] [text model]
        , div [style [("color","red")]] [text (reverse model)]
    ]

-- MAIN
main = App.beginnerProgram {model=model, update=update, view=view}
