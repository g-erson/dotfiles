
import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    oni.input.bind("<C-h>", () =>
        oni.editors.activeEditor.neovim.command(`call OniNextWindow('h')<CR>`)
    )
    oni.input.bind("<C-j>", () =>
        oni.editors.activeEditor.neovim.command(`call OniNextWindow('j')<CR>`)
    )
    oni.input.bind("<C-k>", () =>
        oni.editors.activeEditor.neovim.command(`call OniNextWindow('k')<CR>`)
    )
    oni.input.bind("<C-l>", () =>
        oni.editors.activeEditor.neovim.command(`call OniNextWindow('l')<CR>`)
    )
}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    //add custom config here, such as
    "ui.colorscheme": "hybrid",
    //language servers
    "language.vue.languageServer.command":"vls",
    "experimental.vcs.sidebar": true,
    "experimental.indentLines.enabled": true,
    "oni.useDefaultConfig": true,
    "tabs.mode" : "buffer",
    "oni.bookmarks": ["~/Documents"],
    "editor.textMateHighlighting.enabled" : true,
    "editor.fontSize": "15px",
    //"editor.fontFamily": "Monaco",
    "editor.fontFamily": "Monofur for Powerline",
    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto"
}
