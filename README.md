# learning-batch

Learning Batch, and things related to command line on Windows.

## Useful Commands

Item | Command<br>/ Shortcut | CMD | PS | MinGW | Description
:--- | :---: | :---: | :---: | :---: | :---
Clear screen | `cls` | X | - | - | Clear screen command.
Clear screen | <kbd>CTRL</kbd> + <kbd>K</kbd> | - | X | X | Clear screen shortcut.
List files | `dir` | X | - | - | List files of the current directory.
List files | `ls`  | - | X | X | List files of the current directory.
Hashing | `certUtil` | X | X | X | Verify checksum<br>`certUtil -hashfile \path\To\File [HashAlgorithm]`
Command type | `type` | - | - | X | Type of the current command.
Print file | `type` | X | X | - | Print file content.
Print file | `Get-Content` | - | X | - | Print file content.
Print file | `cat` | - | - | X | Print file content.

- **CMD**: Windows Command Prompt
- **PS**: Windows PowerShell
- **MinGW**: Minimalist GNU for Windows

## Debug

Echo each line executed by enabling the echo. Or do nothing, since this is the default behavior:

```bat
@ECHO ON
```

Do not echo each line executed by disabling the echo:

```bat
@ECHO OFF
```

See: [What does “@” mean in Windows batch scripts](https://stackoverflow.com/questions/8486042/what-does-mean-in-windows-batch-scripts)
