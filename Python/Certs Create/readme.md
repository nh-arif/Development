# Certificate Generator 📜

এই Python script টি Excel ফাইল থেকে ডেটা পড়ে স্বয়ংক্রিয়ভাবে certificate (PPTX + PDF) বানায়।  
Template ফাইল হিসেবে PowerPoint PPTX ব্যবহার করা হয়।

---

## 🚀 Prerequisites

### 1. Python

- Python 3.10+ (tested on Python 3.13, Windows 11)

### 2. Install required Python packages

Run this command in terminal / PowerShell:

```bash
pip install pandas python-pptx pywin32 openpyxl
```
---
## 📝 Excel File Format (`students.xlsx`)

তোমার Excel ফাইলে নিচের মত কলাম থাকতে হবে:

| Name            | Course       | Date     | Tutor | Validation | Template |
| --------------- | ------------ | -------- | ----- | ---------- | -------- |
| CANDIDATE NAME  | COURSE NAME1 | 07-08-25 | Nahid | 3 Years    | 1        |
| CANDIDATE NAME2 |              |          |       |            |          |
| CANDIDATE NAME3 |              | 07-08-25 |       |            |          |
| CANDIDATE NAME4 | COURSE NAME2 | 05-09-25 | Hasan | 4 Years    | 2        |
| CANDIDATE NAME5 |              |          |       |            |          |
| CANDIDATE NAME6 |              |          |       | 999        | N        |

### 📌 Column Description

 - **Name** → প্রার্থীর নাম (required)
- **Course** → কোর্সের নাম (blank থাকলে আগের row-এর course ব্যবহার হবে)
- **Date** → কোর্সের তারিখ (format: `dd-mm-yy`, blank থাকলে আগের row-এর date ব্যবহার হবে বা terminal থেকে চাইবে)
- **Tutor** → কোর্স instructor এর নাম
- **Validation** → Validity period (`n` বা `n Years` → certificate-এ সবসময় `n Years` হবে)
- **Template** →
	 - `1` → `certificate_template_1.pptx` ব্যবহার হবে
	 - `2` → `certificate_template_2.pptx` ব্যবহার হবে
  - ফাঁকা থাকলে আগের row-এর template ব্যবহার হবে
  - Course name যদি `"LEVEL 1 HEALTH AND SAFETY"` হয় (case insensitive) তবে **সরাসরি template 2** ব্যবহার হবে

---
## ▶️ Run the Script

```bash
python create_certs.py
```

Certificates গুলো আলাদা folder-এ save হবে:

```
ABRASIVE WHEELS/
└── 2025-08-07/
    ├── Certificate on COURSE NAME - CANDIDATE NAME.pdf
    ├── Certificate on COURSE NAME - CANDIDATE NAME.pptx
```

---

## ✅ Features

- Excel থেকে ডেটা অটো-ফিল
- Missing data → আগের row থেকে নেয়া বা terminal input
- Multiple template support (easily expandable)
- Case insensitive course matching
- Template formatting preserve করে (font, color, alignment, capitalization)
- Output in **both PPTX + PDF**

