#compdef nh

autoload -U is-at-least

_nh() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_nh_commands" \
"*::: :->nh" \
&& ret=0
    case $state in
    (nh)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:nh-command-$line[1]:"
        case $line[1] in
            (os)
_arguments "${_arguments_options[@]}" : \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
":: :_nh__os_commands" \
"*::: :->os" \
&& ret=0

    case $state in
    (os)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:nh-os-command-$line[1]:"
        case $line[1] in
            (switch)
_arguments "${_arguments_options[@]}" : \
'-D+[Closure diff provider]:DIFF_PROVIDER: ' \
'--diff-provider=[Closure diff provider]:DIFF_PROVIDER: ' \
'-o+[Path to save the result link. Defaults to using a temporary directory]:OUT_LINK:_files' \
'--out-link=[Path to save the result link. Defaults to using a temporary directory]:OUT_LINK:_files' \
'-H+[Output to choose from the flakeref. Hostname is used by default]:HOSTNAME: ' \
'--hostname=[Output to choose from the flakeref. Hostname is used by default]:HOSTNAME: ' \
'-s+[Name of the specialisation]:SPECIALISATION: ' \
'--specialisation=[Name of the specialisation]:SPECIALISATION: ' \
'-n[Only print actions, without performing them]' \
'--dry[Only print actions, without performing them]' \
'-a[Ask for confirmation]' \
'--ask[Ask for confirmation]' \
'-u[Update flake inputs before building specified configuration]' \
'--update[Update flake inputs before building specified configuration]' \
'--no-nom[Don'\''t use nix-output-monitor for the build process]' \
'-S[Don'\''t use specialisations]' \
'--no-specialisation[Don'\''t use specialisations]' \
'-R[Bypass the check to call nh as root directly]' \
'--bypass-root-check[Bypass the check to call nh as root directly]' \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':flakeref -- Flake reference to build:_files -/' \
'*::extra_args -- Extra arguments passed to nix build:' \
&& ret=0
;;
(boot)
_arguments "${_arguments_options[@]}" : \
'-D+[Closure diff provider]:DIFF_PROVIDER: ' \
'--diff-provider=[Closure diff provider]:DIFF_PROVIDER: ' \
'-o+[Path to save the result link. Defaults to using a temporary directory]:OUT_LINK:_files' \
'--out-link=[Path to save the result link. Defaults to using a temporary directory]:OUT_LINK:_files' \
'-H+[Output to choose from the flakeref. Hostname is used by default]:HOSTNAME: ' \
'--hostname=[Output to choose from the flakeref. Hostname is used by default]:HOSTNAME: ' \
'-s+[Name of the specialisation]:SPECIALISATION: ' \
'--specialisation=[Name of the specialisation]:SPECIALISATION: ' \
'-n[Only print actions, without performing them]' \
'--dry[Only print actions, without performing them]' \
'-a[Ask for confirmation]' \
'--ask[Ask for confirmation]' \
'-u[Update flake inputs before building specified configuration]' \
'--update[Update flake inputs before building specified configuration]' \
'--no-nom[Don'\''t use nix-output-monitor for the build process]' \
'-S[Don'\''t use specialisations]' \
'--no-specialisation[Don'\''t use specialisations]' \
'-R[Bypass the check to call nh as root directly]' \
'--bypass-root-check[Bypass the check to call nh as root directly]' \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':flakeref -- Flake reference to build:_files -/' \
'*::extra_args -- Extra arguments passed to nix build:' \
&& ret=0
;;
(test)
_arguments "${_arguments_options[@]}" : \
'-D+[Closure diff provider]:DIFF_PROVIDER: ' \
'--diff-provider=[Closure diff provider]:DIFF_PROVIDER: ' \
'-o+[Path to save the result link. Defaults to using a temporary directory]:OUT_LINK:_files' \
'--out-link=[Path to save the result link. Defaults to using a temporary directory]:OUT_LINK:_files' \
'-H+[Output to choose from the flakeref. Hostname is used by default]:HOSTNAME: ' \
'--hostname=[Output to choose from the flakeref. Hostname is used by default]:HOSTNAME: ' \
'-s+[Name of the specialisation]:SPECIALISATION: ' \
'--specialisation=[Name of the specialisation]:SPECIALISATION: ' \
'-n[Only print actions, without performing them]' \
'--dry[Only print actions, without performing them]' \
'-a[Ask for confirmation]' \
'--ask[Ask for confirmation]' \
'-u[Update flake inputs before building specified configuration]' \
'--update[Update flake inputs before building specified configuration]' \
'--no-nom[Don'\''t use nix-output-monitor for the build process]' \
'-S[Don'\''t use specialisations]' \
'--no-specialisation[Don'\''t use specialisations]' \
'-R[Bypass the check to call nh as root directly]' \
'--bypass-root-check[Bypass the check to call nh as root directly]' \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':flakeref -- Flake reference to build:_files -/' \
'*::extra_args -- Extra arguments passed to nix build:' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
'-D+[Closure diff provider]:DIFF_PROVIDER: ' \
'--diff-provider=[Closure diff provider]:DIFF_PROVIDER: ' \
'-o+[Path to save the result link. Defaults to using a temporary directory]:OUT_LINK:_files' \
'--out-link=[Path to save the result link. Defaults to using a temporary directory]:OUT_LINK:_files' \
'-H+[Output to choose from the flakeref. Hostname is used by default]:HOSTNAME: ' \
'--hostname=[Output to choose from the flakeref. Hostname is used by default]:HOSTNAME: ' \
'-s+[Name of the specialisation]:SPECIALISATION: ' \
'--specialisation=[Name of the specialisation]:SPECIALISATION: ' \
'-n[Only print actions, without performing them]' \
'--dry[Only print actions, without performing them]' \
'-a[Ask for confirmation]' \
'--ask[Ask for confirmation]' \
'-u[Update flake inputs before building specified configuration]' \
'--update[Update flake inputs before building specified configuration]' \
'--no-nom[Don'\''t use nix-output-monitor for the build process]' \
'-S[Don'\''t use specialisations]' \
'--no-specialisation[Don'\''t use specialisations]' \
'-R[Bypass the check to call nh as root directly]' \
'--bypass-root-check[Bypass the check to call nh as root directly]' \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':flakeref -- Flake reference to build:_files -/' \
'*::extra_args -- Extra arguments passed to nix build:' \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
        esac
    ;;
