import Html exposing (div, Html, button, text, Attribute)
import Html.App as App
import Html.Events exposing (onClick)
import Html.Attributes exposing (classList)

-- MODEL

type alias Model = Int

model: Model
model = 0

-- UPDATE

type Msg =
    Reset | Increment | Decrement

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment -> model + 1
        Decrement -> model - 1
        Reset -> 0

-- VIEW

mdlButtonClass : Attribute Msg
mdlButtonClass = 
    classList
        [("mdl-button", True)
        ,("mdl-js-button", True)
        ,("mdl-button--raised", False)
        ,("mdl-js-ripple-effect", True)
        ,("mdl-button--accent", False)]

view : Model -> Html Msg
view model =
    div [] [button [ onClick Increment, mdlButtonClass] [text "+"]
           ,div [] [text (toString model)]
           ,button [onClick Decrement, mdlButtonClass] [text "-"]
           ,button [onClick Reset, mdlButtonClass] [text "reset"]
    ]

main = App.beginnerProgram { model = model, update = update, view = view }
