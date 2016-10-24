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
    case msg of
        Increment -> { model | counter = model.counter + 1 }
        Decrement -> { model | counter = model.counter - 1 }
        Reset -> { counter = 0 }

-- VIEW

view : Model -> Html Msg
view model =
    div [] [
        button [ onClick Increment ] [text "+"]
        , div [] [text (toString model.counter)]
        , button [onClick Decrement] [text "-"]
        , button [onClick Reset] [text "reset"]
    ]

main = App.beginnerProgram { model = model, update = update, view = view }
