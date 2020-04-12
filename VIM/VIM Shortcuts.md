### Normal Mode
| Keystrokes        | Note |
| :-------------: |:------------- |
|`gv`| Reselect the last visual selection |
|`~` | Changes the case of current character |
|`guu` | Change current line from upper to lower |
|`gUU` | Change current LINE from lower to upper |
|`g~~` | Invert case to entire line |
|`>G` | command increases the indentation from the current line until the end of the file |
|`daw`| Delete an Entire Word |
|`A`| appends at the end of the current line |
|`I`| appends at the beginning of the current line | 
| `;`| Repeat latest f, t, F or T [count] times. |
| `,`| Repeat latest f, t, F or T in opposite direction [count] times |
| `cW`| Change word |
|`<C-a>` | commands perform addition on numbers |
|`<C-x>` | commands perform subtraction on numbers |
|`c`| Delete text and start insert |
|`dl`| Delete a single character and start insert |
|`C-^`|toggel between buffers|
|`wa`| Write all modified buffers to disk |

### Insert Mode
| Keystrokes        | Note |
| :-------------: |:------------- |
|`<C-h>`| Delete back one character (backspace) (works in the bash shell)|
|`<C-w>`| Delete back one word (works in the bash shell)|
|`<C-u>`| Delete back to start of line (works in the bash shell)|
|`<C-r>0`|paste the yanked text at the current cursor position|
|`viw`|visually select the word|

### Visual Mode
| Keystrokes        | Note |
| :-------------: |:------------- |
|`o`|Go to other end of highlighted text|
|`vit`|visually select inside the tag|

| Text Object        | Selection |  Text Object  | Selection |
| :-------------: |:------------- | :-------------: | :-------------: |
|`a)` or `ab`|  A pair of (parentheses)|`i)` or `ib`|Inside of (parentheses)|
|`a}` or `aB`|  A pair of {braces}|`i}` or `iB`|Inside of {braces}|
|`a]`| A pair of [brackets]|`i]`|Inside of [brackets]|
|`a>`| A pair of `<angle brackets>`|`i>`|Inside of `<angle brackets>`|
|`a’`| A pair of 'single quotes'|`i’`|Inside of 'single quotes'|
|`a"`| A pair of "double quotes"|`i"`|Inside of "double quotes"|
|`` a` ``| A pair of `backticks`|`` i` ``|Inside of `backticks`|
|`at`| A pair of <xml>tags</xml>|`it`|Inside of <xml>tags</xml>|

| Keystrokes | Current... | Keystrokes | Current...|
| :--------: |:---------- | :--------: |:----------|
|`iw`|word|`aw`|word plus space(s)|
|`iW`|WORD|`aW`|WORD plus space(s)|
|`is`|sentence|`as`|sentence plus space(s)|
|`ip`|paragraph|`ap`|paragraph plus blank line(s)|

  
  
  

### Command-Line Mode
| Keystrokes        | Note |
| :-------------: |:------------- |
|`:6t.`      | copy line 6 to just below the current line |
|`:t6`       | copy the current line to just below line 6 |
|`:t.`       | duplicate the current line |
|`:t$`       | copy the current line to the end of the file |
|`:'<,'>t0`  | copy the visually selected lines to the start of the file |
|`:[range]move {address}`| Move the lines given by [range] to below the line given by {address} |
|`:%normal A;`|append a semicolon at the end of every line of the file|
|`:%normal i//`|append // at the end of every line of the file|
|`@:`|repeat the last Ex command|
|`C-d`|reveal a list of possible completions|
|`C-rC-w`|gets the word under the cursor|
|`q:`|Open the command-line window with history of searches|
|`q/`|Open the command-line window with history of Ex commands|
|`:shell`| start an interactive shell session|
|`exit`| exit from shell session|
|`:!{cmd}`|Execute {cmd} with the shell|
|`:read !{cmd}`|Execute {cmd} in the shell and insert its standard output below the cursor|
|`:[range]write !{cmd}`|Execute {cmd} in the shell with [range] lines as standard input|

### Windows
| Ex Command | Keystrokes | Effect |
| :-------------: |:------------- | :-----------|
|`:clo`|`<C-w>c`|Close the active window|
|`:on`|`<C-w>o`|Keep only the active window, closing all others|


### Tabs
| Ex Command | Keystrokes | Effect |
| :-------------: |:------------- | :-----------|
|`tabn[ext] {N}`|`{N}gt`|Switch to tab page number {N}|
|`:tabn[ext]`|`gt`|Switch to the next tab page|
|`:tabp[revious]`|`gT`|Switch to the previous tab page|

| Command | Effect |
| :------:|:-------|
|`:tabe[dit] {filename}`|Open {filename} in a new tab|
|`:tabc[lose]`|Close the current tab page and all of its windows|
|`:tabo[nly]`|Keep the active tab page, closing all others|


### Files
| Ex Command | Effect |
| :-------------: | :-----------|
|`:edit %:h<Tab>`|show full path of the current file’s directory to edit|


### Automatic Marks
| Keystrokes | Buffer Contents |
| :-------------: | :-----------|
|``` `` ```| Position before the last jump within current file |
|`` `. ``| Location of last change |
|`` `^ ``| Location of last insertion |
|`` `[ ``| Start of last change or yank |
|`` `] ``| End of last change or yank |
|`` `< ``| Start of last visual selection |
|`` `> ``| End of last visual selection |
| `%` | jump between opening and closing sets of parentheses |



| Command | Effect |
| :-------------: | :-----------|
|`%`| Jump to matching parenthesis |
|`(/)`| Jump to start of previous/next sentence|
|`{/}`| Jump to start of previous/next paragraph|
|`H/M/L`| Jump to top/middle/bottom of screen|
|`gf`| Jump to file name under the cursor|
|`<C-]>`| Jump to definition of keyword under the cursor|
|`` ’{mark} `` / `` `{mark} `` | Jump to a mark|


### Register
| Register |  |
| :-------------: | :-----------|
|`"0`| The Yank Register |
|`""`| The Unnamed Register |
|`"a–"z`| The Named Registers (_"ayiw_)|
| `"_` | The Black Hole Register ("_diw)|
