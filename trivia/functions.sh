#!/usr/bin/env bash

load_question() {
    local questions_data
    local number_of_questions
    local random_question_number

    questions_data=$(cat ./trivia.json)
    number_of_questions=$(echo "${questions_data}" | jq -r '.results | length')
    ((random_question_number = $RANDOM % number_of_questions))
    random_question=$(echo "${questions_data}" | jq -r ".results[${random_question_number}]")
    echo "$random_question"
}
