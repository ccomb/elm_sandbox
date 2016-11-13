import Html exposing (div, Html, button, text, Attribute)
import Html.App as App
import Html.Events exposing (onClick)
import Html.Attributes exposing (classList)

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

mdlButtonClass : Attribute Msg
mdlButtonClass = 
    classList
        [("mdl-button", True)
        ,("mdl-js-button", True),
        ,("mdl-button--raised", False)
        ,("mdl-js-ripple-effect", True)
        ,("mdl-button--accent", False)]

view : Model -> Html Msg
view model =
    div [] [button [ onClick Increment, mdlButtonClass] [text "+"]
           ,div [] [text (toString model.counter)]
           ,button [onClick Decrement, mdlButtonClass] [text "-"]
           ,button [onClick Reset, mdlButtonClass] [text "reset"]
    ]

main = App.beginnerProgram { model = model, update = update, view = view }
