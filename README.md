# jump-commands
Re implementation of some basic commands (ls, mv, cp) with autojump 

For this command to work, you need to have [autojump](https://github.com/wting/autojump) installed.

## `mv` command : `jmv`

The `jmv` command allows you to move a file or a folder to a destination specified using autojump.

`jmv` will also move your current position to the destination. 
This can be disabled by using the option `-nocd`. 

*Example* : 
> Assuming `autojump desk` outputs `~/Desktop` and that your current directory contains a folder `foo` and a file `bar.txt`

* `jmv foo desk` will move the folder `foo` to your Desktop and move your position to your Desktop

* `jmv bar.txt desk` will move the file `bar.txt` to your Desktop and move your position to your Desktop

* `jmv foo bar.txt desk` will move the folder `foo` and the file `bar.txt` to your Desktop and move your position to your Desktop

* `jmv -nocd foo bar.txt desk` will move the folder `foo` and the file `bar.txt` to your Desktop but won't change your current position

> Note : `jmv` does not support yet the options of `mv`

## `ls` command : `lj`

The behaviour of `lj` is the same as `ls`, except when the last argument is not an existing destination/path. 

*Example* : 
> Assuming `autojump desk` outputs `~/Desktop` and that your current directory contains a folder `foo` and a file `bar.txt`

* `lj` and `lj .` outputs `foo bar.txt` (same output as `ls` or `ls .`)

* `lj foo` will display the content of the directory `foo` (same as `ls foo`)

* `lj desk` will display the content of your Desktop (same as `ls ~/Desktop`)

All these commands also work if you add `ls` options to `lj`.   
*Example* : 

* `lj -lia desk` is equivalent to `ls -lia ~/Desktop`  

* `lj -lia foo` is equivalent to `ls -lia foo`  

> If you want `ls` to work by default as `lj` you can add this alias in your rc file (`~/.bashrc`, `~/.zshrc`, `~/.aliases` etc) : `alias ls='lj'`

--- 

If you have any suggestions or unexpected behaviour, feel free to create an issue :)