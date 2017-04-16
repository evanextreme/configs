eval (thefuck --alias | tr '\n' ';')
alias python "python3"
alias pip "pip3"
alias mars "java /Users/Evan/Mars.jar/"

function setAWSENV
      set -Ux AWS_ACCESS_KEY_ID AKIAJX4RPDJT6AZ6XCFA
      set -Ux AWS_SECRET_ACCESS_KEY wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
end 

set -gx PATH /opt/metasploit-framework/bin $PATH
alias selfie "/Users/Evan/selfie/selfie"
alias setoolkit "sudo /Users/Evan/set/setoolkit"

function transfer
    if test (count $argv) -eq 0
        echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    end

    ## get temporarily filename, output is written to this file show progress can be showed
    set tmpfile ( mktemp -t transferXXX )

    ## upload stdin or file
    set file $argv[1]

    #if tty -s;
    #then
        set basefile (basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')

    #    if [ ! -e $file ];
    #    then
    #        echo "File $file doesn't exists."
    #        return 1
    #    fi

        if test -d $file
            # zip directory and transfer
            set zipfile ( mktemp -t transferXXX.zip )
            # echo (dirname $file)
            #cd (dirname $file) and echo (pwd)
            zip -r -q - $file >> $zipfile
            curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
            rm -f $zipfile
        else
            # transfer file
            curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
        end
    #else
    #    # transfer pipe
    #    curl --progress-bar --upload-file "-" "https://transfer.sh/$file" >> $tmpfile
    #fi

    ## cat output link
    cat $tmpfile

    ## cleanup
    rm -f $tmpfile
end
