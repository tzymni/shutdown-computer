@echo off
set /p mins=Prosze podaj za ile minut mam sie wylaczyc Asiu moja Pani:

for /L %%a in (0,1,%mins%) do (
    PING -n 60 127.0.0.1>nul
)
shutdown /s