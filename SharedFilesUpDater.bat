set path=%cd%
cd C:\Documents and Settings\All Users\Documentos\MachZehnderInterferometricBeamSinthetizer

md +scripts
md SupportFiles


cd %path%



xcopy "+scripts" "C:\Documents and Settings\All Users\Documentos\MachZehnderInterferometricBeamSinthetizer\+scripts" \E

xcopy SupportFiles "C:\Documents and Settings\All Users\Documentos\MachZehnderInterferometricBeamSinthetizer\SupportFiles" \E

xcopy Holograms "C:\Documents and Settings\All Users\Documentos\MachZehnderInterferometricBeamSinthetizer\Holograms" \E

copy MAIN.m "C:\Documents and Settings\All Users\Documentos\MachZehnderInterferometricBeamSinthetizer"

copy MAIN.vi "C:\Documents and Settings\All Users\Documentos\MachZehnderInterferometricBeamSinthetizer"

copy SLM_Calibrator.vi "C:\Documents and Settings\All Users\Documentos\MachZehnderInterferometricBeamSinthetizer"