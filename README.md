Projeto Billinho
================

Clique [aqui](docs/getting_started.md) para ver como instalar e configurar o projeto base.

O projeto Billinho tem como objetivo simular uma API de gerenciamento das mensalidades pagas pelos alunos à instituição de ensino que ele estuda.

Introdução
----------

A empresa Quero Educação está desenvolvendo um sistema para ajudar os alunos a gerenciar suas mensalidades! Esse sistema está quase pronto, mas ainda não foi implementada a API principal dele, e cabe a você ajudar a Quero a bater essa meta e desenvolver uma API em Ruby on Rails.

Entidades
---------

A API deve ser feita com base nas entidades `Instituição, Aluno e Matrícula`.

#### Instituição de Ensino

| Campo         | Tipo          | Restrições                                               |
| ------------- | ------------- | -------------------------------------------------------- |
| Nome          | Texto         | Não pode estar vazio e deve ser único                    |
| CNPJ          | Texto         | Deve conter apenas caracteres numéricos e deve ser único |
| Tipo          | Texto         | `Universidade, Escola ou Creche`                         |

#### Aluno

| Campo                         | Tipo    | Restrições                                                                     |
|-------------------------------|---------| ------------------------------------------------------------------------------ |
| Nome                          | Texto   | Deve ser único e não pode estar vazio                                          |
| CPF                           | Texto   | Deve conter apenas caracteres numéricos, deve ser único e não pode estar vazio |
| Data de nascimento            | Data    |                                                                                |
| Telefone celular              | Inteiro |                                                                                |
| Gênero                        | Texto   | Não pode ser vazio e tem que estar entre `M ou F`                              |
| Meio de pagamento das faturas | Texto   | Não pode ser vazio e tem que estar entre `Boleto ou Cartão`                    |

#### Matrícula

| Campo                            | Tipo              | Restrições           |
|--------------------------------- |-------------------| -------------------- |
| Valor total do curso em reais    | Decimal           | Não pode estar vazio |
| Quantidade de faturas            | Inteiro           | Não pode estar vazio |
| Dia de vencimento das faturas    | Inteiro           | Não pode estar vazio |
| ID da Instituição                | Chave Estrangeira | Não pode estar vazio |
| ID do aluno                      | Chave Estrangeira | Não pode estar vazio |

#### Faturas

| Campo                            | Tipo              | Restrições           |
|--------------------------------- |-------------------| -------------------- |
| Valor da fatura em reais         | Decimal           | Não pode estar vazio |
| Data de vencimento               | Inteiro           | Não pode estar vazio |
| ID da Matricula                  | Chave Estrangeira | Não pode estar vazio |
| Status                           | Texto | Não pode estar vazio e tem que estar dentro dos valores `Aberta`, `Atrasada ou Paga` sendo o valor default `Aberta` |