esac
;;
(home)
_arguments "${_arguments_options[@]}" : \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help]' \
'--help[Print help]' \
":: :_nh__home_commands" \
"*::: :->home" \
&& ret=0

    case $state in
    (home)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:nh-home-command-$line[1]:"
        case $line[1] in
            (switch)
_arguments "${_arguments_options[@]}" : \
'-D+[Closure diff provider]:DIFF_PROVIDER: ' \
'--diff-provider=[Closure diff provider]:DIFF_PROVIDER: ' \
'-o+[Path to save the result link. Defaults to using a temporary directory]:OUT_LINK:_files' \
'--out-link=[Path to save the result link. Defaults to using a temporary directory]:OUT_LINK:_files' \
'-c+[Name of the flake homeConfigurations attribute, like username@hostname]:CONFIGURATION: ' \
'--configuration=[Name of the flake homeConfigurations attribute, like username@hostname]:CONFIGURATION: ' \
'-b+[Move existing files by backing up with the extension]:BACKUP_EXTENSION: ' \
'--backup-extension=[Move existing files by backing up with the extension]:BACKUP_EXTENSION: ' \
'-n[Only print actions, without performing them]' \
'--dry[Only print actions, without performing them]' \
'-a[Ask for confirmation]' \
'--ask[Ask for confirmation]' \
'-u[Update flake inputs before building specified configuration]' \
'--update[Update flake inputs before building specified configuration]' \
'--no-nom[Don'\''t use nix-output-monitor for the build process]' \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':flakeref -- Flake reference to build:_files -/' \
'*::extra_args -- Extra arguments passed to nix build:' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" : \
'-D+[Closure diff provider]:DIFF_PROVIDER: ' \
'--diff-provider=[Closure diff provider]:DIFF_PROVIDER: ' \
'-o+[Path to save the result link. Defaults to using a temporary directory]:OUT_LINK:_files' \
'--out-link=[Path to save the result link. Defaults to using a temporary directory]:OUT_LINK:_files' \
'-c+[Name of the flake homeConfigurations attribute, like username@hostname]:CONFIGURATION: ' \
'--configuration=[Name of the flake homeConfigurations attribute, like username@hostname]:CONFIGURATION: ' \
'-b+[Move existing files by backing up with the extension]:BACKUP_EXTENSION: ' \
'--backup-extension=[Move existing files by backing up with the extension]:BACKUP_EXTENSION: ' \
'-n[Only print actions, without performing them]' \
'--dry[Only print actions, without performing them]' \
'-a[Ask for confirmation]' \
'--ask[Ask for confirmation]' \
'-u[Update flake inputs before building specified configuration]' \
'--update[Update flake inputs before building specified configuration]' \
'--no-nom[Don'\''t use nix-output-monitor for the build process]' \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':flakeref -- Flake reference to build:_files -/' \
'*::extra_args -- Extra arguments passed to nix build:' \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
        esac
    ;;
