if status is-interactive
    # Commands to run in interactive sessions can go here
end


# pyenv init
if command -v pyenv 1>/dev/null 2>&1
  pyenv init --path | source
end

# vim keybindings
# fish_vi_key_bindings
# function fish_user_key_bindings
#    for mode in insert default visual
#        bind -M $mode \cf forward-word
#    end
# end
# uncomment if you want the default keybindings
fish_default_key_bindings

# fish welcome message
set fish_greeting

# Configure fzf
fzf_configure_bindings --directory=\cp
