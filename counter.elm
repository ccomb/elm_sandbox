import Html exposing (div, Html, button, text)
import Html.App as App
import Html.Events exposing (onClick)

-- MODEL

type alias Model =
    { counter : Int }

model: Model
model = { counter = 0 }

-- UPDATE

type Msg =
    Reset | Increment | Decrement

update : Msg -> Model -> Model
update msg model =
    if msg == Increment
    then { model | counter = model.counter + 1 }
    else
        if msg == Decrement
        then { model | counter = model.counter - 1 }
        else { counter = 0 }

-- VIEW

view : Model -> Html Msg
view model =
    div [] [
        button [ onClick Increment ] [text "+"]
        , div [] [text (toString model.counter)]
        , button [onClick Decrement] [text "-"]
    ]

main = App.beginnerProgram { model = model, update = update, view = view }
