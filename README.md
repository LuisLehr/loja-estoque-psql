# Banco de Dados Loja Estoque

## Visão Geral

Projeto de estudo de banco de dados relacional desenvolvido em PostgreSQL, modelando o sistema de uma loja de calçados com controle de estoque, vendas, clientes, funcionários e fornecedores. O objetivo é cobrir na prática os principais recursos do PostgreSQL: modelagem, seeds, views, functions, procedures, triggers e consultas analíticas.

**Contexto:** Loja de calçados fictícia localizada em Porto Alegre/RS, com múltiplos fornecedores, locais de estoque e registro completo do ciclo de venda.

## Estrutura do Projeto

```
Banco de Dados Loja_Estoque/
└── Codigos/
    ├── 01 - schemas/       # Criação das tabelas e relacionamentos (23 arquivos)
    ├── 02 - seeds/         # Dados iniciais para teste (1 arquivo)
    ├── 03 - views/         # Views analíticas e operacionais (10 arquivos)
    ├── 04 - functions/     # Functions e functions de trigger (9 arquivos)
    ├── 05 - procedures/    # Procedures de negócio (3 arquivos)
    ├── 06 - triggers/      # Definição dos triggers (5 arquivos)
    └── 07 - selects/       # Consultas analíticas avulsas (2 arquivos)
```

## Schemas

O banco é composto por 23 tabelas organizadas em domínios. Cada tabela tem sua PK definida via `GENERATED ALWAYS AS IDENTITY` e todas as FKs nomeadas com `ON DELETE RESTRICT`.

| Tabela | Descrição |
| --- | --- |
| `CLIENTE` | Dados cadastrais do cliente |
| `CLIENTE_CONTATO` | Contatos do cliente (EMAIL, TELEFONE, WHATSAPP) |
| `CLIENTE_ENDERECO` | Endereços do cliente |
| `CARGOS` | Lookup de cargos dos funcionários |
| `FUNCIONARIOS` | Dados cadastrais dos funcionários |
| `FUNCIONARIO_CONTATO` | Contatos do funcionário |
| `FUNCIONARIO_ENDERECO` | Endereços do funcionário |
| `FORNECEDOR` | Empresa fornecedora (nome fantasia) |
| `FORNECEDOR_UNIDADE` | Unidades/filiais do fornecedor com CNPJ próprio |
| `FORNECEDOR_ENDERECO` | Endereços da unidade do fornecedor |
| `FORNECEDOR_CONTATO` | Contatos da unidade do fornecedor |
| `CATEGORIA` | Categorias de produtos |
| `PRODUTOS` | Catálogo de produtos |
| `LOCAL_ESTOQUE` | Locais de armazenamento (estoque, vitrine, depósito) |
| `ESTOQUE` | Posição de estoque por produto × local |
| `FORMA_PAGAMENTO` | Lookup de formas de pagamento |
| `VENDA` | Cabeçalho da venda |
| `VENDA_ITEM` | Itens de cada venda |
| `PAGAMENTO` | Pagamentos vinculados à venda |
| `TIPO_MOVIMENTO_ESTOQUE` | Lookup de tipos de movimento |
| `MOVIMENTO_ESTOQUE` | Histórico de movimentos de estoque |
| `HISTORICO_PRECO_PRODUTO` | Auditoria de alterações de preço |

**Destaques de design:**

- Colunas calculadas com `GENERATED ALWAYS AS ... STORED` em `VENDA.VALOR_TOTAL` e `VENDA_ITEM.SUBTOTAL`
- `TIMESTAMPTZ` em `ESTOQUE.DATA_ATUALIZACAO` e `MOVIMENTO_ESTOQUE.DATA_MOVIMENTO`
- `UNIQUE(ID_PRODUTO, ID_LOCAL)` em `ESTOQUE` para evitar duplicidade
- `HISTORICO_PRECO_PRODUTO` sem FK para `PRODUTOS` (tabela de auditoria independente)

## Seeds

O arquivo `02 - seeds/seeds.sql` popula todas as tabelas em ordem de dependência de FK, sem necessidade de ajuste manual.

