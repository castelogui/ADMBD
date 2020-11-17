# Sistema de Compra e Entrega de Produtos farmaceuticos

## Diagrama ER

![Diagrama ER](./Diagrama%20de%20ER%20Atividade%20Final%20-%20Farmácia.jpg)

## Descrição

No sistema a farmacia revende produtos farmaceutiucos para clientes através de  um serviço online. Os funcionarios da empresa deverão ter um id para autorizar a venda dos produtos pelo aplicativo. O cliente deve se cadastrar no sistema para conseguir fazer pedidos. O cliente pode comprar varios produtos em um pedido. Haverão produtos em que será necessario a apresentação da receita. O cliente precisa tirar uma foto da receita na hora de fechar o pedido e aguardar a avaliação do funcionario. Os produtos poderão ser pagos no final do pedido ou na entrega. O pedido deve ser entregue por um funcionario cadastrado no sistema. O entregador deverá entregar o pedido no endereço informado pelo cliente, possivelmente ficando encarregado de receber o valor do pagamento. No final da entrega o entregador deverá marcar o pedido como entregue e/ou pago.

## Análise de Caso

#### Funcionalidades do sistema

  - vender produtos
  - cadastrar cliente
  - cadastrar funcionario
  - fazer pedidos
  - apresentar receita
  - avaliar receita
  - pagar pedido
  - entregar pedido
  - cadastrar entregador
  - receber pagamento

### Entidades e atributos:

  - venda:
    - id
    - data_hora
    - descrição
    - id_cliente
    - id_pedido
    - id_funcionario
  - produto
    - id
    - nome
    - descrição
    - data_fab
    - data_val
    - receita
    - valor_un
    - valor_caixa
  - cliente
    - id
    - nome
    - cpf
    - endereço
    - data_nasc
  - funcionario
    - id
    - nome
    - cpf
    - cargo
  - pedido
    - id
    - descrição
    - produtos
    - qtd_produtos
    - data_hora_pedido
    - data_hora_entrega
    - valor_total
    - id_entregador
    - id_cliente
    - id_venda
  - receita
    - id
    - id_cliente
    - produtos
    - nome_doctor
    - data
  - pagamento
    - id
    - data_hora
    - valor
    - tipo
    - id_cliente
  - entrega
    - id
    - data_hora
    - descrição
    - id_pedido
    - id_entregador
  - entregador
    - id
    - nome
    - cpf