esac
;;
(search)
_arguments "${_arguments_options[@]}" : \
'-l+[Number of search results to display]:LIMIT: ' \
'--limit=[Number of search results to display]:LIMIT: ' \
'-c+[Name of the channel to query (e.g nixos-23.11, nixos-unstable)]:CHANNEL: ' \
'--channel=[Name of the channel to query (e.g nixos-23.11, nixos-unstable)]:CHANNEL: ' \
'-f+[Flake to read what nixpkgs channels to search for]:FLAKE:_files -/' \
'--flake=[Flake to read what nixpkgs channels to search for]:FLAKE:_files -/' \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help]' \
'--help[Print help]' \
':query -- Name of the package to search:' \
&& ret=0
;;
(clean)
_arguments "${_arguments_options[@]}" : \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help]' \
'--help[Print help]' \
":: :_nh__clean_commands" \
"*::: :->clean" \
&& ret=0

    case $state in
    (clean)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:nh-clean-command-$line[1]:"
        case $line[1] in
            (all)
_arguments "${_arguments_options[@]}" : \
'-k+[At least keep this number of generations]:KEEP: ' \
'--keep=[At least keep this number of generations]:KEEP: ' \
'-K+[At least keep gcroots and generations in this time range since now]:KEEP_SINCE: ' \
'--keep-since=[At least keep gcroots and generations in this time range since now]:KEEP_SINCE: ' \
'-n[Only print actions, without performing them]' \
'--dry[Only print actions, without performing them]' \
'-a[Ask for confimation]' \
'--ask[Ask for confimation]' \
'--nogc[Don'\''t run nix store --gc]' \
'--nogcroots[Don'\''t clean gcroots]' \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(user)
_arguments "${_arguments_options[@]}" : \
'-k+[At least keep this number of generations]:KEEP: ' \
'--keep=[At least keep this number of generations]:KEEP: ' \
'-K+[At least keep gcroots and generations in this time range since now]:KEEP_SINCE: ' \
'--keep-since=[At least keep gcroots and generations in this time range since now]:KEEP_SINCE: ' \
'-n[Only print actions, without performing them]' \
'--dry[Only print actions, without performing them]' \
'-a[Ask for confimation]' \
'--ask[Ask for confimation]' \
'--nogc[Don'\''t run nix store --gc]' \
'--nogcroots[Don'\''t clean gcroots]' \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(profile)
_arguments "${_arguments_options[@]}" : \
'-k+[At least keep this number of generations]:KEEP: ' \
'--keep=[At least keep this number of generations]:KEEP: ' \
'-K+[At least keep gcroots and generations in this time range since now]:KEEP_SINCE: ' \
'--keep-since=[At least keep gcroots and generations in this time range since now]:KEEP_SINCE: ' \
'-n[Only print actions, without performing them]' \
'--dry[Only print actions, without performing them]' \
'-a[Ask for confimation]' \
'--ask[Ask for confimation]' \
'--nogc[Don'\''t run nix store --gc]' \
'--nogcroots[Don'\''t clean gcroots]' \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help]' \
'--help[Print help]' \
':profile:_files' \
&& ret=0
;;
        esac
    ;;
