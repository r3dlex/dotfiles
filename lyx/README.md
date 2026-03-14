# LyX Configuration

LyX document processor templates and layouts.

## Contents

- `external_templates` - External template definitions for embedding various file types (spreadsheets, images, diagrams, music notation, source code)
- `layouts/abntex2.layout` - ABNT (Brazilian academic standards) document layout
- `layouts/exam.layout` - Exam document class with questions, multiple choice, and answer environments

## Installation

Copy the files to your LyX configuration directory:

```bash
# macOS
cp -r layouts/* ~/Library/Application\ Support/LyX/layouts/
cp external_templates ~/Library/Application\ Support/LyX/

# Linux
cp -r layouts/* ~/.lyx/layouts/
cp external_templates ~/.lyx/
```

Then reconfigure LyX: Tools > Reconfigure.
