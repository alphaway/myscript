#!/bin/zsh
#author : litten
#description : 

`mkdir $1`
`mkdir $1/css`
`mkdir $1/js`
`touch $1/js/main.js`
`cp ~/.vim/template/html.template $1/index.html`
`cp ~/.vim/template/css.template $1/css/style.css`
`cd $1`
