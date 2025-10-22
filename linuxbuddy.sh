#!/bin/bash
# Linux Buddy - Windowseven Edition (Level 1, Full Final)

# ------------------ Colors ------------------
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# ------------------ Paths ------------------
LOGO_FILE=~/logo_ascii.txt
SANDBOX=~/linuxbuddy_sandbox
PROGRESS_FILE=~/linuxbuddy_progress.txt

mkdir -p "$SANDBOX"
touch "$PROGRESS_FILE"

# ------------------ Arrays ------------------
COMMANDS=("pwd" "ls" "cd" "mkdir" "rmdir" "touch" "rm" "clear" "echo" "cat" "head" "tail" "ls -l" "ls -a" "cp" "mv" "file" "man" "whoami" "date")
MEANINGS=("Present Working Directory" "List" "Change Directory" "Make Directory" "Remove Directory" "Create empty file" "Remove" "Clear screen" "Print text" "Concatenate" "Show first lines" "Show last lines" "List long format" "List all (including hidden)" "Copy" "Move" "File type" "Manual" "Who am I" "Show date/time")
EXPLANATIONS=("Inaonyesha folder ulipo sasa" "Inaonyesha files/folders zote zilizopo" "Kuhamia kati ya folders" "Kutengeneza folder mpya" "Kufuta folder tupu" "Kutengeneza file tupu" "Kufuta file" "Kusafisha terminal" "Ku-display text" "Ku-display content ya file" "Onyesha lines za mwanzo" "Onyesha lines za mwisho" "Show permissions + owner + size" "Onyesha files zote + hidden" "Duplicate file/folder" "Hamisha file/folder" "Ku-check type ya file" "Documentation ya command" "Inakuambia user ulipo sasa" "Onyesha tarehe na saa")
FUNNY=("GPS yako kwenye terminal 📍" "Ku-check kabati zako zote 😂" "Kuruka kutoka kabati moja hadi jingine 🚀" "Kutengeneza kabati jipya 🏗️" "Kubomoa kabati lililo tupu 😂" "Kuandika karatasi mpya kwenye folder" "Ku-rip file 😂" "Ku-clean board, kuanza fresh" "Kuongea na terminal 😂" "Kuona kilicho ndani ya karatasi" "Ku-check kidogo mapema" "Ku-check mwisho tu 🔚" "Inspection ya kabati 🧐" "Private files inspection 😂" "Ku-copy homework yako 🤭" "Ku-relocate kabati/karatasi" "Ku-check label ya kabati" "Teacher wako kwenye terminal 📚" "Kujitambulisha 😂" "Check system clock ⏰")
ASSIGNMENTS=("Run pwd" "Run ls" "Move to another folder using cd" "Create a folder called TestFolder using mkdir" "Delete an empty folder called TestFolder using rmdir" "Create a file called test.txt using touch" "Delete a file called test.txt using rm" "Clear the terminal using clear" "Display 'Hello World' using echo" "Display contents of a file using cat" "Show first 5 lines of a file using head" "Show last 5 lines of a file using tail" "List all details of files using ls -l" "List all files including hidden using ls -a" "Copy test.txt to test_copy.txt using cp" "Move test_copy.txt to another folder using mv" "Check type of test.txt using file" "Read the manual of ls using man ls" "Check current user using whoami" "Show date and time using date")
POINTS=(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)

TOTAL_POINTS=0

