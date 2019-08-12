unit UPedidoRetornoDTOImpl;

interface

uses

  UPizzaTamanhoEnum,
  UPizzaSaborEnum;

type
  TPedidoRetornoDTO = class
  strict private
    FPizzaTamanho: TPizzaTamanhoEnum;
    FPizzaSabor: TPizzaSaborEnum;
    FValorTotalPedido: Currency;
    FTempoPreparo: Integer;
  public
    constructor Create(const APizzaTamanho: TPizzaTamanhoEnum; const APizzaSabor: TPizzaSaborEnum;
      const AValorTotalPedido: Currency; const ATempoPreparo: Integer); reintroduce;
    property PizzaTamanho: TPizzaTamanhoEnum read FPizzaTamanho write FPizzaTamanho;
    property PizzaSabor: TPizzaSaborEnum read FPizzaSabor write FPizzaSabor;
    property ValorTotalPedido: Currency read FValorTotalPedido write FValorTotalPedido;
    property TempoPreparo: Integer read FTempoPreparo write FTempoPreparo;
  end;

implementation

{ TPedidoRetornoDTO }

constructor TPedidoRetornoDTO.Create(const APizzaTamanho: TPizzaTamanhoEnum; const APizzaSabor: TPizzaSaborEnum; const AValorTotalPedido: Currency;
  const ATempoPreparo: Integer);
begin
  FPizzaTamanho := APizzaTamanho;
  FPizzaSabor := APizzaSabor;
  FValorTotalPedido := AValorTotalPedido;
  FTempoPreparo := ATempoPreparo;
end;

end.
