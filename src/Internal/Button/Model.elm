module Internal.Button.Model exposing (Model, defaultModel, Msg(..))

import Internal.Ripple.Model as Ripple


type alias Model =
    { ripple : Ripple.Model
    }


defaultModel : Model
defaultModel =
    { ripple = Ripple.defaultModel
    }


type Msg m
    = RippleMsg Ripple.Msg
    | Click Bool m
