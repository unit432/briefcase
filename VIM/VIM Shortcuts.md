| Keystrokes        | Note |
| :-------------: |:------------- |
|`~` | Changes the case of current character |
|`guu` | Change current line from upper to lower |
|`gUU` | Change current LINE from lower to upper |
|`guw` | Change to end of current WORD from upper to lower |
|`guaw` | Change all of current WORD to lower | 
|`gUw` | Change to end of current WORD from lower to upper |
|`gUaw` | Change all of current WORD to upper. | 
|`g~~` | Invert case to entire line |
|`>G` | command increases the indentation from the current line until the end of the file |
|`daw`| Delete an Entire Word |
|`A`| appends at the end of the current line |
|`I`| appends at the beginning of the current line | 
| `;`| Repeat latest f, t, F or T [count] times. |
| `,`| Repeat latest f, t, F or T in opposite direction [count] times |
| `cW`| |
|`<C-a>` | commands perform addition on numbers |
|`<C-x>` | commands perform subtraction on numbers |
|`c`| Delete text and start insert |
|`dl`| Delete a single character and start insert |
|`ap`| motion acts upon a paragraph |
|`dap`| Delete an entire paragraph |
|`gUap`| make the whole paragraph uppercase|
|`gv`| Reselect the last visual selection |

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
