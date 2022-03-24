unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.Layouts, FMX.ListBox, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, IdComponent, IdBaseComponent,
  IdTCPConnection, IdTCPClient, System.JSON, GenericSocket, GenericSocket.Interfaces;

type
  TForm5 = class(TForm)
    Layout1: TLayout;
    Button4: TButton;
    Layout2: TLayout;
    Memo1: TMemo;
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ClientSocket : iGenericSocket;
  public
    { Public declarations }
    function route(Message : String) : String;
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

procedure TForm5.Button4Click(Sender: TObject);
begin
  ClientSocket
    .SocketClient
      .RegisterCallback('/route', route)
      .Connect('192.168.0.128', 8080, '@socket_name');
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  ClientSocket := TGenericSocket.New;
end;

function TForm5.route(Message: String): String;
begin
  Result := 'Callback '+Message;
end;

end.
