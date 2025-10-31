#define MyAppName "ApiHub"
#define MyAppVersion "25.02.6.2"
#define MyAppPublisher "Copyright � 2025 Infarma Sistemas"
#define MyAppURL "https://infarma.com.br"

[Setup]
AppId={{F74F092B-1AB4-4C9D-9955-45E7DA539044}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
VersionInfoVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
VersionInfoCompany={#MyAppPublisher}
VersionInfoDescription={#MyAppName} Setup
VersionInfoProductName={#MyAppName}
VersionInfoProductVersion={#MyAppVersion}
VersionInfoCopyright={#MyAppPublisher}
DefaultDirName="C:\INFARMA\APIHUB\"
UsePreviousAppDir=no
DisableDirPage=yes
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir="C:\INFARMA\"
OutputBaseFilename=Instalador ApiHub Varejo 25.02fb
SetupIconFile="C:\INFARMA\APIHUB\assets\apihub.ico"
;Password=Infarma@060115. caso desejar utilizar senha, descomentar essa linha e mudar para yes na linha abaixo
Encryption=no
Compression=lzma
SolidCompression=yes
WizardStyle=modern
Uninstallable=false

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Files]
Source: "C:\INFARMA\APIHUB\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]

Name: "{commondesktop}\Gerenciador APIHUB"; Filename: "{app}\gerenciador-apiHub-2.1.6.exe"; WorkingDir: "{app}";IconFilename: "{app}\assets\apihub-white.ico"

[Run]
Filename: "cmd.exe"; Parameters: "/C del /F /Q ""{app}\unins*.exe"""; Flags: runhidden
Filename: "cmd.exe"; Parameters: "/C del /F /Q ""{app}\unins*.dat"""; Flags: runhidden  
Filename: "notepad.exe"; Description: "Abrir instruções para instalação ApiHub"; Parameters: "{app}\INSTRUÇÕES.txt"; Flags: nowait postinstall skipifsilent



[Code]
var
  ShouldRun: Boolean;

function ShouldRunBat: Boolean;
begin
  Result := ShouldRun;
end;

procedure SetFilePermissions(FilePath: string);
var
  ErrorCode: Integer;
begin
  if FileExists(FilePath) then
  begin
    Exec('icacls', '"' + FilePath + '" /grant "Todos:(RX)" /T', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
    if ErrorCode = 0 then
      Log('Permiss�es aplicadas com sucesso em: ' + FilePath)
    else
      Log('Erro ao aplicar permiss�es em: ' + FilePath + ', C�digo: ' + IntToStr(ErrorCode));
  end
  else
    Log('Arquivo n�o encontrado: ' + FilePath);
end;

procedure InitializeWizard;
begin
  ShouldRun := False;
end;
