#!/usr/bin/env bash

source functions.sh

raw_questiona_data=$(load_question)
question=$(echo "${raw_questiona_data}" | jq -r '.question')
correct_answer=$(echo "${raw_questiona_data}" | jq -r '.correct_answer')

print_question() {
    echo "${question}"
    echo "${correct_answer}"
    echo "${raw_questiona_data}" | jq -r '.incorrect_answers[0]'
    echo "${raw_questiona_data}" | jq -r '.incorrect_answers[1]'
    echo "${raw_questiona_data}" | jq -r '.incorrect_answers[2]'

}

ask_question() {
    local question_to_print="$1"
    local correct_answer_of_question="$2"
    local incorrect_answer_1="$3"
    local incorrect_answer_2="$4"
    local incorrect_answer_3="$5"

    sorted_answers=$(echo -e "${2}\n${3}\n${4}\n${5}" | sort -R)

    echo "${question//'&quot;'/'"'}"
    IFS=$'\n'
    select answer in ${sorted_answers}; do
        if [[ $answer == "${correct_answer_of_question}" ]]; then
            echo "Correct answer!"
            return 0
        else
            echo "Incorrect answer :( )"
            return 1
        fi
    done

}

main() {
    local question_to_print
    local correct_answer_of_question
    local incorrect_answer_1
    local incorrect_answer_2
    local incorrect_answer_3
    {
        read -r question_to_print
        read -r correct_answer_of_question
        read -r incorrect_answer_1
        read -r incorrect_answer_2
        read -r incorrect_answer_3
    } < <(print_question)

    ask_question \
        "${question_to_print}" \
        "${correct_answer_of_question}" \
        "${incorrect_answer_1}" \
        "${incorrect_answer_2}" \
        "${incorrect_answer_3}"
}

main "$@"
