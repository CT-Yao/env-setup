#!/bin/bash

#================================================
# 2-format-output.sh
#
# - Author: Chengtao Yao
# - Email: chengtao.yao@outlook.com
# - Last Modified: 2021-08-15 19:38:55 
#
# The script for format output, includes status/
# warning/error info format and confirm/query 
# format.
#================================================

FORMAT_SOURCED=1

#------------------------------------------------
# 1. Format Output
#------------------------------------------------

# usage: status [text]
status() {
    if [ -z $TERM ]; then
        echo $1
    else
        echo $(tput setaf 6; tput bold)$1$(tput sgr0)
    fi
}


# usage: warning [text]
warning() {
    if [ -z $TERM ]; then
        echo $1
    else
        echo $(tput setaf 3; tput bold)$1$(tput sgr0)
    fi
}


# usage: error [text]
error() {
    if [ -z $TERM ]; then
        echo $1
    else
        echo $(tput setaf 1; tput bold)$1$(tput sgr0)
    fi
}


#------------------------------------------------
# 2. Confirm/query Output
#------------------------------------------------

#usage: confirm [func] [text]
confirm() {
    confirm_func=$1
    query_text=${@:2}

    if query ${query_text}; then
        ${confirm_func}
    fi
}


#usage: query [text]
query() {
    query_text="> $@ [y/N]"
    while true; do
        if [ -z $TERM ]; then
            echo $1
        else
            echo -n $(tput setaf 2; tput bold)${query_text}$(tput sgr0)
        fi

        read -p " " choice

        case ${choice} in
            [Yy]*) 
                return; 
                break;;
            [Nn]* | "") 
                break;;
            *)
                warning "Please answer yes or no.";;
        esac
    done
    false
}

#------------------------------------------------
# 3. Extract Json
#------------------------------------------------

# usage: extract_json [key] [default_value]
extract_json() {
    awk -v json="$1" -v key="$2" -v default_value="$3" 'BEGIN{
        count = 0
        while(length(json) > 0) {
            pos = match(json, "\""key"\"[ \\t]*?:[ \\t]*");
            if(pos == 0){ if(count == 0) {print default_value;} exit 0; }
            ++count;
            start = 0; end = 0; layer = 0;
            for(i = pos + length(key) + 1; i <= length(json); ++i) {
                pre_char = substr(json, i-1, 1);
                cur_char = substr(json, i, 1);

                if(start <= 0) {
                    if(pre_char == ":") {
                        start = cur_char == " " ? i+1 : i;
                        if(cur_char == "{" || cur_char == "[") {
                            layer = 1;
                        }
                    }
                } else {
                    if(cur_char == "{" || cur_char == "[") {
                        ++layer;
                    }
                    if(cur_char == "}" || cur_char == "]") {
                        --layer;
                    }
                    if((cur_char == "," || cur_char == "}" || cur_char == "]") && layer <= 0) {
                        end = cur_char == "," ? i : i+1+layer;
                        break;
                    }
                }
            }
            
            if(start <= 0 || end <=0 || start > length(json) || end > length(json) || start >= end) {
                if(count == 0) {print default_value;} 
                exit 0;
            } else {
                print substr(json, start, end - start);
            }
            
            json = substr(json, end+1, length(json) - end)
        }
    }'
}
