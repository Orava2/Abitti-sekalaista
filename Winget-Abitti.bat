@echo off

REM Esimerkki kuinka Windowsin winget-komennolla voi asentaa Abitti-ohjelmia.
REM Testataan automaattisesti onko Winget asennettu ja riittävän uusi versio. Wingetin voi asentaa myös Storesta https://apps.microsoft.com/store/detail/sovellusten-asennusohjelma/9NBLGGH4NNS1

REM Kysytään käyttäjältä admin-oikeudet.
if not "%1"=="am_admin" (powershell start -verb runas '%0' 'am_admin "!UNCPATH!"' & exit /b)

REM Testataan verkkoyhteys
echo.
echo TESTATAAN TOIMIIKO VERKKOYHTEYS
set "noServer="
ping 8.8.8.8 >nul || (
	set "noServer=true"
	echo *** VERKKOYHTEYS EI TOIMI ***
	echo Tarkista onko kone verkossa^!
	echo ------------------------------------------------
	goto end
)
if not "%noServer%"=="true" (
	echo *** YHTEYS TOIMII ***
)

REM Testataan onko Winget asennettu
REM Asenna uusin Microsoft.DesktopAppInstaller
REM https://learn.microsoft.com/en-us/windows/msix/app-installer/install-update-app-installer
REM https://learn.microsoft.com/en-us/windows/package-manager/winget/#install-winget-on-windows-sandbox
REM Add-AppxPackage -Path https://aka.ms/getwinget
REM Tämä vaatii riittävän uuden version Microsoft.UI.Xaml.2.8:sta.

REM Tarkistetaan onko Winget/Microsoft.DesktopAppInstaller asennettu ja riittävän uusi.
REM if ([System.Version](Get-AppxPackage Microsoft.DesktopAppInstaller).Version -lt [System.Version]"1.22.1000" )
echo.
echo TESTATAAN ONKO WINGET ASENNETTU JA TARPEEKSI UUSI VERSIO
powershell -Command "& {	[System.Version](Get-AppxPackage Microsoft.DesktopAppInstaller).Version }"
powershell -Command "& {	IF ([System.Version](Get-AppxPackage Microsoft.DesktopAppInstaller).Version -lt [System.Version]'1.22.1000' ) {write-host "*** WINGET ON PAIVITETTAVA ***"; write-host "Asennetaan Winget..."; Add-AppxPackage -Path "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx" ;Add-AppxPackage -Path "https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx" ;Add-AppxPackage -Path "https://aka.ms/getwinget" } ELSE { write-host "*** WINGET ON ASENNETTU JA RIITTAVAN UUSI ***"   }         }"
where winget

REM Ohjelmien asennukset
echo.
echo ASENNETAAN SEURAAVAT ABITTI-OHJELMAT
echo - Marvin Sketch OpenJDK
echo - Dia
echo - GeoGebra Classic 6
REM echo - Gimp
echo - Inkscape
echo - LibreOffice
echo - Okular
echo - SpeedCrunch
REM echo - wxMaxima
echo.

pause

echo.
echo ASENNETAAN MARVIN SKETCH OpenJDK
REM Marvin Sketch OpenJDK-versio
REM  https://dl.chemaxon.com/marvin/22.9.0/marvin_windows-x64_22.9_openjdk11.exe
winget install ChemAxon.Marvin --version 22.9.0 --accept-source-agreements --source winget
REM Lisenssikoodi
REM setx -m  CHEMAXON_LICENSE_SERVER_KEY "lk_68..."

echo.
echo ASENNETAAN DIA
REM Dia, vektorigrafiikka, http://dia-installer.de
winget install gnome.Dia --source winget

echo.
echo ASENNETAAN GEOGEBRA CLASSIC 6
REM GeoGebra Classic 6,	symbolinen laskenta (CAS), http://www.geogebra.org
winget install GeoGebra.Classic --source winget

REM echo.
REM echo ASENNETAAN GIMP
REM GIMP, kuvankäsittely, http://gimp.org
REM winget install GIMP.GIMP --scope machine --source winget

echo.
echo ASENNETAAN INKSCAPE
REM Inkscape, vektorigrafiikka, http://inkscape.org
winget install Inkscape.Inkscape --version 1.0.2.2 --source winget

echo.
echo ASENNETAAN LIBREOFFICE
REM LibreOffice, tekstinkäsittely, taulukkolaskenta, esitysgrafiikka, vektorigrafiikka, https://www.libreoffice.org
winget install TheDocumentFoundation.LibreOffice.LTS --version 7.6.6.3 --source winget

echo.
echo ASENNETAAN OKULAR
REM Okular, dokumenttien katseluohjelma, https://okular.kde.org
winget install KDE.Okular --source winget

echo.
echo ASENNETAAN SPEEDCRUNCH
REM SpeedCrunch, laskin, https://speedcrunch.org
winget install SpeedCrunch.SpeedCrunch --source winget

REM echo.
REM echo ASENNETAAN WXMAXIMA
REM wxMaximan, symbolinen laskenta (CAS), http://andrejv.github.io/wxmaxima
REM winget install MaximaTeam.Maxima --source winget

echo.
echo ASENTUNEET OHJELMAT:
winget list --accept-source-agreements | findstr /I "ChemAxon.Marvin gnome.Dia GeoGebra.Classic GIMP.GIMP Inkscape.Inkscape TheDocumentFoundation.LibreOffice.LTS KDE.Okular SpeedCrunch.SpeedCrunch MaximaTeam.Maxima"

echo.

:end
pause


