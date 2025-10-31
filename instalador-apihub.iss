#define MyAppName "ApiHub"
#define MyAppVersion "25.02.6.0"
#define MyAppPublisher "Copyright © 2025 Infarma Sistemas"
#define MyAppURL "https://infarma.com.br"

[Setup]
AppId={{F74F092B-1AB4-4C9D-9955-45E7DA539044}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
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

Name: "{commondesktop}\APIHUB"; Filename: "http://127.0.0.1:3334/dashboard"; WorkingDir: "{app}"; IconFilename: "{app}\assets\apihub.ico"
Name: "{commondesktop}\Gerenciador Apihub"; Filename: "{app}\GerenciadorApihub.exe"; WorkingDir: "{app}";IconFilename: "{app}\assets\apihub-white.ico"
;Name: "{userstartup}\Iniciar ApiHub"; Filename: "{app}\iniciar-apihub.bat"; WorkingDir: "{app}"; IconFilename: "{app}\apihub.ico"
;Name: "{userstartup}\Redis - ApiHub"; Filename: "{app}\redis-server.exe"; WorkingDir: "{app}"; IconFilename: "{app}\apihub.ico" 


[Run]
Filename: "cmd.exe"; Parameters: "/C del /F /Q ""{app}\unins*.exe"""; Flags: runhidden
Filename: "cmd.exe"; Parameters: "/C del /F /Q ""{app}\unins*.dat"""; Flags: runhidden  
Filename: "notepad.exe"; Description: "Abrir instruções para instalação ApiHub"; Parameters: "{app}\README.txt"; Flags: nowait postinstall skipifsilent
;Filename: "notepad.exe"; Description: "Abrir arquivo ENV - ApiHub"; Parameters: "{app}\.env.txt"; Flags: nowait postinstall skipifsilent


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
      Log('Permissões aplicadas com sucesso em: ' + FilePath)
    else
      Log('Erro ao aplicar permissões em: ' + FilePath + ', Código: ' + IntToStr(ErrorCode));
  end
  else
    Log('Arquivo não encontrado: ' + FilePath);
end;

procedure InitializeWizard;
begin
  ShouldRun := False;
end;
