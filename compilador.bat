@setlocal
@echo off

set path="c:\Arquivos de Programas\winrar\";%path%

winrar.exe a cf.zip conf.lua main.lua msgothic.ttc matrix.lua

rename cf.zip game.love

copy /b love.exe+game.love jogo.exe

del game.love rem comentario

start jogo.exe