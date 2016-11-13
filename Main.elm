import Html exposing (div, Html)
import Html.App as App
import Counter
import Reverse

-- MODEL
type alias Model =
    {counter: Counter.Model
    ,reverse: Reverse.Model}

model: Model
model =
    {counter = Counter.model
    ,reverse = Reverse.model}


-- UPDATE
type Msg =
    ChangeCounter Counter.Msg | ChangeReverse Reverse.Msg

update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeCounter msg -> { model | counter = Counter.update msg model.counter}
        ChangeReverse msg -> { model | reverse = Reverse.update msg model.reverse}


-- VIEW
view : Model -> Html Msg
view model =
    div
        []
        [App.map (\msg -> ChangeCounter msg) (Counter.view model.counter)
        ,App.map (\msg -> ChangeReverse msg) (Reverse.view model.reverse)]

main = App.beginnerProgram { model = model, update = update, view = view }
