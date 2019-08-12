unit PizzariaBackendController;

interface

uses
  System.SysUtils,
  System.StrUtils,
  REST.Json,
  System.JSON,
  MVCFramework,
  MVCFramework.Logger,
  MVCFramework.Commons;

type

  [MVCPath('/')]
  TPizzariaController = class(TMVCController) 
  protected
    procedure OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean); override;
    procedure OnAfterAction(Context: TWebContext; const AActionName: string); override;
  public
    [MVCPath('/')]
    [MVCHTTPMethod([httpGET])]
    procedure Index();

    [MVCPath('/reversedstrings/($Value)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetReversedString(const Value: String);

    //Sample CRUD Actions for a "Customer" entity
    [MVCPath('/customers')]
    [MVCHTTPMethod([httpGET])]
    procedure GetCustomers;

    [MVCPath('/customers/($id)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetCustomer(id: Integer);

    [MVCPath('/customers')]
    [MVCHTTPMethod([httpPOST])]
    procedure CreateCustomer;

    [MVCPath('/customers/($id)')]
    [MVCHTTPMethod([httpPUT])]
    procedure UpdateCustomer(id: Integer);

    [MVCPath('/customers/($id)')]
    [MVCHTTPMethod([httpDELETE])]
    procedure DeleteCustomer(id: Integer);

    [MVCPath('/efetuarpedido')]
    [MVCHTTPMethod([httpPOST])]
    procedure EfetuarPedido();

    [MVCPath('/buscarpedido/($numerodocumento)')]
    [MVCHTTPMethod([httpGET])]
    procedure BuscarPedido();
  end;

implementation

uses
  UPedidoServiceIntf,
  UPedidoServiceImpl,
  UPedidoEfetuarDTOImpl,
  UPedidoRetornoDTOImpl;

procedure TPizzariaController.Index();
begin
  //use Context property to access to the HTTP request and response
  Render('Hello DelphiMVCFramework World');
end;

procedure TPizzariaController.GetReversedString(const Value: String);
begin
  Render(System.StrUtils.ReverseString(Value.Trim));
end;

procedure TPizzariaController.OnAfterAction(Context: TWebContext; const AActionName: string); 
begin
  { Executed after each action }
  inherited;
end;

procedure TPizzariaController.OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean);
begin
  { Executed before each action
    if handled is true (or an exception is raised) the actual
    action will not be called }
  inherited;
end;

//Sample CRUD Actions for a "Customer" entity
procedure TPizzariaController.GetCustomers;
begin
  //todo: render a list of customers
end;

procedure TPizzariaController.GetCustomer(id: Integer);
begin
  //todo: render the customer by id
end;

procedure TPizzariaController.BuscarPedido();
var
  LPedidoService: IPedidoService;
  LPedidoRetornoDTO: TPedidoRetornoDTO;
begin
  LPedidoService := TPedidoService.Create();
  if Context.Request.Params['numerodocumento'].IsEmpty() then
    raise Exception.Create('O número do documento é obrigatório.');
  LPedidoRetornoDTO := LPedidoService.BuscarPedido(Context.Request.Params['numerodocumento']);
  Render(LPedidoRetornoDTO);
end;

procedure TPizzariaController.CreateCustomer;

begin
  //todo: create a new customer
end;

procedure TPizzariaController.UpdateCustomer(id: Integer);
begin
  //todo: update customer by id
end;

procedure TPizzariaController.DeleteCustomer(id: Integer);
begin
  //todo: delete customer by id
end;


procedure TPizzariaController.EfetuarPedido();
var
  LPedidoService: IPedidoService;
  LPedidoEfetuarDTO: TPedidoEfetuarDTO;
  LPedidoRetornoDTO: TPedidoRetornoDTO;
begin
  LPedidoService := TPedidoService.Create();
  LPedidoEfetuarDTO := Context.Request.BodyAs<TPedidoEfetuarDTO>;
  try
    LPedidoRetornoDTO := LPedidoService.efetuarPedido(
      LPedidoEfetuarDTO.PizzaTamanho,
      LPedidoEfetuarDTO.PizzaSabor,
      LPedidoEfetuarDTO.NumeroDocumento);
    Render(LPedidoRetornoDTO);
  finally
    LPedidoEfetuarDTO.Free();
  end;
end;

end.
