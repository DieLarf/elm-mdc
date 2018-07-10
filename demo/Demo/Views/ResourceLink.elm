module Demo.Views.ResourceLink exposing (view)

import Material.List as Lists
import Html.Attributes
import Html exposing (Html, text)
import Material.Options exposing (attribute, cs, styled)


view : String -> String -> String -> String-> Html m
view link title iconLink altText = Lists.a [
    attribute <| Html.Attributes.href link --"https://material.io/go/design-buttons"
  , attribute <| Html.Attributes.target "_blank" ] [Lists.graphic [] [
    styled Html.img [
    attribute <| Html.Attributes.src iconLink-- "https://material-components.github.io/material-components-web-catalog/static/media/ic_material_design_24px.svg"
    , cs "resources-icon"
    , attribute <| Html.Attributes.alt altText] --"Material Design Guidelines icon"]
    []
  ]
  , text title] --"Material Design Guidelines"]
