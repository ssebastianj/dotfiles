# Defined in /tmp/fish.pRDsMH/llas.fish @ line 2
function llas --wraps=ls --description 'List contents of directory using long format grouping directories first'
    ls -al --group-directories-first $argv
end
