# Desafio de Programação - Eng. Suporte Jr. - Cumbuca

Bem-vindo ao repositório da minha solução para o Desafio de Programação da Cumbuca! Este repositório contém a ferramenta CLI desenvolvida para resolver o problema de numeração dos reis e rainhas de Cumbúquia.

## Índice

- [Introdução](#introdução)
- [Ferramenta](#ferramenta)
- [Como Usar](#como-usar)

## Introdução

O reino de Cumbúquia perdeu os registros históricos de sua família real, e agora ninguém sabe mais a numeração correta dos reis e rainhas do país. Como o melhor programador de Cumbúquia, desenvolvi uma ferramenta de linha de comando em Elixir para resolver essa crise.

## Ferramenta

Como especificado ferramenta de linha de comando desenvolvida recebe uma lista dos nomes em ordem e retorna os mesmos nomes, cada um com sua devida numeração em algarismos romanos.

Por exemplo, se a lista for:

```
Eduardo
Maria
Daniel
Eduardo
```

A ferramenta emitirá a seguinte saída:

```
Eduardo I
Maria I
Daniel I
Eduardo II
```

Se a lista for:

```
João
João
João
João
```

A saída será:

```
João I
João II
João III
João IV
```

## Como Usar

Para usar a ferramenta, siga os passos abaixo:

1. Clone o repositório:
   ```sh
   git clone https://github.com/lucas-o-ferreira/desafio_cli_cumbuca
   ```
2. Navegue até o diretório do projeto:
   ```sh
   cd desafio-cli
   ```
3. Compile o projeto:
   ```sh
   mix escript.build
   ```
4. Execute a ferramenta:
   ```sh
   ./desafio_cumbuca
   ```

A ferramenta exibirá uma breve explicação de uso e aguardará a inserção de uma lista de nomes. Os nomes devem ser inseridos um por linha e a lista será considerada terminada quando for lida uma linha em branco. Após a finalização da lista, a ferramenta repetirá os nomes inseridos, acrescidos da numeração romana conforme necessário. Então ela se certificará de que o usuário terminou de usar o programa.
