unit Entity.Cadastro.Produto;

interface

uses
	Data.DB,
	FireDAC.Comp.Client,
	System.SysUtils,
	System.Math;

type
	TProduto = class
		private
			FId        : Integer;
			FDescricao : string;
			FImagem    : TFDMemTable;
			FExtensao  : String;
		protected
		public
			property id        : Integer read FId write FId;
			property descricao : String read FDescricao write FDescricao;
			property imagem    : TFDMemTable read FImagem write FImagem;
			property extensao  : String read FExtensao write FExtensao;
			constructor Create(); reintroduce; overload;
			destructor Destroy; override;
	end;

implementation

{ TProduto }

constructor TProduto.Create;
begin
	FId        := ZeroValue;
	FDescricao := EmptyStr;
	FImagem    := TFDMemTable.Create(nil);
	FImagem.FieldDefs.Add('Imagem', ftBlob);
	FImagem.FieldDefs.Add('Imagem2', ftBlob);
	FImagem.CreateDataSet;
	FImagem.Edit;
  FExtensao := EmptyStr;
end;

destructor TProduto.Destroy;
begin
	FreeAndNil(FImagem);
	inherited;
end;

end.
