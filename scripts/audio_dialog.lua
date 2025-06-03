utils = require 'mp.utils'
function add_subtitle_dialog_linux()
local res = utils.subprocess({
    args = {'kdialog', '--title=Choose audio track', '--getopenfilename', './', '*.mka *.flac *.mp3 *.ogg'},
    cancellable = false,
})
if res.status ~= 0 or res.stdout == "" then return end

    local sub_file = res.stdout:gsub("\n", "")
    mp.commandv("audio-add", sub_file, "select")
    mp.osd_message("Audio track is loaded: " .. sub_file)
    end

    mp.add_key_binding('ctrl+x', 'add-subtitle-dialog', add_subtitle_dialog_linux)
