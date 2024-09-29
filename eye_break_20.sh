#!/bin/bash

while true; do
    # قفل کردن صفحه‌کلید و موس
    xtrlock &

    # نمایش تصویر
    feh -F -Z /opt/EyeBreak20/eye_break_warning.png &
    sleep 20

    # بستن feh و آزاد کردن کیبورد و موس
    pkill feh
    pkill xtrlock

    # نمایش پنجره دیالوگ
    response=$(zenity --title="Eye Break 20" --window-icon=question \
                      --text="Do you want to continue Eye Break 20 program?" \
                      --ok-label="Continue" --cancel-label="Quit" \
                      --timeout=10 --question)

    if [[ "$?" -eq 1 ]]; then
        break # کاربر گزینه Quit رو انتخاب کرده
    else
        # کاربر گزینه Continue رو انتخاب کرده یا زمان پنجره تمام شده
        sleep 1200
    fi
done
