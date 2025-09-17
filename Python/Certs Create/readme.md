# Certificate Generator 📜

This Python script automatically generates certificates in both PPTX and PDF formats by reading data from an Excel file and using PowerPoint template files.

---

## 🚀 Prerequisites

### 1. System Requirements

- **Python 3.10 or higher** (tested on Python 3.13, Windows 11)
- **Microsoft PowerPoint** (required for PDF conversion via COM automation)

### 2. Install Required Packages

Run this command in terminal/PowerShell:

```bash
pip install pandas python-pptx pywin32 openpyxl
```

---

## 📝 Excel File Format (`students.xlsx`)

Your Excel file must contain the following columns with **exact column names**:

| Name            | Course                    | Date     | Tutor | Validation | Template |
| --------------- | ------------------------- | -------- | ----- | ---------- | -------- |
| CANDIDATE NAME1 | ABRASIVE WHEELS           | 07-08-25 | Nahid | 3 Years    | 1        |
| CANDIDATE NAME2 |                           |          |       |            |          |
| CANDIDATE NAME3 |                           | 07-08-25 |       |            |          |
| CANDIDATE NAME4 | WORKING AT HEIGHT         | 05-09-25 | Hasan | 4 Years    | 2        |
| CANDIDATE NAME5 |                           |          |       |            |          |
| CANDIDATE NAME6 | LEVEL 1 HEALTH AND SAFETY |          |       | 5 Years    |          |

### 📌 Column Descriptions

**Name** (Required)

- Candidate's full name
- Will be converted to **UPPERCASE** in certificates
- Cannot be blank

**Course** (Optional for subsequent rows)

- Course name
- If blank, automatically uses the course from the previous row
- Will be converted to **UPPERCASE** in certificates
- **Special rule**: If course contains "LEVEL 1 HEALTH AND SAFETY" (case-insensitive), automatically uses template 2

**Date** (Optional for subsequent rows)

- Course date in format: `dd-mm-yy` or `dd-mm-yyyy`
- If blank, uses the date from the previous row
- If no previous date exists, prompts user for input once
- **Certificate format**: Displays as "25 September 2025"
- **Folder format**: Uses "2025-09-25" for directory structure

**Tutor** (Optional)

- Instructor's name (preserves original case)
- If blank, uses the tutor from the previous row
- Can be completely empty - script will prompt once if needed
- User input (even if empty) applies to all subsequent blank rows

**Validation** (Optional)

- Certificate validity period
- Accepts formats: `3`, `3 Years`, `999`, etc.
- **Output**: Always displays as "X Years" format in certificates
- If blank, defaults to "3 Years"

**Template** (Optional)

- Template file to use: `1`, `2`, or `3`
- Maps to `certificate_template_1.pptx`, `certificate_template_2.pptx`, `certificate_template_3.pptx`
- If blank, uses template from previous row
- **Auto-override**: "LEVEL 1 HEALTH AND SAFETY" courses force template 2

---

## 🎯 Template Placeholders

Your PowerPoint templates should contain these placeholders (case-sensitive):

- `{{NAME}}` - Will be replaced with candidate name (UPPERCASE)
- `{{COURSE}}` - Will be replaced with course name (UPPERCASE)
- `{{DATE}}` - Will be replaced with formatted date (e.g., "25 September 2025")
- `{{TUTOR}}` - Will be replaced with tutor name (original case)
- `{{VALIDATION}}` - Will be replaced with validation period (e.g., "3 Years")

---

## ▶️ How to Run

```bash
python create_certs.py

`or`

just double click Create_certs.bat
```

The script will:

1. Read `students.xlsx` from the current directory
2. Process each row and handle missing data intelligently
3. Generate certificates in organized folder structure
4. Create both PPTX and PDF versions

---

## 📁 Output Structure

Certificates are organized in the following folder structure:

```
{COURSE NAME}/
└── {YYYY-MM-DD}/
    ├── Certificate on {COURSE NAME} - {CANDIDATE NAME}.pdf
    └── PPTX/
        └── Certificate on {COURSE NAME} - {CANDIDATE NAME}.pptx
```

**Example:**

```
ABRASIVE WHEELS/
└── 2025-08-07/
    ├── Certificate on ABRASIVE WHEELS - JOHN SMITH.pdf
    └── PPTX/
        └── Certificate on ABRASIVE WHEELS - JOHN SMITH.pptx
```

---

## ✅ Key Features

- **Smart data filling**: Automatically inherits values from previous rows when cells are blank
- **Interactive prompts**: Asks for missing critical data only once per session
- **Template preservation**: Maintains all PowerPoint formatting (fonts, colors, alignment)
- **Dual output**: Generates both editable PPTX and final PDF versions
- **Organized storage**: Creates logical folder structure by course and date
- **Error handling**: Validates templates exist and handles date parsing gracefully
- **Case handling**: Converts names/courses to uppercase while preserving tutor case
- **Batch processing**: Processes multiple candidates efficiently with progress tracking

---

## 🛠️ Troubleshooting

**"Template file not found" error:**

- Ensure template files exist in `templates/` folder
- Check template numbers (1, 2, 3) match available files

**"Could not parse date" error:**

- Use dd-mm-yy or dd-mm-yyyy format in Excel
- Ensure dates are in Date format, not Text

**PDF conversion fails:**

- Verify Microsoft PowerPoint is installed
- Run PowerPoint once manually to accept any license agreements
- Close any open PowerPoint instances before running the script
