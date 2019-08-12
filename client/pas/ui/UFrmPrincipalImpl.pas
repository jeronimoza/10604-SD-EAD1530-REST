unit UFrmPrincipalImpl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Rtti, REST.JSON, System.JSON;

type
  TForm1 = class(TForm)
    edtDocumentoCliente: TLabeledEdit;
    cmbTamanhoPizza: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cmbSaborPizza: TComboBox;
    Button1: TButton;
    mmRetornoWebService: TMemo;
    Label3: TLabel;
    edtEnderecoBackend: TLabeledEdit;
    Button2: TButton;
    edtPortaBackend: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  UPizzaTamanhoEnum,
  UPizzaSaborEnum,
  MVCFramework.RESTClient,
  UPedidoEfetuarDTOImpl;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  LPedidoEfetuarDTO: TPedidoEfetuarDTO;
  LRESTClient: TRESTClient;
begin
  LRESTClient := TRESTClient.Create(edtEnderecoBackend.Text, string(edtPortaBackend.Text).ToInteger());
  LRESTClient.ReadTimeOut(60000);
  try
    LPedidoEfetuarDTO := TPedidoEfetuarDTO.Create();
    try
      LPedidoEfetuarDTO.PizzaTamanho := TRttiEnumerationType.GetValue<TPizzaTamanhoEnum>(cmbTamanhoPizza.Text);
      LPedidoEfetuarDTO.PizzaSabor := TRttiEnumerationType.GetValue<TPizzaSaborEnum>(cmbSaborPizza.Text);
      LPedidoEfetuarDTO.NumeroDocumento := edtDocumentoCliente.Text;

      mmRetornoWebService.Text := LRESTClient.doPOST('/efetuarpedido', [],
        TJson.ObjectToJsonString(LPedidoEfetuarDTO)).BodyAsString();
    finally
      LPedidoEfetuarDTO.Free();
    end;
  finally
    LRESTClient.Free();
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  LRESTClient: TRESTClient;
  LRetorno: TJSONValue;
  LRESTResponse: IRESTResponse;
begin
  LRESTClient := TRESTClient.Create(edtEnderecoBackend.Text, string(edtPortaBackend.Text).ToInteger());
  LRESTClient.ReadTimeOut(60000);
  LRESTResponse := LRESTClient.doGET('/buscarpedido', [edtDocumentoCliente.Text]);
  if LRESTResponse.BodyAsString().ToLower().Contains('exception') then
  begin
    mmRetornoWebService.Text := LRESTResponse.BodyAsString();
    Exit();
  end;
  LRetorno := TJSONObject.ParseJSONValue(LRESTResponse.BodyAsString());
  mmRetornoWebService.Lines.Add(StringOfChar('-', 10));
  mmRetornoWebService.Lines.Add('Sabor=' + LRetorno.GetValue<string>('PizzaSabor'));
  mmRetornoWebService.Lines.Add('Tamanho=' + LRetorno.GetValue<string>('PizzaTamanho'));
  mmRetornoWebService.Lines.Add('Valor=' + LRetorno.GetValue<Double>('ValorTotalPedido').ToString());
  mmRetornoWebService.Lines.Add('Tempo Preparo=' + LRetorno.GetValue<Integer>('TempoPreparo').ToString());
  mmRetornoWebService.Lines.Add(StringOfChar('-', 10));
end;

end.
