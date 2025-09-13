@echo off
echo ============================================
echo  📜 Installing Certificate Generator Requirements...
echo ============================================

:: Upgrade pip first
python -m pip install --upgrade pip

:: Install required packages
pip install pandas python-pptx pywin32 openpyxl

echo.
echo ✅ All requirements installed successfully!
echo.
pause
