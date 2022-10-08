function swr --description 'generate task data given a python task file path'
    set path_ (string split / $argv)[-1]
    set file_ (string split . $path_)[1]
    swsdk task:run -s -n $argv
end
