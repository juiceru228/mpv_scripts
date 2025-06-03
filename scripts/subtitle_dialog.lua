utils = require 'mp.utils'
function add_subtitle_dialog_linux()
local res = utils.subprocess({
    args = {'kdialog', '--title=Choose subtitle file', '--getopenfilename', './', '*.ass'},
    cancellable = false,
})
if res.status ~= 0 or res.stdout == "" then return end

    local sub_file = res.stdout:gsub("\n", "")
    mp.commandv("sub-add", sub_file, "select")
    mp.osd_message("Subtitle file is loaded: " .. sub_file)
    end

    mp.add_key_binding('ctrl+z', 'add-subtitle-dialog', add_subtitle_dialog_linux)
