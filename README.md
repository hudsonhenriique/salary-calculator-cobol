# Sistema de Cálculo Salarial em COBOL

![COBOL](https://img.shields.io/badge/COBOL-Mainframe-blue?style=for-the-badge)
![TK4-IBM%20System%2F370-darkgreen?style=for-the-badge](https://img.shields.io/badge/TK4-IBM%20System%2F370-darkgreen?style=for-the-badge)
![zOS](https://img.shields.io/badge/Mainframe-Legacy%20Systems-black?style=for-the-badge)

## Sobre o Projeto

O **Sistema de Cálculo Salarial** é uma aplicação desenvolvida em **COBOL**, executada em ambiente **TK4-/MVS**, com foco na prática de programação procedural em sistemas legados de mainframe.

O projeto simula um sistema corporativo de cálculo salarial, permitindo calcular bônus por tempo de empresa e gerar o salário final de funcionários através de uma interface interativa via terminal.

Além dos requisitos principais, o sistema implementa funcionalidades extras como:

- menu interativo;
- repetição contínua com `PERFORM UNTIL`;
- modularização procedural;
- validação básica de dados;
- organização em parágrafos COBOL.

O objetivo do projeto foi consolidar conhecimentos relacionados à linguagem COBOL e ao ecossistema de desenvolvimento em mainframe.

---

# Funcionalidades

## Entrada de Dados

O sistema recebe:

- Nome do funcionário
- Salário base
- Tempo de empresa

---

## Cálculo de Bônus

O bônus é calculado automaticamente conforme o tempo de empresa:

| Tempo de Empresa | Percentual |
|---|---|
| Até 1 ano | 5% |
| 2 a 5 anos | 10% |
| Acima de 5 anos | 15% |

---

## Resumo do Pagamento

Após o processamento, o sistema exibe:

- Nome do funcionário
- Salário base
- Valor do bônus
- Salário final

---

## Menu Interativo

O programa possui:

- Menu principal
- Repetição contínua
- Opção segura de encerramento

---

## Validação de Dados

Implementação de validação básica para:

- salário igual a zero;
- controle de fluxo do programa;
- entrada de dados.

---

# Estrutura do Programa

O sistema foi organizado utilizando modularização procedural com `PERFORM`.

```text
MAIN-PROCEDURE
│
├── MENU-LOOP
├── INPUT-DATA
├── VALIDATE-DATA
├── CALCULATE-BONUS
├── CALCULATE-SALARY
└── DISPLAY-RESULT
```

---

# Tecnologias Utilizadas

- COBOL
- TK4-/MVS
- JCL
- Console Application

---

# Conceitos Aplicados

## Programação Procedural

Uso de:

- parágrafos;
- modularização;
- separação de responsabilidades;
- fluxo procedural.

---

## Manipulação de Dados

Utilização de:

- `WORKING-STORAGE SECTION`
- `PIC`
- variáveis numéricas
- variáveis alfanuméricas
- máscaras de exibição

---

## Controle de Fluxo

Aplicação de:

- `PERFORM`
- `PERFORM UNTIL`
- `IF`
- `COMPUTE`
- `MOVE`

---

## Formatação Monetária

Uso de máscaras COBOL para exibição formatada:

```cobol
PIC ZZZZZ9.99
```

---

# Como Executar o Projeto

## Pré-requisitos

- Ambiente TK4-/MVS configurado
- Compilador COBOL
- JCL configurado para compilação e execução

---

## Fluxo de Execução

```text
1 - Calcular Salário
2 - Sair
```

Ao selecionar a opção de cálculo:

1. O sistema solicita os dados do funcionário
2. Calcula o bônus automaticamente
3. Calcula o salário final
4. Exibe o resumo do pagamento

---

# Regras de Negócio

- Funcionários com até 1 ano recebem 5% de bônus
- Funcionários entre 2 e 5 anos recebem 10%
- Funcionários acima de 5 anos recebem 15%

Cálculo aplicado:

```text
Salário Final = Salário Base + Bônus
```

---

# Objetivos do Projeto

Este projeto teve como objetivo praticar:

- Desenvolvimento em COBOL
- Programação procedural
- Modularização com PERFORM
- Estruturação de programas em mainframe
- Manipulação de variáveis
- Cálculos financeiros
- Desenvolvimento em ambiente legado IBM

---

# Autor

**Hudson Henrique**

- GitHub: https://github.com/hudsonhenriique
- LinkedIn: https://www.linkedin.com/in/hudsonhenri
