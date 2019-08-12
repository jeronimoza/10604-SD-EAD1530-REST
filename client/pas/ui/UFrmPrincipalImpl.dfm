object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Client'
  ClientHeight = 250
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 93
    Width = 90
    Height = 13
    Caption = 'Tamanho da Pizza:'
  end
  object Label2: TLabel
    Left = 16
    Top = 136
    Width = 74
    Height = 13
    Caption = 'Sabor da Pizza:'
  end
  object Label3: TLabel
    Left = 312
    Top = 8
    Width = 118
    Height = 13
    Caption = 'Retorno do WebService:'
  end
  object edtDocumentoCliente: TLabeledEdit
    Left = 16
    Top = 64
    Width = 193
    Height = 21
    EditLabel.Width = 98
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#250'mero Documento:'
    TabOrder = 0
  end
  object cmbTamanhoPizza: TComboBox
    Left = 16
    Top = 109
    Width = 193
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    Items.Strings = (
      'enPequena'
      'enMedia'
      'enGrande')
  end
  object cmbSaborPizza: TComboBox
    Left = 16
    Top = 155
    Width = 193
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    Items.Strings = (
      'enCalabresa'
      'enMarguerita'
      'enPortuguesa')
  end
  object Button1: TButton
    Left = 16
    Top = 216
    Width = 95
    Height = 25
    Caption = '&1 - Fazer Pedido'
    TabOrder = 3
    OnClick = Button1Click
  end
  object mmRetornoWebService: TMemo
    Left = 312
    Top = 25
    Width = 265
    Height = 217
    Lines.Strings = (
      'mmRetornoWebService')
    TabOrder = 4
  end
  object edtEnderecoBackend: TLabeledEdit
    Left = 16
    Top = 24
    Width = 180
    Height = 21
    EditLabel.Width = 131
    EditLabel.Height = 13
    EditLabel.Caption = 'Endere'#231'o Pizzaria Backend:'
    TabOrder = 5
    Text = 'http://localhost'
  end
  object Button2: TButton
    Left = 114
    Top = 216
    Width = 95
    Height = 25
    Caption = '&2 - Buscar Pedido'
    TabOrder = 6
    OnClick = Button2Click
  end
  object edtPortaBackend: TLabeledEdit
    Left = 200
    Top = 24
    Width = 80
    Height = 21
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Caption = 'Porta'
    TabOrder = 7
    Text = '8080'
  end
end
