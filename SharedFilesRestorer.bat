

copy MAIN.m C:\Documents and Settings\All Users\Documentos\MachZehnderInterferometricBeamSinthetizer

copy MAIN.vi C:\Documents and Settings\All Users\Documentos\MachZehnderInterferometricBeamSinthetizer

copy SLM_Calibrator.vi C:\Documents and Settings\All Users\Documentos\MachZehnderInterferometricBeamSinthetizer

set path=%cd%
cd C:\Documents and Settings\All Users\Documentos\MachZehnderInterferometricBeamSinthetizer

rd /q /s Holograms
md Holograms

rd /q /s Images
md Images

rd /q /s Simulations
md Simulations

md +scripts
md SupportFiles

cd %path%

xcopy "+scripts" "C:\Documents and Settings\All Users\Documentos\MachZehnderInterferometricBeamSinthetizer\+scripts"

xcopy SupportFiles "C:\Documents and Settings\All Users\Documentos\MachZehnderInterferometricBeamSinthetizer\SupportFiles"