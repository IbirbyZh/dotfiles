#!/bin/zsh

dotfiles_dir=${0:a:h}

for file in $(ls "$dotfiles_dir"); do
    if [[ "$file" == "link.sh" ]]; then
        continue
    fi
    homedir_path="$HOME/.$file"
    if [[ -L $homedir_path ]]; then
        continue
    fi
    if [[ -e $homedir_path ]]; then 
        backup_path="$homedir_path.backup"
        mv "$homedir_path" "$backup_path"
        echo "Created backup $backup_path"
    fi
    ln -s $(realpath "$dotfiles_dir/$file") $homedir_path
done
