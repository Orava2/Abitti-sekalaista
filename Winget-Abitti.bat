@echo off

REM Esimerkki kuinka Windowsin winget-komennolla voi asentaa Abitti-ohjelmia.
REM Jos Winget ei ole sannettuna, lataa se Storesta https://apps.microsoft.com/store/detail/sovellusten-asennusohjelma/9NBLGGH4NNS1

REM Kysytään käyttäjältä admin-oikeudet.
if not "%1"=="am_admin" (powershell start -verb runas '%0' 'am_admin "!UNCPATH!"' & exit /b)

echo ASENNETAAN SEURAAVAT ABITTI-OHJELMAT
echo.
echo - Marvin Sketch OpenJDK
echo - Dia
echo - GeoGebra Classic 6
echo - Gimp
echo - Inkscape
echo - LibreOffice
echo - Okular
echo - SpeedCrunch
echo - wxMaxima
echo.

pause

echo.
echo ASENNETAAN MARVIN SKETCH OpenJDK
REM Marvin Sketch OpenJDK-versio
REM  https://dl.chemaxon.com/marvin/22.9.0/marvin_windows-x64_22.9_openjdk11.exe
winget install ChemAxon.Marvin --version 22.9.0 --accept-source-agreements
REM Lisenssikoodi
setx -m  CHEMAXON_LICENSE_SERVER_KEY "lk_1234567890987654321"

echo.
echo ASENNETAAN DIA
REM Dia, vektorigrafiikka, http://dia-installer.de
winget install gnome.Dia

echo.
echo ASENNETAAN GEOGEBRA CLASSIC 6
REM GeoGebra Classic 6,	symbolinen laskenta (CAS), http://www.geogebra.org
winget install GeoGebra.Classic --scope machine

echo.
echo ASENNETAAN GIMP
REM GIMP, kuvankäsittely, http://gimp.org
winget install GIMP.GIMP --scope machine

echo.
echo ASENNETAAN INKSCAPE
REM Inkscape, vektorigrafiikka, http://inkscape.org
winget install Inkscape.Inkscape --version 1.0.2.2

echo.
echo ASENNETAAN LIBREOFFICE
REM LibreOffice, tekstinkäsittely, taulukkolaskenta, esitysgrafiikka, vektorigrafiikka, https://www.libreoffice.org
winget install TheDocumentFoundation.LibreOffice.LTS --version 7.4.7.2

echo.
echo ASENNETAAN OKULAR
REM Okular, dokumenttien katseluohjelma, https://okular.kde.org
winget install KDE.Okular

echo.
echo ASENNETAAN SPEEDCRUNCH
REM SpeedCrunch, laskin, https://speedcrunch.org
winget install SpeedCrunch.SpeedCrunch

echo.
echo ASENNETAAN WXMAXIMA
REM wxMaximan, symbolinen laskenta (CAS), http://andrejv.github.io/wxmaxima
winget install MaximaTeam.Maxima

echo.
echo ASENTUNEET OHJELMAT:
winget list | findstr /I "ChemAxon.Marvin gnome.Dia GeoGebra.Classic GIMP.GIMP Inkscape.Inkscape TheDocumentFoundation.LibreOffice.LTS KDE.Okular SpeedCrunch.SpeedCrunch MaximaTeam.Maxima"

echo.
pause