esac
;;
(completions)
_arguments "${_arguments_options[@]}" : \
'-s+[Name of the shell]:SHELL:(bash elvish fish powershell zsh)' \
'--shell=[Name of the shell]:SHELL:(bash elvish fish powershell zsh)' \
'-v[Show debug logs]' \
'--verbose[Show debug logs]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
        esac
    ;;
esac
}

(( $+functions[_nh_commands] )) ||
_nh_commands() {
    local commands; commands=(
'os:NixOS functionality' \
'home:Home-manager functionality' \
'search:Searches packages by querying search.nixos.org' \
'clean:Enhanced nix cleanup' \
'completions:Generate shell completion files into stdout' \
    )
    _describe -t commands 'nh commands' commands "$@"
}
(( $+functions[_nh__clean_commands] )) ||
_nh__clean_commands() {
    local commands; commands=(
'all:Cleans root profiles and calls a store gc' \
'user:Cleans the current user'\''s profiles and calls a store gc' \
'profile:Cleans a specific profile' \
    )
    _describe -t commands 'nh clean commands' commands "$@"
}
(( $+functions[_nh__clean__all_commands] )) ||
_nh__clean__all_commands() {
    local commands; commands=()
    _describe -t commands 'nh clean all commands' commands "$@"
}
(( $+functions[_nh__clean__profile_commands] )) ||
_nh__clean__profile_commands() {
    local commands; commands=()
    _describe -t commands 'nh clean profile commands' commands "$@"
}
(( $+functions[_nh__clean__user_commands] )) ||
_nh__clean__user_commands() {
    local commands; commands=()
    _describe -t commands 'nh clean user commands' commands "$@"
}
(( $+functions[_nh__completions_commands] )) ||
_nh__completions_commands() {
    local commands; commands=()
    _describe -t commands 'nh completions commands' commands "$@"
}
(( $+functions[_nh__home_commands] )) ||
_nh__home_commands() {
    local commands; commands=(
'switch:Build and activate a home-manager configuration' \
'build:Build a home-manager configuration' \
'info:Show an overview of the installation' \
    )
    _describe -t commands 'nh home commands' commands "$@"
}
(( $+functions[_nh__home__build_commands] )) ||
_nh__home__build_commands() {
    local commands; commands=()
    _describe -t commands 'nh home build commands' commands "$@"
}
(( $+functions[_nh__home__info_commands] )) ||
_nh__home__info_commands() {
    local commands; commands=()
    _describe -t commands 'nh home info commands' commands "$@"
}
(( $+functions[_nh__home__switch_commands] )) ||
_nh__home__switch_commands() {
    local commands; commands=()
    _describe -t commands 'nh home switch commands' commands "$@"
}
(( $+functions[_nh__os_commands] )) ||
_nh__os_commands() {
    local commands; commands=(
'switch:Build and activate the new configuration, and make it the boot default' \
'boot:Build the new configuration and make it the boot default' \
'test:Build and activate the new configuration' \
'build:Build the new configuration' \
'info:Show an overview of the system'\''s info' \
    )
    _describe -t commands 'nh os commands' commands "$@"
}
(( $+functions[_nh__os__boot_commands] )) ||
_nh__os__boot_commands() {
    local commands; commands=()
    _describe -t commands 'nh os boot commands' commands "$@"
}
(( $+functions[_nh__os__build_commands] )) ||
_nh__os__build_commands() {
    local commands; commands=()
    _describe -t commands 'nh os build commands' commands "$@"
}
(( $+functions[_nh__os__info_commands] )) ||
_nh__os__info_commands() {
    local commands; commands=()
    _describe -t commands 'nh os info commands' commands "$@"
}
(( $+functions[_nh__os__switch_commands] )) || _nh__os__switch_commands() {
    local commands; commands=()
    _describe -t commands 'nh os switch commands' commands "$@"
}
(( $+functions[_nh__os__test_commands] )) ||
_nh__os__test_commands() {
    local commands; commands=()
    _describe -t commands 'nh os test commands' commands "$@"
}
(( $+functions[_nh__search_commands] )) ||
_nh__search_commands() {
    local commands; commands=()
    _describe -t commands 'nh search commands' commands "$@"
}

if [ "$funcstack[1]" = "_nh" ]; then
    _nh "$@"
else
    compdef _nh nh
fi
