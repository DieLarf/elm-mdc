module Demo.Buttons exposing (Model,defaultModel,Msg(Mdc),update,view)

import Demo.Page as Page exposing (Page)
import Html exposing (Html, text, Attribute)
import Material
import Material.Button as Button
import Material.Options as Options exposing (styled, cs, css, when, attribute)
import Material.Typography as Typography
import Material.List as Lists
import Html.Attributes

type alias Model m =
    { mdc : Material.Model m
    }


defaultModel : Model m
defaultModel =
    { mdc = Material.defaultModel
    }


type Msg m
    = Mdc (Material.Msg m)


update : (Msg m -> m) -> Msg m -> Model m -> ( Model m, Cmd m )
update lift msg model =
    case msg of
        Mdc msg_ ->
            Material.update (lift << Mdc) msg_ model


view : (Msg m -> m) -> Page m -> Model m -> Html m
view lift page model =
    let
        textButtons idx =
            example idx "Text Button"
            [ Button.ripple
            , css "margin" "8px 16px"
            ]

        raisedButtons idx =
            example idx "Raised Button"
            [ Button.raised
            , Button.ripple
            , css "margin" "8px 16px"
            ]

        unelevatedButtons idx =
            example idx "Unelevated Button"
            [ Button.unelevated
            , Button.ripple
            , css "margin" "8px 16px"
            ]

        outlinedButtons idx =
            example idx "Outlined Button"
            [ Button.outlined
            , Button.ripple
            , css "margin" "8px 16px"
            ]

        example idx title options =
            styled Html.div
            [ ]
            [ styled Html.h3
              [ cs "mdc-typography--subtitle1"
              ]
              [ text title
              ]
            , styled Html.div []
              [
                Button.view (lift << Mdc) (idx ++ "-baseline-button") model.mdc
                ( options
                )
                [ text "Baseline" ]
              ,
                Button.view (lift << Mdc) (idx ++ "-dense-button") model.mdc
                ( Button.dense
                :: options
                )
                [ text "Dense" ]
              ,
                Button.view (lift << Mdc) (idx ++ "-secondary-button") model.mdc
                ( cs "secondary-button"
                :: options
                )
                [ text "Secondary" ]
              ,
                Button.view (lift << Mdc) (idx ++ "-icon-button") model.mdc
                ( Button.icon "favorite"
                :: options
                )
                [ text "Icon" ]
              ,
                Button.view (lift << Mdc) (idx ++ "-link-button") model.mdc
                ( Button.link "#buttons"
                :: options
                )
                [ text "Link" ]
              ]
            ]
    in
    page.body "Buttons"
    [
      styled Html.div
      [ cs "demo-wrapper"
      ]
      [
      styled Html.h1 [cs "mdc-typography--headline5"] [text "Button"],
      styled Html.p [Typography.body1] [text "Buttons communicate an action a user can take. They are typically placed throughout your UI, in places like dialogs, forms, cards, and toolbars."],
      Page.hero2 []
      [ Button.view (lift << Mdc) "buttons-hero-button-flat" model.mdc
        [ Button.ripple
        , css "margin-right" "32px"
        ]
        [ text "Flat"
        ]
      , Button.view (lift << Mdc) "buttons-hero-button-raised" model.mdc
        [ Button.ripple
        , Button.raised
        , css "margin-left" "32px"
        , css "margin-right" "32px"
        ]
        [ text "Raised"
        ]
      , Button.view (lift << Mdc) "buttons-hero-button-unelevated" model.mdc
        [ Button.ripple
        , Button.unelevated
        , css "margin-left" "32px"
        , css "margin-right" "32px"
        ]
        [ text "Unelevated"
        ]
        , Button.view (lift << Mdc) "buttons-hero-button-outlined" model.mdc
          [ Button.ripple
          , Button.outlined
          , css "margin-left" "32px"
          ]
          [ text "Outlined"
          ]
      ]
      , styled Html.h2 [cs "mdc-typography--headline6", css "border-bottom" "1px solid rgba(0,0,0,.87)"] [text "Resources"]
      , Lists.a [
          attribute <| Html.Attributes.href "https://material.io/go/design-buttons"
        , attribute <| Html.Attributes.target "_blank"
      ] [Lists.graphic [] [
          styled Html.img [
          attribute <| Html.Attributes.src "https://material-components.github.io/material-components-web-catalog/static/media/ic_material_design_24px.svg"
          , cs "resources-icon"
          , attribute <| Html.Attributes.alt "Material Design Guidelines icon"]
          [] --Extract into method?
        ]
        , text "Material Design Guidelines"]
      , Lists.a [
          attribute <| Html.Attributes.href "https://material.io/components/web/catalog/buttons/"
        , attribute <| Html.Attributes.target "_blank"
          ] [Lists.graphic [] [
          styled Html.img [
          attribute <| Html.Attributes.src "https://material-components.github.io/material-components-web-catalog/static/media/ic_drive_document_24px.svg"
          , cs "resources-icon"
          , attribute <| Html.Attributes.alt "Documentation icon"]
          [] --Extract into method?
        ]
        , text "Documentation"]
      , Lists.a [
        attribute <| Html.Attributes.href "https://github.com/material-components/material-components-web/tree/master/packages/mdc-button"
      , attribute <| Html.Attributes.target "_blank"
      ] [Lists.graphic [] [
          styled Html.img [
          attribute <| Html.Attributes.src "https://material-components.github.io/material-components-web-catalog/static/media/ic_code_24px.svg"
          , cs "resources-icon"
          , attribute <| Html.Attributes.alt "Source Code"]
          [] --Extract into method?
        ]
        , text "Source Code (Material Components Web)"]
      , styled Html.h2 [cs "mdc-typography--headline6", css "border-bottom" "1px solid rgba(0,0,0,.87)"] [text "Demos"]


      , textButtons "buttons-text-buttons"
      , raisedButtons "buttons-raised-buttons"
      , unelevatedButtons "buttons-unelevated-buttons"
      , outlinedButtons "buttons-outlined-buttons"
      ]
    ]
