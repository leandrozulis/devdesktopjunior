unit test_viaCep;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TestCep = class
  public
    [Test]
    procedure TestarCepValido;
    [Test]
    procedure TestarCepInvalido;
  end;

implementation

uses
  viaCep;

{ TestCep }

procedure TestCep.TestarCepValido;
var
  CepValido: string;
begin
  CepValido := '87047550';

  Assert.AreEqual('87047550', CepValido);
end;

procedure TestCep.TestarCepInvalido;
var
  CepInvalido: string;
begin
  CepInvalido := '123';

  Assert.IsTrue(Length(CepInvalido) <> 8, 'O CEP deve ter 8 caracteres');
end;

initialization
  TDUnitX.RegisterTestFixture(TestCep);

end.

