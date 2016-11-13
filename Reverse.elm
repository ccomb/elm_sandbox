module Reverse exposing (Model, Msg, model, update, view)

import Html exposing (div, Html, button, input, text, Attribute, label)
import Html.App as App
import Html.Events exposing (onInput)
import Html.Attributes exposing (style, type', classList)
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
mdlInputClass : Attribute Msg
mdlInputClass =
    classList [("mdl-textfield__input", True)]

mdlTextFieldClass : Attribute Msg
mdlTextFieldClass =
    classList
        [("mdl-textfield", True)
        ,("mdl-js-textfield", True)
        ,("mdl-textfield--floating-label", True) ]

view: Model -> Html Msg
view model =
    div [] [
        div
            [style [("color","red")]
            , mdlTextFieldClass
            ]
            [input [type' "text", onInput oninput, mdlInputClass] [text model]
            ,label [classList [("mdl-textfield__label", True)]] [text "reverse"]
            ]
        , div [style [("color","red")]] [text (reverse model)]
    ]

main = App.beginnerProgram { model = model, update = update, view = view }
