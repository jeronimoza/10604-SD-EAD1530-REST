unit UPedidoEfetuarDTOImpl;

interface

uses

  UPizzaTamanhoEnum,
  UPizzaSaborEnum;

type
  TPedidoEfetuarDTO = class
  strict private
    FpizzaTamanho: TPizzaTamanhoEnum;
    FpizzaSabor: TPizzaSaborEnum;
    FnumeroDocumento: string;
  public
    property pizzaTamanho: TPizzaTamanhoEnum read FpizzaTamanho write FpizzaTamanho;
    property pizzaSabor: TPizzaSaborEnum read FpizzaSabor write FpizzaSabor;
    property numeroDocumento: string read FnumeroDocumento write FnumeroDocumento;
  end;

implementation

end.