# ------------------ Functions ------------------
function welcome_page() {
    clear
    figlet -f slant "Windowseven CyberLabs" | lolcat
    echo -e "${CYAN}\nLinux Buddy — Windowseven Edition 🇹🇿${RESET}"
    echo "Karibu rafiki! 🤗 Terminal sio ya kuogopa, ni rafiki yako 😎"
    echo "Leo tutaanza safari ya Linux, kutoka zero hadi pro!\n"

    TIPS=("Usiogope terminal, hata computer inaogopa wewe 😂"
          "Kila command ni adventure mpya 💪"
          "Wewe ni hacker wa kesho, endelea!"
          "Kila directory ni adventure mpya 😂"
          "Kila command ni kama cheat code, jaribu uone matokeo!")
    TIP_INDEX=$(( RANDOM % ${#TIPS[@]} ))
    echo -e "Tip ya leo: ${TIPS[$TIP_INDEX]}\n"
    echo -e "${YELLOW}Prepared by Windowseven${RESET}"
    echo -e "${YELLOW}WhatsApp: +255766183998${RESET}"
    echo "----------------------------------------------------"
}

function lesson1() {
    for i in "${!COMMANDS[@]}"; do
        clear
        cmd="${COMMANDS[$i]}"
        meaning="${MEANINGS[$i]}"
        explanation="${EXPLANATIONS[$i]}"
        funny="${FUNNY[$i]}"
        assignment="${ASSIGNMENTS[$i]}"
        point="${POINTS[$i]}"

        echo -e "${CYAN}=== Command: $cmd ===${RESET}"
        echo -e "${YELLOW}Full Meaning:${RESET} $meaning"
        echo -e "${YELLOW}Explanation:${RESET} $explanation"
        echo -e "${YELLOW}Funny Tip:${RESET} $funny"
        echo -e "${GREEN}Assignment:${RESET} $assignment"

        echo -e "\n👉 To practice: type ${YELLOW}'sandbox'${RESET} kuingia kwenye safe zone (folder: $SANDBOX)"
        echo -e "Type ${GREEN}'done'${RESET} once umeshajaribu command hiyo..."
        read userinput

        if [ "$userinput" == "sandbox" ]; then
            cd "$SANDBOX"
            echo -e "${CYAN}Entering sandbox mode... type 'exit' kurudi kwenye lesson.${RESET}"
            bash
            cd ~
            echo -e "${GREEN}Karibu tena! Endelea na lesson.${RESET}"
            read -p "Type 'done' once umejaribu command: " userinput
        fi

        if [ "$userinput" == "done" ]; then
            TOTAL_POINTS=$((TOTAL_POINTS + point))
            echo -e "${CYAN}🔥 Hongera! Umefanikiwa kutumia '${cmd}'${RESET}"
            echo -e "💪 XP: +$point"
            echo "$cmd ✅" >> "$PROGRESS_FILE"
        else
            echo "Command skipped. XP not awarded."
        fi

        echo "Press ENTER to continue..."
        read
    done

    clear
    echo -e "${CYAN}=== LESSON 1 COMPLETED ===${RESET}"
    echo "Total XP earned: $TOTAL_POINTS"
    echo "🏆 Badges: Beginner Navigator"
    echo "Wewe ni hacker wa kesho, endelea! 😎"
    echo "----------------------------------------------------"
    echo -e "Practice each command safely in sandbox: $SANDBOX"
    echo "Press ENTER to return to main menu..."
    read
}

function show_progress() {
    clear
    echo -e "${CYAN}=== Progress / Badges ===${RESET}"
    echo "Total XP so far: $TOTAL_POINTS"
    echo "🏆 Badges: Beginner Navigator"
    echo "----------------------------------------------------"
    echo "Commands done so far:"
    cat "$PROGRESS_FILE"
    echo "----------------------------------------------------"
    echo "Press ENTER to return..."
    read
}

function help_menu() {
    clear
    echo -e "${CYAN}=== INSTRUCTIONS / HELP ===${RESET}\n"
    echo "1) Chagua lesson unayotaka kuanza kwa typing number yake"
    echo "2) Lesson itaonyesha commands muhimu + explanation ya Kiswahili"
    echo "3) Type 'sandbox' kuingia safe environment kisha 'exit' kurudi"
    echo "4) Type 'done' baada ya kujaribu command kurudi kwenye lesson"
    echo "5) Progress inahifadhiwa kwenye file: $PROGRESS_FILE"
    echo "----------------------------------------------------"
    echo "Kwa help zaidi, message Windowseven privately"
    echo "WhatsApp: +255766183998"
    echo "Press ENTER kurudi kwenye main menu..."
    read
}

# ------------------ Main Menu ------------------
while true; do
    welcome_page
    echo "1) Start Lesson 1"
    echo "2) Sandbox Mode (manual)"
    echo "3) Show Progress / Badges"
    echo "4) Instructions / Help"
    echo "0) Exit"
    echo "----------------------------------------------------"
    read -p "Chagua option: " choice

    case $choice in
        1) lesson1 ;;
        2) 
            echo "Entering Sandbox Mode (folder: $SANDBOX)..."
            cd "$SANDBOX"
            bash
            cd ~
            ;;
        3) show_progress ;;
        4) help_menu ;;
        0)
            echo "Bye! Endelea kujifunza Linux 😎"
            exit
            ;;
        *)
            echo "Option si sahihi, jaribu tena!"
            sleep 1
            ;;
    esac
done
