program PizzariaFrontend;

uses
  Vcl.Forms,
  UFrmPrincipalImpl in '..\pas\ui\UFrmPrincipalImpl.pas' {Form1},
  UPizzaSaborEnum in '..\..\shared\pas\enum\UPizzaSaborEnum.pas',
  UPizzaTamanhoEnum in '..\..\shared\pas\enum\UPizzaTamanhoEnum.pas',
  UPedidoEfetuarDTOImpl in '..\..\shared\pas\dto\UPedidoEfetuarDTOImpl.pas',
  UPedidoRetornoDTOImpl in '..\..\shared\pas\dto\UPedidoRetornoDTOImpl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
