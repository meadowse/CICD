#!/bin/bash

if [[ ${2} == "1" ]] && [[ $CI_JOB_STATUS == "success" ]]
    then
        exit
fi

STATUS="$(echo "$CI_JOB_STATUS")"
TIME=60

TELEGRAM_BOT_TOKEN="5939954817:AAH0Bt0VTuyXHCj43uspBdK7hmqEh1X3f4I"
TELEGRAM_USER_ID="1181510652"

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="Style test status: $1 $STATUS%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
