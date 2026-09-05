# Hide Folder Toggle

A simple Windows batch script that lets you quickly **hide or show a folder** by toggling its `Hidden` and `System` attributes.

The script works as a toggle: run it once to hide the folder, and run it again to show the folder.

## Features

* Simple one-click folder hiding
* Toggles the folder between hidden and visible states
* Uses built-in Windows `attrib` command
* No additional software required
* Works directly from a `.bat` file

## Requirements

* Windows
* A folder that you want to hide

## Configuration

Open the `.bat` file and change:

```batch
set "vf=folder name"
```

Replace `folder name` with the name or path of the folder you want to control.

For example:

```batch
set "vf=Private"
```

Or use a full path:

```batch
set "vf=C:\Users\User\Documents\Private"
```

## Usage

Run the batch file.

### If the folder is visible

The script will add the `System` and `Hidden` attributes:

```text
attrib +S +H
```

The folder will become hidden from normal Windows Explorer views.

### If the folder is hidden

The script will remove the `System` and `Hidden` attributes:

```text
attrib -S -H
```

The folder will become visible again.

## How It Works

The script checks whether the folder has the `Hidden (H)` and `System (S)` attributes:

```batch
attrib "%vf%" | find "S" > nul
attrib "%vf%" | find "H" > nul
```

If both attributes are detected, they are removed:

```batch
attrib -S -H "%vf%"
```

Otherwise, the script adds them:

```batch
attrib +S +H "%vf%"
```

This creates a simple hide/show toggle.

## Script

```batch
@echo off
title=Hide folder

set "vf=folder name"

attrib "%vf%" | find "S" > nul
attrib "%vf%" | find "H" > nul

if %errorlevel%==0 (
    attrib -S -H "%vf%"
    echo Hide.
) else (
    attrib +S +H "%vf%"
    echo Show.
)
```

## Important Note

This script does **not provide real security or encryption**.

It only changes Windows file attributes. Anyone who enables viewing of hidden/system files or uses the command line can still find the folder.

For protecting sensitive data, use proper encryption instead.

## License

This project is provided as-is for personal and educational use.
