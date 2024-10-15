# Desafio Técnico Desenvolvedor Junior

- [x] - Criar classe com os campos: cep, logradouro, complemento, bairro, localidade, uf, ibge, gia, ddd, siafi
- [x] - Cria tabela TspdCep com as seguintes colunas: cep, logradouro, complemento, bairro, localidade, uf, ibge, gia, ddd, siafi
- [x] - Criar método ConsultarCep, que deverá consumir a rota seguindo o exemplo -> https://viacep.com.br/ws/83503070/json/

```json
{
  "cep": "83503-070",
  "logradouro": "Rua Nossa Senhora do Rocio",
  "complemento": "",
  "bairro": "Vila Alto Pinheiros",
  "localidade": "Almirante Tamandaré",
  "uf": "PR",
  "ibge": "4100400",
  "gia": "",
  "ddd": "41",
  "siafi": "7407"
}
```

- [x] - O Json retornado deverá preencher sua classe.
- [x] - Após a classe ser preenchida com o retorno da API, devemos salvar na tabela TspdCep, incluindo se for novo e alterando se já existir.
- [x] - Criar um exemplo de select onde retorne todos os CEPs do estado do PR.

```sql
`SELECT` * `FROM` "tspdcep"
`WHERE` uf = 'PR';
```

- [x] - Criar uma collection que consuma essa mesma API, com um GET para o CEP da TecnoSpeed e um GET utilizando logradouro.
- [x] - Criar um repositório na sua conta GitHub como nome devdesktopjunior
- [x] - Commitar os fontes da seu projeto ConsultaCep, o script da sua tabela e também com a sua collection com a seguinte mensagem “DEV - Desktop Junior”
- [x] - Ao commitar no Github, criar uma branch com nome devjunior.
- [x] - Criar um merge request do seu commit.
