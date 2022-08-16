# 📋 Exemplos de componentes em Flutter utilizando princípios NHIDS
Com o uso do Flutter como ferramenta para o FrontEnd das aplicações viu-se necessário a criação de exmplos de componentes comumente usados em nossos projetos.

&nbsp;

## Índice
 
 &nbsp;
 
 - [Dropdown](#dropdown)
 - [Table](#table)
 - [List](#list)
 - [ListItem](#list-item)

 &nbsp;

## 📃 Dropdown<a id="dropdown"></a>
No FLutter podemos contruir um dropdown utilizando ``widgets`` nativos da ferramenta, porém para uma melhor utilização/customização deste componente sera exibido um exemplo utilizando o ``package`` [DropdownButton2](https://pub.dev/packages/dropdown_button2). Sua utilização é bem semelhante ao nativo do Flutter porém possui um quantidade maior de parâmetros facilitando sua utilização. 

&nbsp;

### Exemplo um: Dropdown de ``strings``.
Neste primeiro exemplo teremos um exemplo de código utilizando ``strings`` como opções no ``dropdown``:
````
 @override
  Widget build(BuildContext context) {
    final dropValue = ValueNotifier('');
    final dropOptions = ['Matheus Mariano', 'Sérgio Silva', 'Wallace Pinho'];

    return ValueListenableBuilder(
      valueListenable: dropValue,
      builder: (BuildContext context, String value, _) {
        return Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: DropdownButtonFormField2<dynamic>(
                offset: const Offset(0, -20),
                decoration: InputDecoration(
                  label: Text('Colaborador'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                isExpanded: true,
                value: (value.isEmpty) ? null : value,
                onChanged: (choice) => dropValue.value = choice,
                items: dropOptions
                    .map((op) => DropdownMenuItem(
                          value: op,
                          child: Text(op),
                        ))
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
````
> Nota: Neste exemplo foi usado um ``ValueNotifier()`` para o controle de estado da caixa de seleção porém apenas como exemplo a forma de tal controle de estado pode ser a que melhor se encaixar na realidade do projeto. 

No exemplo podemos ver que devido ao fato do uso do ``ValueNotifier()`` o primeiro widget que devemos retornar ``ValueListenableBuilder()`` para que possamos fazer a mudança de estado ao selecionarmos um item da lista. Os ``widgets`` ``Expanded()`` e ``Flex()`` foram utilizados apenas para deixarem nosso componente responsivo ao tamanho da tela juntamente com o parâmetro ``isExpanded``. O tipo de dropdown utilizado no exmplo foi ``DropdownButtonFormField2()`` devido à sua aparencia de input de formulário podrem existem outros ``widgets`` que podem ser utilizados para a construção deste componente, é possível ter uma visão geral dele na documentação do Flutter [nesta seção](https://api.flutter.dev/flutter/material/DropdownButton-class.html). Seguindo na construção do componente é necessário que utilizemos parâmetros obrigatórios para o correto funcionamento do ``widget``, são eles:

- <strong>``value``</strong>: Parâmetro referente ao valor que o usuário selecionou dentre as opçoes do ``dropdown``. Em nosso exemplo foi feita uma validação para não ser exibido nada enquanto o usuário não escolher uma opção.

- <strong>``onChanged``</strong>: Função referente ao que acontece quando o usuário seleciona alguma das opções. No nosso exemplo ao selecinar um item ele aparece dentro da do input.

- <strong>``itens``</strong>: Lista com as opções que o usuário pode selecionar. É necessário que passemos um dado do tipo ``List``, representado no nosso exemplo pela ``final`` ``dropOptions``, e utilizarmos a função ``.map()`` para designarmos que cada uma das opções sejam compostas por um ``widget`` ``DropdownMenuItem()``.

Além dos parâmetros vistos anteriormente, pertencentes ao ``widget`` ``DropdownButtonFormField2`` precisamos fornecer os devidos parâmetros ao ``DropdownMenuItem()``, sendo eles:

- <strong>``value``</strong>: Valor que será retornado quando o usuário selecionar um item. No nosso exemplo o valor sera a ``String`` referente ao nome do colaborador escolhido.

- <strong>``child``</strong>: ``Widget`` de que será composto cada um dos itens da lista. Neste exemplo um simples ``Text()`` por se tratar de um retorno do tipo ``String``.
> Nota: Ao finalizar a codificação dos itens é necessário utilizar a função .toList() para que o componete funcione.

&nbsp;

### Exemplo dois: Dropdown de ``ListTile/NsjListItem``.
Este exemplo segue as mesmas implementações do anterior com a diferença de que foi usado um componete ``NsjListItem()``, para a composição dos items. Tal componente sera abordado posteriormente. 

````
 @override
  Widget build(BuildContext context) {
    final dropValue = ValueNotifier({});
    final dropOptions = employees;

    return ValueListenableBuilder(
      valueListenable: dropValue,
      builder: (BuildContext context, Map<dynamic, dynamic> value, _) {
        return Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: DropdownButtonFormField2<dynamic>(
                buttonHeight: 90,
                itemHeight: 100,
                offset: const Offset(0, -20),
                decoration: InputDecoration(
                  label: Text('Colaborador'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                isExpanded: true,
                value: (value.isEmpty) ? null : value,
                onChanged: (choice) => dropValue.value = choice,
                items: dropOptions
                    .map((op) => DropdownMenuItem(
                          value: op,
                          child: NsjListItem(
                            labels: employeesLabels,
                            rows: op,
                            title: 'nome',
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
````
> Nota: Note que foi necessário fazer algumas alterações para o uso do ``NsjListItem`` como a alteração do tipo fornecido ao ``ValueNotifier()`` e ao ``value`` do ``ValueListenableBuilder()``. Além da customização do tamanho do input para caber o respectivo item selecionado.

> Nota: Este exemplo é apenas para demostrar que é possívelo uso de outros ``widgets`` como itens porém não é aconselhavel seu uso devido a padrões de design/layout.

&nbsp;

## 📅 Table<a id="table"></a>
Nativamente o Flutter já possui um ``widget`` para a contrução de tabelas, nesta seção veremos como contruí-las.
````
 @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: DataTable(
              columns: [
                DataColumn(label: Text('Nome')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Equipe')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Matheus')),
                  DataCell(Text('matheusmariano@nasajon.com.br')),
                  DataCell(Text('Arquitetura')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Sergio')),
                  DataCell(Text('sergiosilva@nasajon.com.br')),
                  DataCell(Text('Arquitetura')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Wallace')),
                  DataCell(Text('wallacepinho@nasajon.com.br')),
                  DataCell(Text('Arquitetura')),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
````
> Nota: No exemplo acima alem da contrução do componente de tabela em si, representado pelo ``widget`` ``DataTable()``, foram utilizados os ``widgets`` ``Row()``,``Expanded()`` e ``Card()`` para a estilização e resposividade do mesmo.

Para contruirmos um componente de tabela é bem simples, basta utilizarmos o ``widget`` ``DataTable()`` e, em seus respectivos parâmetros ``columns`` e ``rows``, utilizarmos os ``widgets`` ``DataColumn()`` e ``DataRow()``. Em cada nova célula, representada pelo parâmetro ``cells``(que recebe uma lista), em ambos, utilizamos o ``widget`` ``DataCell()``, juntamente com um ``Text()`` para dispor as informações desejadas.

&nbsp;

## 📝 List<a id="list"></a>
Apesar de conseguirmos criar uma lista com ``widgets`` nativos do Flutter, devido à algumas especificidades dos projetos da nasajon foi criado um componente específico para atender à tais projetos. A seguir veremos seu funcionamento e utilização.
````
NsjList(
    list: employees,
    title: 'nome',
    labels: employeesLabels,
    onTap: () {},
    )
````
No exmplo acima podemos ver o uso do componente de lista e seus parâmetros obrigatórios. São eles:

- <strong>``list``</strong>: Lista que deve ser passada ao componente para que ele construa um item para cada elemento. No nosso exemplo foi passada a lista ``employees`` representada pelo arquivo ``employees.dart`` com o seguinte código: 
````
final employees = <Map<String, String>>[
  {
    'nome': 'Matheus Mariano',
    'equipe': 'Arquitetura',
    'email': 'matheusmariano@nasajon.com.br',
  },
  {
    'nome': 'Sergio Silva',
    'equipe': 'Arquitetura',
    'email': 'sergiosilva@nasajon.com.br',
  },
  {
    'nome': 'Wallace Pinho',
    'equipe': 'Arquitetura',
    'email': 'wallacepinho@nasajon.com.br',
  },
];
````
- <strong>``title``</strong>: Dado do tipo ``String`` que representa qual dos valores passados no mapa será o título do item.
- <strong>``labels``</strong>: Mapa referente à como as keys dos itens devem ser exibidas em tela uma vez que os dados recebidos em formato ``json`` não estão formatados. Em nosso exemplo foi usado o mapa ``employees_labels.dart`` com o código:
````
final employeesLabels = <String, String>{
  'nome': 'Nome',
  'equipe': 'Equipe',
  'email': 'Email',
};
````
- <strong>``onTap``</strong>: Função referente ao que acontece quando o usuário clica em um item da lista.

&nbsp;

## ✏️ ListItem<a id="list-item"></a>
O ListItem é uma extensão da List exemplificada acima, cada mapa passado ao componente de List é transformado em um ListItem porém podem existir casos em que precisamos apenas do ListItem como no primeiro exemplo deste documento onde usamos um ListItem como dorpdown. Seu funcionamneto é semelhante ao do componente de lista:
````
NsjListItem(
    labels: employeesLabels,
    rows: op,
    title: 'nome',
),
````
Como podemos ver no exemplo acima, retirado do nosso exemplo de dropdown, o ListItem possui quase os mesmos parâmetros que a List com a diferença que ao invés de passarmos uma lista a ser construída, passamo um mapa. Em nosso exemplo o mapa são as cada elemento ``op`` presente nas ``dropOptions``. 