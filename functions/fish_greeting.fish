function fish_greeting -d "What's up, fish?"
    if status is-login
        macchina --theme tty
    else
        macchina --theme gfx
    end
end