| Tabela | Registros |
| --- | --- |
| CARGOS | 5 |
| FUNCIONARIOS | 5 |
| CLIENTES | 10 |
| FORNECEDORES / UNIDADES | 3 / 5 |
| CATEGORIAS | 8 |
| PRODUTOS | 15 |
| LOCAIS DE ESTOQUE | 3 |
| REGISTROS DE ESTOQUE | 20 |
| FORMAS DE PAGAMENTO | 5 |
| TIPOS DE MOVIMENTO | 5 |
| VENDAS | 15 |
| ITENS DE VENDA | 20 |
| PAGAMENTOS | 14 |
| MOVIMENTOS DE ESTOQUE | 40 |

As vendas cobrem maio e junho/2026 com status variados (`CONCLUIDA`, `ABERTA`, `CANCELADA`) e pagamentos em diferentes estados (`PAGO`, `PENDENTE`), permitindo testar todos os cenários das views e procedures.

**Como executar:**

```sql
-- Via pgAdmin: abrir o arquivo no Query Tool e executar com F5
-- Via terminal:
psql -U postgres -d LOJA -f seeds.sql
```

> Caso precise resetar os dados, execute o comando abaixo antes de rodar os seeds novamente:

```sql
TRUNCATE TABLE MOVIMENTO_ESTOQUE, PAGAMENTO, VENDA_ITEM, VENDA,
    ESTOQUE, PRODUTOS, LOCAL_ESTOQUE, FORMA_PAGAMENTO,
    TIPO_MOVIMENTO_ESTOQUE, FORNECEDOR_CONTATO, FORNECEDOR_ENDERECO,
    FORNECEDOR_UNIDADE, FORNECEDOR, CATEGORIA, CLIENTE_ENDERECO,
    CLIENTE_CONTATO, CLIENTE, FUNCIONARIO_ENDERECO,
    FUNCIONARIO_CONTATO, FUNCIONARIOS, CARGOS
RESTART IDENTITY CASCADE;
```

## Views

10 views cobrindo os principais relatórios operacionais e analíticos da loja.

| Arquivo | View | Descrição |
| --- | --- | --- |
| 01 | `v_informacoes_cliente` | Ficha completa do cliente com contatos agregados e endereço |
| 02 | `v_informacoes_funcionarios` | Ficha completa do funcionário com contatos e cargo |
| 03 | `v_quantidade_abaixo` | Produtos com estoque igual ou abaixo do mínimo |
| 04 | `v_vendas_em_aberto` | Vendas abertas ou com pagamento pendente, com itens e contato do cliente |
| 05 | `v_produto_estoque` | Posição de estoque por produto e local |
| 06 | `v_mais_vendidos` | Ranking de produtos por quantidade vendida (só vendas concluídas) |
| 07 | `v_valores_clientes` | Quantidade comprada e valor total por cliente |
| 08 | `v_vendas_funcionarios` | Quantidade vendida e valor total por funcionário |
| 09 | `v_vendas_periodo` | Resumo mensal de vendas com nome do mês em português |
| 10 | `v_produto_categoria_fornecedor_inativo` | Todos os registros inativos de produtos, categorias e fornecedores via `UNION ALL` |

## Functions

9 arquivos: 4 functions de negócio e 5 functions de trigger.

**Functions de negócio**

| Arquivo | Function | Retorno | Descrição |
| --- | --- | --- | --- |
| 01 | `fn_total_gasto_cliente(id)` | `NUMERIC` | Valor total gasto por um cliente em vendas concluídas |
| 02 | `fn_quantia_estoque_adequado(id)` | `BOOLEAN` | Retorna `true` se o estoque do produto está acima do mínimo |
| 03 | `fn_total_produto_estoque(id)` | `TABLE` | Quantidade do produto por local de estoque |
| 04 | `fn_ticket_medio_periodo(início, fim)` | `NUMERIC` | Ticket médio das vendas em um intervalo de datas |

**Functions de trigger**

| Arquivo | Function | Descrição |
| --- | --- | --- |
| 05 | `fn_tg_atualiza_data_estoque()` | Atualiza `DATA_ATUALIZACAO` automaticamente no UPDATE do estoque |
| 06 | `fn_tg_verifica_estoque()` | Bloqueia INSERT em `VENDA_ITEM` se o estoque for insuficiente |
| 07 | `fn_tg_valida_exclusao_cliente()` | Bloqueia DELETE em `CLIENTE` se houver vendas vinculadas |
| 08 | `fn_tg_log_alteracao_preco_produto()` | Grava preço anterior e novo em `HISTORICO_PRECO_PRODUTO` |
| 09 | `fn_tg_registra_movimento_estoque()` | Registra saída em `MOVIMENTO_ESTOQUE` após INSERT em `VENDA_ITEM` |

**Exemplos de uso:**

```sql
SELECT fn_total_gasto_cliente(1);
SELECT fn_quantia_estoque_adequado(3);
SELECT * FROM fn_total_produto_estoque(1);
SELECT fn_ticket_medio_periodo('2026-05-01', '2026-05-31');
```

## Procedures

3 procedures cobrindo as operações de negócio que envolvem múltiplas tabelas numa transação só.

| Arquivo | Procedure | Parâmetros | Descrição |
| --- | --- | --- | --- |
| 01 | `pr_entrada_estoque` | `id_produto, quantidade, local, observacao` | Atualiza o estoque e registra movimento de entrada |
| 02 | `pr_troca_local_estoque` | `id_produto, local_inicial, local_final` | Move todo o estoque de um produto para outro local |
| 03 | `pr_cancela_venda` | `id_venda` | Cancela a venda, estorna o pagamento e devolve os itens ao estoque via loop |

**Exemplos de uso:**

```sql
CALL pr_entrada_estoque(1, 20, 1, 'Reposição - julho/2026');
CALL pr_troca_local_estoque(1, 1, 3);
CALL pr_cancela_venda(6);
```

## Triggers

5 triggers cobrindo automação, validação e auditoria. Cada trigger tem sua function de trigger separada na pasta `04 - functions`.

| Arquivo | Trigger | Evento | Tabela | Descrição |
| --- | --- | --- | --- | --- |
| 01 | `tg_atualiza_data_estoque` | `BEFORE UPDATE` | `ESTOQUE` | Grava timestamp automático em `DATA_ATUALIZACAO` |
| 02 | `tg_verifica_estoque` | `BEFORE INSERT` | `VENDA_ITEM` | Bloqueia a venda se não houver estoque suficiente |
| 03 | `tg_verifica_exclusao_cliente` | `BEFORE DELETE` | `CLIENTE` | Impede exclusão de cliente com vendas associadas |
| 04 | `tg_log_alteracao_preco_produto` | `AFTER UPDATE OF preco` | `PRODUTOS` | Registra histórico de preço somente quando o preço mudar |
| 05 | `tg_registra_movimento_estoque` | `AFTER INSERT` | `VENDA_ITEM` | Registra saída automática no `MOVIMENTO_ESTOQUE` |

## Selects

2 consultas analíticas avulsas para uso direto no pgAdmin ou DataGrip.

| Arquivo | Descrição |
| --- | --- |
| 01 - `valor_venda_clientes.sql` | Valor total comprado por cliente, ordenado do maior para o menor |
| 02 - `valor_cliente.sql` | Valor total de um cliente específico, filtrado pelo nome via `LIKE` |

## Como Executar

**Pré-requisitos:** PostgreSQL 13+ instalado (versão mínima para `GENERATED ALWAYS AS ... STORED`).

1. Crie o banco de dados:

```sql
CREATE DATABASE LOJA;
```

2. Conecte ao banco `LOJA` e execute os schemas na ordem numérica (01 ao 23).
3. Execute os arquivos de functions (`04 - functions`) antes dos triggers (`06 - triggers`), pois os triggers dependem das functions.
4. Execute as procedures (`05 - procedures`).
5. Execute as views (`03 - views`).
6. Rode o seed completo:

```sql
-- Via pgAdmin: abrir seeds.sql no Query Tool → Ctrl+A → F5
-- Via terminal:
psql -U postgres -d LOJA -f "02 - seeds/seeds.sql"
```

**Ordem resumida de execução:**

```
01 - schemas → 04 - functions → 06 - triggers → 05 - procedures → 03 - views → 02 - seeds
```

## Tecnologias

| Tecnologia | Versão mínima | Uso |
| --- | --- | --- |
| PostgreSQL | 13+ | Banco de dados principal |
| pgAdmin | 4+ | Interface gráfica para execução e inspeção |
| Git / GitHub | — | Versionamento do projeto |
